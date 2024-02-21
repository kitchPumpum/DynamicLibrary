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
    public partial class AdminPublisherManagement : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            gv_PublisherManagement.DataBind();
        }

        protected void btn_PublisherAdd_Click(object sender, EventArgs e)
        {
            if (checkPublisherExist())
            {
                Response.Write("<script>alert('Publisher with this ID already Exist. You can not add " +
                               "another Publisher with the same Publisher ID.');</script>");
            }
            else
            {
                AddNewPublisher();
            }
        }

        protected void btn_PublisherUpdate_Click(object sender, EventArgs e)
        {
            if (checkPublisherExist())
            {
                UpdatePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher ID does not Exist.');</script>");
            }
        }

        protected void btn_PublisherDelete_Click(object sender, EventArgs e)
        {
            if (checkPublisherExist())
            {
                DeletePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher ID does not Exist.');</script>");
            }
        }

        protected void btn_PublisherGo_Click(object sender, EventArgs e)
        {
            getPublisherbyID();
        }

        bool checkPublisherExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_master_tbl " +
                                                "WHERE publisher_id='" + txt_PublisherID.Text.Trim() + "'", con);
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


        void AddNewPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO publisher_master_tbl (publisher_id,publisher_name) " +
                                                "VALUES(@publisher_id, @publisher_name)", con);
                cmd.Parameters.AddWithValue("@publisher_id", txt_PublisherID.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", txt_PublisherName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Publisher Added Successfully');</script>");
                clearForm();
                gv_PublisherManagement.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }



        void UpdatePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tbl " +
                                                "SET publisher_name=@publisher_name " +
                                                "WHERE publisher_id='" + txt_PublisherID.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@publisher_name", txt_PublisherName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Publisher Updated Successfully');</script>");
                clearForm();
                gv_PublisherManagement.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void DeletePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM publisher_master_tbl WHERE publisher_id='" + txt_PublisherID.Text.Trim() + "'", con);


                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Publisher Deleted Successfully');</script>");
                clearForm();
                gv_PublisherManagement.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            txt_PublisherID.Text = "";
            txt_PublisherName.Text = "";
        }

        void getPublisherbyID()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_master_tbl " +
                                                "WHERE publisher_id='" + txt_PublisherID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txt_PublisherName.Text = dt.Rows[0]["publisher_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Author ID " + txt_PublisherID.Text.Trim() + "'not exist');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}