<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminPublisherManagement.aspx.cs" Inherits="DynamicLibraryManagementApp.AdminPublisherManagement" %>
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
                                    <h4>Publisher Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/Publisher.jpg" width="100px" />
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
                                <asp:Label ID="lbl_PublisherID" runat="server" Text="Publisher ID"></asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_PublisherID"
                                        runat="server" placeholder="Publisher ID"></asp:TextBox>
                                    <asp:Button CssClass="btn btn-primary" ID="btn_PublisherGo" 
                                        runat="server" Text="Go" OnClick="btn_PublisherGo_Click" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <asp:Label ID="lbl_PublisherName" runat="server" Text="Publisher Name"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_PublisherName"
                                        runat="server" placeholder="Publisher Name"></asp:TextBox>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col-4">
                                <asp:Button CssClass="btn btn-success btn-lg btn-block" 
                                    ID="btn_PublisherAdd" runat="server" Text="Add" OnClick="btn_PublisherAdd_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button CssClass="btn btn-primary btn-lg btn-block" 
                                    ID="btn_PublisherUpdate" runat="server" Text="Update" OnClick="btn_PublisherUpdate_Click" />
                            </div>

                            <div class="col-4">
                                <asp:Button CssClass="btn btn-danger btn-lg btn-block" 
                                    ID="btn_PublisherDelete" runat="server" Text="Delete" OnClick="btn_PublisherDelete_Click" />
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
                                    <h4>Publisher List</h4>
                                </center>
                            </div>
                        </div>--%>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/list-of-publisher.jpeg" width="100px" />
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
                                    ID="gv_PublisherManagement" runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="publisher_id" HeaderText="Publisher ID" ReadOnly="True" SortExpression="publisher_id" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="Publisher Name" SortExpression="publisher_name" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                            </div>
                        </div>

                    </div>

                </div>

            </div>

        </div>
    </div>







</asp:Content>
