<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookIssuing.aspx.cs" Inherits="DynamicLibraryManagementApp.AdminBookIssuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="container-fluid">
        <div class="row">

            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Issuing</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/books.png" width="100px" />
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
                                <asp:Label ID="lbl_MemberID" runat="server" Text="Member ID"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_MemberID"
                                        runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <asp:Label ID="lbl_BookID" runat="server" Text="Book ID"></asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_BookID"
                                            runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:Button CssClass="btn btn-primary" ID="btn_BookGo"
                                            runat="server" Text="Go" />
                                    </div>
                                </div>
                            </div>



                        </div>


                        <div class="row">

                            <div class="col-md-6">
                                <asp:Label ID="lbl_MemberName" runat="server" Text="Member Name"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_MemberName"
                                        runat="server" placeholder="Member Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <asp:Label ID="lbl_BookName" runat="server" Text="Book Name"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_BookName"
                                        runat="server" placeholder="Book Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>


                        </div>


                        <div class="row">

                            <div class="col-md-6">
                                <asp:Label ID="lbl_StartDate" runat="server" Text="Start Date"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_StartDate"
                                        runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <asp:Label ID="lbl_EndDate" runat="server" Text="End Date"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_EndDate"
                                        runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>


                        </div>




                        <div class="row">
                            <div class="col-6">
                                <asp:Button CssClass="btn btn-primary btn-lg btn-block"
                                    ID="btn_IssueBook" runat="server" Text="Issue Book" />
                            </div>

                            <div class="col-6">
                                <asp:Button CssClass="btn btn-success btn-lg btn-block"
                                    ID="btn_ReturnBook" runat="server" Text="Return Book" />
                            </div>

                        </div>

                    </div>

                </div>


                <a href="Homepage.aspx"><< Back to Home</a>
                <br />
                <br />
            </div>


            <div class="col-md-7">


                <div class="card">
                    <div class="card-body">

                        <%--<div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author List</h4>
                                </center>
                            </div>
                        </div>--%>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/Issued-booklist.jpg" width="100px" />
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
                                <asp:GridView CssClass="table table-striped table-bordered"
                                    ID="gv_AuthorManagement" runat="server">
                                </asp:GridView>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>
    </div>





</asp:Content>
