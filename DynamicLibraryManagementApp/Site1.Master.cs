using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicLibraryManagementApp
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    lnkbtn_UserLogin.Visible = true; //login Link button
                    lnkbtn_Signup.Visible = true; //Signup Link button

                    lnkbtn_Logout.Visible = false; //Logout Link button
                    lnkbtn_HelloUser.Visible = false; //HelloUser Link button

                    //lnkbtn_HelloUser.Text = "Hello " + Session["full_name"].ToString();


                    lnkbtn_AdminLogin.Visible = true; //AdminLogin Link button
                    lnkbtn_AuthorManagement.Visible = false; //AuthorManagement Link button
                    lnkbtn_PublisherManagement.Visible = false; //PublisherManagement Link button
                    lnkbtnBookInventory.Visible = false; //BookInventory Link button
                    lnkbtn_BookIssuing.Visible = false; //BookIssuing Link button
                    lnkbtn_MemberManagement.Visible = false; //MemberManagement Link button
                }
                else if (Session["role"].Equals("User"))
                {
                    lnkbtn_UserLogin.Visible = false; //login Link button
                    lnkbtn_Signup.Visible = false; //Signup Link button

                    lnkbtn_Logout.Visible = true; //Logout Link button
                    lnkbtn_HelloUser.Visible = true; //HelloUser Link button

                    lnkbtn_HelloUser.Text = "Hello " + Session["full_name"].ToString();


                    lnkbtn_AdminLogin.Visible = true; //AdminLogin Link button
                    lnkbtn_AuthorManagement.Visible = false; //AuthorManagement Link button
                    lnkbtn_PublisherManagement.Visible = false; //PublisherManagement Link button
                    lnkbtnBookInventory.Visible = false; //BookInventory Link button
                    lnkbtn_BookIssuing.Visible = false; //BookIssuing Link button
                    //lnkbtn_MemberManagement.Visible = true; //MemberManagement Link button
                }
                else if (Session["role"].Equals("Admin"))
                {
                    lnkbtn_UserLogin.Visible = false; //login Link button
                    lnkbtn_Signup.Visible = false; //Signup Link button

                    lnkbtn_Logout.Visible = true; //Logout Link button
                    lnkbtn_HelloUser.Visible = true; //HelloUser Link button
                    lnkbtn_HelloUser.Text="Hello Admin";

                    lnkbtn_AdminLogin.Visible = false; //AdminLogin Link button
                    lnkbtn_AuthorManagement.Visible = true; //AuthorManagement Link button
                    lnkbtn_PublisherManagement.Visible = true; //PublisherManagement Link button
                    lnkbtnBookInventory.Visible = true; //BookInventory Link button
                    lnkbtn_BookIssuing.Visible = true; //BookIssuing Link button
                    //lnkbtn_MemberManagement.Visible = false; //MemberManagement Link button
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void lnkbtn_AdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void lnkbtn_AuthorManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAuthorManagement.aspx");
        }

        protected void lnkbtn_PublisherManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPublisherManagement.aspx");
        }

        protected void lnkbtnBookInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookInventory.aspx");
        }

        protected void lnkbtn_BookIssuing_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookIssuing.aspx");
        }

        protected void lnkbtn_MemberManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMemberManagement.aspx");
        }

        protected void lnkbtn_Signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignup.aspx");
        }

        protected void lnkbtn_UserLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void lnkbtn_ViewBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBooks.aspx");
        }

        protected void lnkbtn_Logout_Click(object sender, EventArgs e)
        {
            Session["member_id"] = "";
            Session["full_name"] = "";
            Session["role"] = "";
            Session["account_status"] = "";


            lnkbtn_UserLogin.Visible = true; //login Link button
            lnkbtn_Signup.Visible = true; //Signup Link button

            lnkbtn_Logout.Visible = false; //Logout Link button
            lnkbtn_HelloUser.Visible = false; //HelloUser Link button

            lnkbtn_AdminLogin.Visible = true; //AdminLogin Link button
            lnkbtn_AuthorManagement.Visible = false; //AuthorManagement Link button
            lnkbtn_PublisherManagement.Visible = false; //PublisherManagement Link button
            lnkbtnBookInventory.Visible = false; //BookInventory Link button
            lnkbtn_BookIssuing.Visible = false; //BookIssuing Link button
            lnkbtn_MemberManagement.Visible = false; //MemberManagement Link button

            Response.Redirect("Homepage.aspx");
        }

        protected void lnkbtn_HelloUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
}