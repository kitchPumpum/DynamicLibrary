<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="DynamicLibraryManagementApp.UserSignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/userlogin.png" width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>User Registration</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>


                        <div class="row">

                            <div class="col-md-6">
                                <asp:Label ID="lbl_UserFullName" runat="server" Text="Full Name"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_UserFullName"
                                        runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lbl_UserDateofBirth" runat="server" Text="Date of Birth"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_UserDateofBirth"
                                        runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row">

                            <div class="col-md-6">
                                <asp:Label ID="lbl_UserContactNumber" runat="server" Text="Contact Number"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_UserContactNumber"
                                        runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lbl_UserEmail" runat="server" Text="Email"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_UserEmail"
                                        runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row">

                            <div class="col-md-4">
                                <asp:Label ID="lbl_UserState" runat="server" Text="State"></asp:Label>
                                <div class="form-group">
                                    <asp:DropDownList ID="dd_UserState" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                        <asp:ListItem Text="Alabama" Value="Alabama"></asp:ListItem>
                                        <asp:ListItem Text="Alaska" Value="Alaska"></asp:ListItem>
                                        <asp:ListItem Text="Arizona" Value="Arizona"></asp:ListItem>
                                        <asp:ListItem Text="Arkansas" Value="Arkansas"></asp:ListItem>
                                        <asp:ListItem Text="California" Value="California"></asp:ListItem>
                                        <asp:ListItem Text="Colorado" Value="Colorado"></asp:ListItem>
                                        <asp:ListItem Text="Connecticut" Value="Connecticut"></asp:ListItem>
                                        <asp:ListItem Text="Delaware" Value="Delaware"></asp:ListItem>
                                        <asp:ListItem Text="Florida" Value="Florida"></asp:ListItem>
                                        <asp:ListItem Text="Georgia" Value="Georgia"></asp:ListItem>
                                        <asp:ListItem Text="Hawaii" Value="Hawaii"></asp:ListItem>
                                        <asp:ListItem Text="Idaho" Value="Idaho"></asp:ListItem>
                                        <asp:ListItem Text="Illinois" Value="Illinois"></asp:ListItem>
                                        <asp:ListItem Text="Indiana" Value="Indiana"></asp:ListItem>
                                        <asp:ListItem Text="Iowa" Value="Iowa"></asp:ListItem>
                                        <asp:ListItem Text="Kansas" Value="Kansas"></asp:ListItem>
                                        <asp:ListItem Text="Kentucky" Value="Kentucky"></asp:ListItem>
                                        <asp:ListItem Text="Louisiana" Value="Louisiana"></asp:ListItem>
                                        <asp:ListItem Text="Maine" Value="Maine"></asp:ListItem>
                                        <asp:ListItem Text="Maryland" Value="Maryland"></asp:ListItem>
                                        <asp:ListItem Text="Massachusetts" Value="Massachusetts"></asp:ListItem>
                                        <asp:ListItem Text="Michigan" Value="Michigan"></asp:ListItem>
                                        <asp:ListItem Text="Minnesota" Value="Minnesota"></asp:ListItem>
                                        <asp:ListItem Text="Mississippi" Value="Mississippi"></asp:ListItem>
                                        <asp:ListItem Text="Missouri" Value="Missouri"></asp:ListItem>
                                        <asp:ListItem Text="Montana" Value="Montana"></asp:ListItem>
                                        <asp:ListItem Text="Nebraska" Value="Nebraska"></asp:ListItem>
                                        <asp:ListItem Text="Nevada" Value="Nevada"></asp:ListItem>
                                        <asp:ListItem Text="New Hampshire" Value="New Hampshire"></asp:ListItem>
                                        <asp:ListItem Text="New Jersey" Value="New Jersey"></asp:ListItem>
                                        <asp:ListItem Text="New Mexico" Value="New Mexico"></asp:ListItem>
                                        <asp:ListItem Text="New York" Value="New York"></asp:ListItem>
                                        <asp:ListItem Text="North Carolina" Value="North Carolina"></asp:ListItem>
                                        <asp:ListItem Text="North Dakota" Value="North Dakota"></asp:ListItem>
                                        <asp:ListItem Text="Ohio" Value="Ohio"></asp:ListItem>
                                        <asp:ListItem Text="Oklahoma" Value="Oklahoma"></asp:ListItem>
                                        <asp:ListItem Text="Oregon" Value="Oregon"></asp:ListItem>
                                        <asp:ListItem Text="Pennsylvania" Value="Pennsylvania"></asp:ListItem>
                                        <asp:ListItem Text="Rhode Island" Value="Rhode Island"></asp:ListItem>
                                        <asp:ListItem Text="South Carolina" Value="South Carolina"></asp:ListItem>
                                        <asp:ListItem Text="South Dakota" Value="South Dakota"></asp:ListItem>
                                        <asp:ListItem Text="Tennessee" Value="Tennessee"></asp:ListItem>
                                        <asp:ListItem Text="Texas" Value="Texas"></asp:ListItem>
                                        <asp:ListItem Text="Utah" Value="Utah"></asp:ListItem>
                                        <asp:ListItem Text="Vermont" Value="Vermont"></asp:ListItem>
                                        <asp:ListItem Text="Washington" Value="Washington"></asp:ListItem>
                                        <asp:ListItem Text="West Virginia" Value="West Virginia"></asp:ListItem>
                                        <asp:ListItem Text="Wisconsin" Value="Wisconsin"></asp:ListItem>
                                        <asp:ListItem Text="Wyoming" Value="Wyoming"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <asp:Label ID="lbl_UserCity" runat="server" Text="City"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_UserCity"
                                        runat="server" placeholder="City"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <asp:Label ID="lbl_UserZipcode" runat="server" Text="Zip Code"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_UserZipCode"
                                        runat="server" placeholder="Zip Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                        </div>



                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lbl_UserFullAddress" runat="server" Text="Full Address"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_UserFullAddress"
                                        runat="server" placeholder="Full Address" TextMode="Multiline" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-pill badge-info">LogIn Credentials</span>
                                </center>
                            </div>
                        </div>



                        <div class="row">

                            <div class="col-md-6">
                                <asp:Label ID="lbl_UserID" runat="server" Text="User ID"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_UserID"
                                        runat="server" placeholder="User ID"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lbl_UserSignupPassword" runat="server" Text="Password"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_UserSignupPassword"
                                        runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col">

                                <div class="form-group">
                                    <asp:Button ID="btn_UserSignUp" CssClass="btn btn-success btn-block btn-lg"
                                        runat="server" Text="Sign Up" OnClick="btn_UserSignUp_Click" />
                                </div>

                            </div>
                        </div>



                    </div>

                </div>


                <a href="Homepage.aspx"><< Back to Home</a>
                <br />
                <br />
            </div>

        </div>
    </div>








</asp:Content>
