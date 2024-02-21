using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicLibraryManagementApp
{
    public partial class UserLogin : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_UserLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl " +
                                               "WHERE member_id='" + txt_UserMemberID.Text.Trim() + "' " +
                                               "AND password='" + txt_UserPassword.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Login Successfully');</script>");
                        Session["member_id"] = dr.GetValue(8).ToString();
                        Session["full_name"] = dr.GetValue(0).ToString();
                        Session["role"] = "User";
                        Session["account_status"] = dr.GetValue(10).ToString();
                    }
                    Response.Redirect("Homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        

    }
}