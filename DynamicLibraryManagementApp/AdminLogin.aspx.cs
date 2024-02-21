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
    public partial class AdminLogin : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_AdminLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM admin_login_tbl " +
                                                "WHERE adminID='"+ txt_AdminID.Text.Trim() +"' " +
                                                "and password='"+ txt_AdminPassword.Text.Trim() +"'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Login Successfully');</script>");
                        Session["adminID"] = dr.GetValue(0).ToString();
                        Session["full_name"] = dr.GetValue(2).ToString();
                        Session["role"] = "Admin";
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