<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="DynamicLibraryManagementApp.UserLogin" %>

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
                                    <img src="imgs/userlogin.png" width="150px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>
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

                                <asp:Label ID="lbl_UserMemberID" runat="server" Text="Member ID" Visible="false"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_UserMemberID"
                                        runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>


                                <asp:Label ID="lbl_UserPassword" runat="server" Text="Password" Visible="false"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_UserPassword"
                                        runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>


                                <div class="form-group">
                                    <asp:Button ID="btn_UserLogin" CssClass="btn btn-success btn-block btn-lg" 
                                        runat="server" Text="Login" OnClick="btn_UserLogin_Click" />
                                </div>


                                <div class="form-group">
                                    <a href="UserSignup.aspx"><input id="btn_UserSignup" class="btn btn-info btn-block btn-lg" 
                                        type="button" value="Sign Up" /></a>
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
