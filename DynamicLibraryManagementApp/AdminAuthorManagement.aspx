<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminAuthorManagement.aspx.cs" Inherits="DynamicLibraryManagementApp.AdminAuthorManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();

        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div class="container">
        <div class="row">

            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/writer.jpg" width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>


                        <div class="row">

                            <div class="col-md-4">
                                <asp:Label ID="lbl_AuthorID" runat="server" Text="Author ID"></asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_AuthorID"
                                            runat="server" placeholder="Author ID"></asp:TextBox>
                                        <asp:Button CssClass="btn btn-primary" ID="btn_AuthorGo"
                                            runat="server" Text="Go" OnClick="btn_AuthorGo_Click" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <asp:Label ID="lbl_AuthorName" runat="server" Text="Author Name"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_AuthorName"
                                        runat="server" placeholder="Author Name"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col-4">
                                <asp:Button CssClass="btn btn-success btn-lg btn-block"
                                    ID="btn_AuthorAdd" runat="server" Text="Add" OnClick="btn_AuthorAdd_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button CssClass="btn btn-primary btn-lg btn-block"
                                    ID="btn_AuthorUpdate" runat="server" Text="Update" OnClick="btn_AuthorUpdate_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button CssClass="btn btn-danger btn-lg btn-block"
                                    ID="btn_AuthorDelete" runat="server" Text="Delete" OnClick="btn_AuthorDelete_Click" />
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
                                    <img src="imgs/List-of-Authors.jpeg" width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" ProviderName="<%$ ConnectionStrings:elibraryDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView CssClass="table table-striped table-bordered"
                                    ID="gv_AuthorManagement" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="Author ID" ReadOnly="True" SortExpression="author_id" />
                                        <asp:BoundField DataField="author_name" HeaderText="Author Name" SortExpression="author_name" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>
    </div>










</asp:Content>
