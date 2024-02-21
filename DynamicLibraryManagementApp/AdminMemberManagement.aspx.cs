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
    public partial class AdminMemberManagement : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            gv_MemberList.DataBind();
        }

        protected void btn_MemberIDInfo_Click(object sender, EventArgs e)
        {
            getMemberbyID();
        }

        protected void btn_CheckActive_Click(object sender, EventArgs e)
        {
            if (checkMemberExist())
            {
                UpdateMemberStatusbyID("Active");
            }
            else
            {
                Response.Write("<script>alert('Member ID does not Exist.');</script>");
            }
        }

        protected void btn_Pause_Click(object sender, EventArgs e)
        {
            if (checkMemberExist())
            {
                UpdateMemberStatusbyID("Pending");
            }
            else
            {
                Response.Write("<script>alert('Member ID does not Exist.');</script>");
            }
        }

        protected void btn_Defaulter_Click(object sender, EventArgs e)
        {
            if (checkMemberExist())
            {
                UpdateMemberStatusbyID("Defaulter");
            }
            else
            {
                Response.Write("<script>alert('Member ID does not Exist.');</script>");
            }
        }


        bool checkMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl " +
                                                "WHERE member_id='" + txt_MemberID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }


        void getMemberbyID()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl " +
                                                "WHERE member_id='" + txt_MemberID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txt_FullName.Text = dt.Rows[0]["full_name"].ToString();
                    txt_AccountStatus.Text = dt.Rows[0]["account_status"].ToString();
                    txt_DOB.Text = dt.Rows[0]["dob"].ToString();
                    txt_ContactNo.Text = dt.Rows[0]["contract_no"].ToString();
                    txt_EmailID.Text = dt.Rows[0]["email"].ToString();
                    dd_MemberState.SelectedValue= dt.Rows[0]["state"].ToString();
                    txt_MemberCity.Text = dt.Rows[0]["city"].ToString();
                    txt_MemberZipCode.Text = dt.Rows[0]["zipcode"].ToString();
                    txt_FullAddress.Text = dt.Rows[0]["full_address"].ToString();

                    gv_MemberList.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Member ID does not exist');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdateMemberStatusbyID(string status)
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl " +
                                                "SET account_status='"+ status + "' " +
                                                "WHERE member_id='" + txt_MemberID.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Member Account status updated Successfully.');</script>");
                clearForm();
                gv_MemberList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void DeleteMemberPermanently()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl WHERE member_id='" + txt_MemberID.Text.Trim() + "'", con);


                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Member Deleted Permanently');</script>");
                clearForm();
                gv_MemberList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void clearForm()
        {
            txt_MemberID.Text = "";
            txt_FullName.Text = "";
            txt_AccountStatus.Text = "";
            txt_DOB.Text = "";
            txt_ContactNo.Text = "";
            txt_EmailID.Text = "";
            dd_MemberState.SelectedValue = "Select";
            txt_MemberCity.Text = "";
            txt_MemberZipCode.Text = "";
            txt_FullAddress.Text = "";
        }

        protected void btn_DeleteMemberPermanently_Click(object sender, EventArgs e)
        {
            if (checkMemberExist() && txt_MemberID.Text!="")
            {
                DeleteMemberPermanently();
            }
            else
            {
                Response.Write("<script>alert('Member ID does not Exist.');</script>");
            }
        }
    }
}