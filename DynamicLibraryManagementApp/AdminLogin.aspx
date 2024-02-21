<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="DynamicLibraryManagementApp.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/administration.jpg" width="150px"/>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Admin Login</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">

                                <asp:Label ID="lbl_AdminID" runat="server" Text="Admin ID" Visible="false"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_AdminID"
                                        runat="server" placeholder="Admin ID"></asp:TextBox>
                                </div>


                                <asp:Label ID="lbl_AdminPassword" runat="server" Text="Password" Visible="false"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_AdminPassword"
                                        runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>


                                <div class="form-group">
                                    <asp:Button ID="btn_AdminLogin" CssClass="btn btn-success btn-block btn-lg" 
                                        runat="server" Text="Login" OnClick="btn_AdminLogin_Click" />
                                </div>


                               

                            </div>
                        </div>



                    </div>

                </div>


                <a href="Homepage.aspx"> << Back to Home</a>
                <br />
                <br />
            </div>

        </div>
    </div>


</asp:Content>
