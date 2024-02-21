using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace DynamicLibraryManagementApp
{
    public partial class AdminBookInventory : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_book;
        protected void Page_Load(object sender, EventArgs e)
        {
            gv_BookInventoryList.DataBind();
            
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }
                
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            if (checkBookExist())
            {
                Response.Write("<script>alert('Book already Exists, try some other Book ID');</script>");
            }
            else
            {
                addNewBook();
            }
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            if (checkBookExist())
            {
                UpdateBookbyID();
            }
            else
            {
                Response.Write("<script>alert('Book ID does not Exist.');</script>");
                clearForm();
            }
        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            if (checkBookExist())
            {
                DeleteBookbyID();
            }
            else
            {
                Response.Write("<script>alert('Book ID does not Exist.');</script>");
                clearForm();
            }
        }

        protected void btn_BookIDInfo_Click(object sender, EventArgs e)
        {
            getMemberbyID();
        }


        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_master_tbl ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dd_AuthorName.DataSource = dt;
                dd_AuthorName.DataValueField = "author_name";
                dd_AuthorName.DataBind();


                cmd = new SqlCommand("SELECT publisher_name FROM publisher_master_tbl ", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                dd_PublisherName.DataSource = dt;
                dd_PublisherName.DataValueField = "publisher_name";
                dd_PublisherName.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        bool checkBookExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl " +
                                                "WHERE book_id='" + txt_BookID.Text.Trim() + "'" +
                                                "OR book_name='" + txt_BookName.Text.Trim() + "'", con);
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


        void addNewBook()
        {
            try
            {

                string genres = "";
                foreach (int i in lst_Genre.GetSelectedIndices())
                {
                    genres = genres + lst_Genre.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);


                string filepath = "~/book_inventory/books.png";
                string filename= Path.GetFileName(fu_Book.PostedFile.FileName);
                fu_Book.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath= "~/book_inventory/" + filename;


                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl (book_id,book_name,genre,author_name,publisher_name,publish_date,language," +
                                                "edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) " +
                                                "VALUES (@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition," +
                                                "@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)", con);
                cmd.Parameters.AddWithValue("@book_id", txt_BookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", txt_BookName.Text.Trim());

                cmd.Parameters.AddWithValue("@genre", genres);

                cmd.Parameters.AddWithValue("@author_name", dd_AuthorName.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", dd_PublisherName.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@publish_date", txt_PublisherDate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", dd_Language.SelectedValue.Trim());
                cmd.Parameters.AddWithValue("@edition", txt_Edition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", txt_BookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", txt_Pages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", txt_BookDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", txt_ActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", txt_ActualStock.Text.Trim());

                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Book Added Successfully');</script>");
                gv_BookInventoryList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
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
                SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl " +
                                                "WHERE book_id='" + txt_BookID.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txt_BookName.Text = dt.Rows[0]["book_name"].ToString();

                    lst_Genre.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < lst_Genre.Items.Count; j++)
                        {
                            if (lst_Genre.Items[j].ToString() == genre[i])
                            {
                                lst_Genre.Items[j].Selected= true;
                            }
                           
                        }
                    }


                    dd_AuthorName.SelectedValue = dt.Rows[0]["author_name"].ToString();
                    dd_PublisherName.Text = dt.Rows[0]["publisher_name"].ToString();
                    txt_PublisherDate.Text = dt.Rows[0]["publish_date"].ToString();
                    dd_Language.SelectedValue = dt.Rows[0]["language"].ToString();
                    txt_Edition.Text = dt.Rows[0]["edition"].ToString();
                    txt_BookCost.Text = Convert.ToInt32(dt.Rows[0]["book_cost"]).ToString().Trim();
                    txt_Pages.Text = Convert.ToInt32(dt.Rows[0]["no_of_pages"]).ToString().Trim();
                    txt_BookDescription.Text = dt.Rows[0]["book_description"].ToString();


                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock= Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_book= global_actual_stock - global_current_stock;
                    global_filepath= dt.Rows[0]["book_img_link"].ToString();

                    txt_ActualStock.Text = global_actual_stock.ToString();
                    txt_CurrentStock.Text = global_current_stock.ToString();
                    txt_IssuedBooks.Text = Convert.ToInt32(global_issued_book).ToString().Trim();



                    gv_BookInventoryList.DataBind();
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

        void UpdateBookbyID()
        {
            try
            {
                string genres = "";
                foreach (int i in lst_Genre.GetSelectedIndices())
                {
                    genres = genres + lst_Genre.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);


                string filepath = "~/book_inventory/books.png";
                string filename = Path.GetFileName(fu_Book.PostedFile.FileName);
                if(filename == "" || filename == null) 
                {
                    filepath = global_filepath;
                }
                else
                {
                    fu_Book.SaveAs(Server.MapPath("book_inventory/" + filename));
                    filepath= "~/book_inventory/" + filename;
                }


                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl SET book_name=@book_name, genre=@genre, author_name=@author_name, " +
                                                "publisher_name=@publisher_name, publish_date=@publish_date, language=@language, " +
                                                "edition = @edition, book_cost = @book_cost, no_of_pages = @no_of_pages, book_description = @book_description, " +
                                                "actual_stock = @actual_stock, current_stock = @current_stock, book_img_link = @book_img_link " +
                                                "WHERE book_id = '" + txt_BookID.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@book_name", txt_BookName.Text.Trim());

                cmd.Parameters.AddWithValue("@genre", genres);

                cmd.Parameters.AddWithValue("@author_name", dd_AuthorName.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@publisher_name", dd_PublisherName.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@publish_date", txt_PublisherDate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", dd_Language.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@edition", txt_Edition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", txt_BookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", txt_Pages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", txt_BookDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", txt_ActualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", txt_ActualStock.Text.Trim());

                cmd.Parameters.AddWithValue("@book_img_link", filepath);


                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Books updated Successfully.');</script>");
                clearForm();
                gv_BookInventoryList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            txt_BookID.Text = "";
            txt_BookName.Text = "";
            lst_Genre.ClearSelection();
            txt_PublisherDate.Text = "";
            txt_Edition.Text = "";
            txt_BookCost.Text = "";
            txt_Pages.Text = "";
            txt_BookDescription.Text = "";
            txt_ActualStock.Text = "";
            txt_CurrentStock.Text = "";

        }

        void DeleteBookbyID()
        {
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM book_master_tbl WHERE book_id='" + txt_BookID.Text.Trim() + "'", con);


                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Book Deleted Successfully');</script>");
                clearForm();
                gv_BookInventoryList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


    }
}