using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicLibraryManagementApp
{
    public partial class UserSignup : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
         
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_UserSignUp_Click(object sender, EventArgs e)
        {

            if(checkUserExist())
            {
                Response.Write("<script>alert('User ID already Exists. Please try New User ID.');</script>");

                //Response.Write("<script>alert('User ID "+ txt_UserID.Text.Trim() +"' already Exists. Please try New User ID.');</script>");
            }
            else
            {
                signupNewUser();
            }
        }


        bool checkUserExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl " +
                                               "WHERE member_id='" + txt_UserID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt); 
                if(dt.Rows.Count >= 1)
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

        void signupNewUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO member_master_tbl" +
                                                "(full_name,dob,contract_no,email,state,city,zipcode," +
                                                "full_address,member_id,password,account_status)" +
                                                "VALUES" +
                                                "(@full_name, @dob, @contract_no, @email, @state," +
                                                "@city, @zipcode, @full_address, @member_id, @password, @account_status);", con);
                cmd.Parameters.AddWithValue("@full_name", txt_UserFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txt_UserDateofBirth.Text.Trim());
                cmd.Parameters.AddWithValue("@contract_no", txt_UserContactNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txt_UserEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@state", dd_UserState.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", txt_UserCity.Text.Trim());
                cmd.Parameters.AddWithValue("@zipcode", txt_UserZipCode.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txt_UserFullAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", txt_UserID.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txt_UserSignupPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "Pending");

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Sign Up Successfully. Go to User Login to Login');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}