using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace DynamicLibraryManagementApp
{
    public partial class UserProfile : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["member_id"].ToString() == "" || Session["member_id"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("UserLogin.aspx");
                }
                else
                {
                    getUserBookData();

                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        public void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + Session["member_id"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                txt_UserFullName.Text = dt.Rows[0]["full_name"].ToString();
                txt_UserDateofBirth.Text = dt.Rows[0]["dob"].ToString();
                txt_UserContractNumber.Text = dt.Rows[0]["contract_no"].ToString();
                txt_UserEmail.Text = dt.Rows[0]["email"].ToString();
                dd_UserState.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                txt_UserCity.Text = dt.Rows[0]["city"].ToString();
                txt_UserZipCode.Text = dt.Rows[0]["zipcode"].ToString();
                txt_UserFullAddress.Text = dt.Rows[0]["full_address"].ToString();
                txt_UserID.Text = dt.Rows[0]["member_id"].ToString();
                txt_UserProfileOldPassword.Text = dt.Rows[0]["password"].ToString();

                lbl_AccountStatus.Text = dt.Rows[0]["account_status"].ToString().Trim();

                if (dt.Rows[0]["account_status"].ToString().Trim() == "Active")
                {
                    lbl_AccountStatus.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "Pending")
                {
                    lbl_AccountStatus.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt.Rows[0]["account_status"].ToString().Trim() == "Deactive")
                {
                    lbl_AccountStatus.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    lbl_AccountStatus.Attributes.Add("class", "badge badge-pill badge-info");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        public void getUserBookData()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from book_issue_tbl where member_id='" + Session["member_id"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gv_UserProfile.DataSource = dt;
                gv_UserProfile.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void btn_UserProfileUpdate_Click(object sender, EventArgs e)
        {
            if (Session["full_name"].ToString() == "" || Session["full_name"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                updateUserPersonalDetails();

            }
        }

        public void updateUserPersonalDetails()
        {
            string password = "";
            if (txt_UserProfileNewPassword.Text.Trim() == "")
            {
                password = txt_UserProfileOldPassword.Text.Trim();
            }
            else
            {
                password = txt_UserProfileNewPassword.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("update member_master_tbl set full_name=@full_name, dob=@dob, contact_no=@contact_no, " +
                    "email=@email, state=@state, city=@city, zipcode=@zipcode, full_address=@full_address, password=@password, " +
                    "account_status=@account_status WHERE member_id='" + Session["member_id"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@full_name", txt_UserFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txt_UserDateofBirth.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txt_UserContractNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txt_UserEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@state", dd_UserState.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", txt_UserCity.Text.Trim());
                cmd.Parameters.AddWithValue("@zipcode", txt_UserZipCode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txt_UserFullAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    getUserPersonalDetails();
                    getUserBookData();
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void gv_UserProfile_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Check your condition here
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}

