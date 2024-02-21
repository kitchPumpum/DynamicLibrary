<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookInventory.aspx.cs" Inherits="DynamicLibraryManagementApp.AdminBookInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <script type="text/javascript">

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();

        });
    </script>





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
                                    <h4>Book Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" height="150px" width="100px"
                                        src="book_inventory/books.png" />
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
                                <asp:FileUpload onchange="readURL(this);" CssClass="form-control" ID="fu_Book" runat="server" />
                            </div>
                        </div>


                        <div class="row">

                            <div class="col-md-3">
                                <asp:Label ID="lbl_BookID" runat="server" Text="Book ID"></asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="txt_BookID"
                                            runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:LinkButton CssClass="btn btn-primary mr-1" ID="btn_BookIDInfo"
                                            runat="server" OnClick="btn_BookIDInfo_Click"><i class="fa-solid fa-circle-check"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-9">
                                <asp:Label ID="lbl_BookName" runat="server" Text="Book Name"></asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_BookName"
                                            runat="server" placeholder="Book Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>


                        </div>


                        <div class="row">

                            <div class="col-md-4">
                                <asp:Label ID="lbl_Language" runat="server" Text="Language"></asp:Label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="dd_Language" runat="server">
                                        <asp:ListItem Text="Please Select" Value="Please Select"></asp:ListItem>
                                        <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                        <asp:ListItem Text="Spanish" Value="Spanish"></asp:ListItem>
                                        <asp:ListItem Text="German" Value="German"></asp:ListItem>
                                        <asp:ListItem Text="French" Value="French"></asp:ListItem>
                                        <asp:ListItem Text="Bangla" Value="Bangla"></asp:ListItem>
                                        <asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>
                                        <asp:ListItem Text="Urdu" Value="Urdu"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <asp:Label ID="lbl_PublisherName" runat="server" Text="Publisher Name"></asp:Label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="dd_PublisherName" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <asp:Label ID="lbl_AuthorName" runat="server" Text="Author Name"></asp:Label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="dd_AuthorName" runat="server">
                                    </asp:DropDownList>
                                </div>

                                <asp:Label ID="lbl_PublisherDate" runat="server" Text="Publisher Date"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_PublisherDate"
                                        runat="server" placeholder="Publisher Date" TextMode="Date"></asp:TextBox>

                                </div>
                            </div>


                            <div class="col-md-4">
                                <asp:Label ID="lbl_Genre" runat="server" Text="Genre"></asp:Label>
                                <div class="form-group">

                                    <asp:ListBox CssClass="form-control" ID="lst_Genre"
                                        runat="server" SelectionMode="Multiple" Rows="5" >
                                        
                                        <asp:ListItem Text="Advanture" Value="Advanture"></asp:ListItem>
                                        <asp:ListItem Text="Action" Value="Action"></asp:ListItem>
                                        <asp:ListItem Text="Comic Book" Value="Comic Book"></asp:ListItem>
                                        <asp:ListItem Text="Self Help" Value="Self Help"></asp:ListItem>
                                        <asp:ListItem Text="Motivation" Value="Motivation"></asp:ListItem>
                                        <asp:ListItem Text="Healthy Living" Value="Healthy Living"></asp:ListItem>
                                        <asp:ListItem Text="Wellness" Value="Wellness"></asp:ListItem>
                                        <asp:ListItem Text="Crime" Value="Crime"></asp:ListItem>
                                        <asp:ListItem Text="Drama" Value="Drama"></asp:ListItem>
                                        <asp:ListItem Text="Fantasy" Value="Fantasy"></asp:ListItem>
                                        <asp:ListItem Text="Horror" Value="Horror"></asp:ListItem>
                                        <asp:ListItem Text="Poetry" Value="Poetry"></asp:ListItem>
                                        <asp:ListItem Text="Personal Development" Value="Personal Development"></asp:ListItem>
                                        <asp:ListItem Text="Romance" Value="Romance"></asp:ListItem>
                                        <asp:ListItem Text="Science Fiction" Value="Science Fiction"></asp:ListItem>
                                        <asp:ListItem Text="Suspense" Value="Suspense"></asp:ListItem>
                                        <asp:ListItem Text="Thriller" Value="Thriller"></asp:ListItem>
                                        <asp:ListItem Text="Art" Value="Art"></asp:ListItem>
                                        <asp:ListItem Text="Autobiography" Value="Autobiography"></asp:ListItem>
                                    </asp:ListBox>
                                </div>
                            </div>


                        </div>



                        <div class="row">

                            <div class="col-md-4">
                                <asp:Label ID="lbl_Edition" runat="server" Text="Edition"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_Edition"
                                        runat="server" placeholder="Edition"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <asp:Label ID="lbl_BookCost" runat="server" Text="Book Cost(per unit)"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_BookCost"
                                        runat="server" placeholder="Book Cost" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <asp:Label ID="lbl_Pages" runat="server" Text="Pages"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_Pages"
                                        runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                        </div>



                        <div class="row">

                            <div class="col-md-4">
                                <asp:Label ID="lbl_ActualStock" runat="server" Text="Actual Stock"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_ActualStock"
                                        runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <asp:Label ID="lbl_CurrentStock" runat="server" Text="Current Stock"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_CurrentStock"
                                        runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <asp:Label ID="lbl_IssuedBooks" runat="server" Text="Issued Books"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_IssuedBooks"
                                        runat="server" placeholder="Issued Books" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>

                        </div>




                        <div class="row">

                            <div class="col-md-12">
                                <asp:Label ID="lbl_BookDescription" runat="server" Text="Book Description"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_BookDescription"
                                        runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>

                        </div>




                        <div class="row">

                            <div class="col-4">
                                <asp:Button CssClass="btn btn-success btn-lg btn-block"
                                    ID="btn_Add" runat="server" Text="Add" OnClick="btn_Add_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button CssClass="btn btn-primary btn-lg btn-block"
                                    ID="btn_Update" runat="server" Text="Update" OnClick="btn_Update_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button CssClass="btn btn-danger btn-lg btn-block"
                                    ID="btn_Delete" runat="server" Text="Delete" OnClick="btn_Delete_Click" />
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
                                                                    &nbsp;| Genre -&nbsp;&nbsp;<asp:Label ID="lbl_GridviewGenre" runat="server" Text='<%# Eval("genre") %>' Font-Bold="True"></asp:Label>
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

        </div>
    </div>







</asp:Content>
