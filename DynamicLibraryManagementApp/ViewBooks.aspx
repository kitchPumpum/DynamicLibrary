<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="DynamicLibraryManagementApp.ViewBooks" %>

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

            <div class="col-md-12">


                <div class="card">
                    <div class="card-body">

                        <%--<div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Inventory List</h4>
                                </center>
                            </div>
                        </div>--%>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/BookInventoryList.jpg" width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView CssClass="table table-striped table-bordered"
                                    ID="gv_BookInventoryList" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="ID"
                                            ReadOnly="True" SortExpression="book_id" >

                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>

                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="lbl_GridviewBookName" runat="server"
                                                                        Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Author -
                                                                    <asp:Label ID="lbl_GridviewAuthor" runat="server" Text='<%# Eval("author_name") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| Genre -<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                                                    &nbsp;
                                                                    <asp:Label ID="lbl_GridviewGenre" runat="server" Text='<%# Eval("genre") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| Language - |
                                                                    <asp:Label ID="lbl_GridviewLanguage" runat="server" Text='<%# Eval("language") %>' Font-Bold="True"></asp:Label>
                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Publisher -
                                                                    <asp:Label ID="lbl_GridviewPublisherName" runat="server" Text='<%# Eval("publisher_name") %>' Font-Bold="True"></asp:Label>

                                                                    &nbsp;| Publisher Date -
                                                                    <asp:Label ID="lbl_GridviewPublisherDate" runat="server" Text='<%# Eval("publish_date") %>' Font-Bold="True"></asp:Label>

                                                                    &nbsp;| Pages -
                                                                    <asp:Label ID="lbl_GridviewPages" runat="server" Text='<%# Eval("no_of_pages") %>' Font-Bold="True"></asp:Label>

                                                                    &nbsp;| Edition -
                                                                    <asp:Label ID="lbl_GridviewEdition" runat="server" Text='<%# Eval("edition") %>' Font-Bold="True"></asp:Label>

                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    Cost -
                                                                    <asp:Label ID="lbl_GridviewBookCost" runat="server" Text='<%# Eval("book_cost") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| Actual Stock -
                                                            <asp:Label ID="lbl_GridviewActualCost" runat="server" Text='<%# Eval("actual_stock") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| Available -
                                                            <asp:Label ID="lbl_GridviewCurrentStock" runat="server" Text='<%# Eval("current_stock") %>' Font-Bold="True"></asp:Label>

                                                                </div>

                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-12">

                                                                    Description -
                                                                    <asp:Label ID="lbl_GridviewBookDescription" runat="server" Text='<%# Eval("book_description") %>' Font-Bold="True" Font-Italic="True" Font-Size="Smaller"></asp:Label>

                                                                </div>
                                                            </div>


                                                        </div>

                                                        <div class="col-lg-2">
                                                            <asp:Image CssClass="img-fluid p-2" ID="Image_Gridview" runat="server"
                                                                ImageUrl='<%# Eval("book_img_link") %>' />

                                                        </div>

                                                    </div>

                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
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





</asp:Content>
