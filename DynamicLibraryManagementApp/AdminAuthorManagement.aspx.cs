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
    public partial class AdminAuthorManagement : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            gv_AuthorManagement.DataBind();
        }

        protected void btn_AuthorAdd_Click(object sender, EventArgs e)
        {
            if (checkAuthorExist())
            {
                Response.Write("<script>alert('Author with this ID already Exist. You can not add " +
                               "another Author with the same Author ID.');</script>");
            }
            else
            {
                AddNewAuthor();
            }
        }

        protected void btn_AuthorUpdate_Click(object sender, EventArgs e)
        {
            if (checkAuthorExist())
            {
                UpdateAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author ID does not Exist.');</script>");
            }
        }


        protected void btn_AuthorDelete_Click(object sender, EventArgs e)
        {
            if (checkAuthorExist())
            {
                DeleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author ID does not Exist.');</script>");
            }
        }

        protected void btn_AuthorGo_Click(object sender, EventArgs e)
        {
            getAuthorbyID();
        }





        bool checkAuthorExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl " +
                                                "WHERE author_id='"+ txt_AuthorID.Text.Trim() +"'", con);
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


        void AddNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl (author_id,author_name) " +
                                                "VALUES(@author_id, @author_name)", con);
                cmd.Parameters.AddWithValue("@author_id", txt_AuthorID.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", txt_AuthorName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Author Added Successfully');</script>");
                clearForm();
                gv_AuthorManagement.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }


        
        void UpdateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl " +
                                                "SET author_name=@author_name " +
                                                "WHERE author_id='"+ txt_AuthorID.Text.Trim() +"'", con);
                
                cmd.Parameters.AddWithValue("@author_name", txt_AuthorName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Author Updated Successfully');</script>");
                clearForm();
                gv_AuthorManagement.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void DeleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tbl WHERE author_id='" + txt_AuthorID.Text.Trim() + "'", con);


                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Author Deleted Successfully');</script>");
                clearForm();
                gv_AuthorManagement.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            txt_AuthorID.Text = "";
            txt_AuthorName.Text = "";
        }

        void getAuthorbyID()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl " +
                                                "WHERE author_id='" + txt_AuthorID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txt_AuthorName.Text = dt.Rows[0]["author_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Author ID does not exist');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}