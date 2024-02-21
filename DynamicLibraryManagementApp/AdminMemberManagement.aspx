<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="DynamicLibraryManagementApp.AdminMemberManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript">
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
                                    <h4>Member Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/userlogin.png" width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>


                        <div class="row">

                            <div class="col-md-3">
                                <asp:Label ID="lbl_MemberID" runat="server" Text="Member ID"></asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="txt_MemberID"
                                            runat="server" placeholder="Member ID"></asp:TextBox>
                                        <asp:LinkButton CssClass="btn btn-primary mr-1" ID="btn_MemberIDInfo"
                                            runat="server" OnClick="btn_MemberIDInfo_Click"><i class="fa-solid fa-circle-check"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <asp:Label ID="lbl_FullName" runat="server" Text="Full Name"></asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_FullName"
                                            runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <asp:Label ID="lbl_AccountStatus" runat="server" Text="Account Status"></asp:Label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="txt_AccountStatus"
                                            runat="server" placeholder="Account Status" ReadOnly="True"></asp:TextBox>

                                        <asp:LinkButton CssClass="btn btn-success mr-1" ID="btn_CheckActive"
                                            runat="server" OnClick="btn_CheckActive_Click"><i class="fa-solid fa-circle-check"></i></asp:LinkButton>

                                        <asp:LinkButton CssClass="btn btn-warning mr-1" ID="btn_Pause"
                                            runat="server" OnClick="btn_Pause_Click"><i class="fa-solid fa-circle-pause"></i></asp:LinkButton>

                                        <asp:LinkButton CssClass="btn btn-danger mr-1" ID="btn_Defaulter"
                                            runat="server" OnClick="btn_Defaulter_Click"><i class="fa-solid fa-trash"></i></asp:LinkButton>

                                    </div>
                                </div>
                            </div>

                        </div>


                        <div class="row">

                            <div class="col-md-3">
                                <asp:Label ID="lbl_DOB" runat="server" Text="DBO"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_DOB"
                                        runat="server" placeholder="Date of Birth" ReadOnly="True" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <asp:Label ID="lbl_ContactNo" runat="server" Text="Contact No"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_ContactNo"
                                        runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <asp:Label ID="lbl_EmailID" runat="server" Text="Email ID"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_EmailID"
                                        runat="server" placeholder="Email ID" ReadOnly="True" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>


                        </div>



                        <div class="row">

                            <div class="col-md-4">
                                <asp:Label ID="lbl_MemberState" runat="server" Text="State"></asp:Label>
                                <div class="form-group">
                                    <asp:DropDownList ID="dd_MemberState" CssClass="form-control" runat="server" Enabled="False">
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
                                <asp:Label ID="lbl_MemberCity" runat="server" Text="City"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_MemberCity"
                                        runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <asp:Label ID="lbl_MemberZipcode" runat="server" Text="Zip Code"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txt_MemberZipCode"
                                        runat="server" placeholder="Zip Code" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>



                        <div class="row">

                            <div class="col-md-12">
                                <asp:Label ID="lbl_FullAddress" runat="server" Text="Full Address"></asp:Label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_FullAddress"
                                        runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>




                        <div class="row">
                            <div class="col-8 mx-auto">
                                <asp:Button CssClass="btn btn-danger btn-lg btn-block"
                                    ID="btn_DeleteMemberPermanently" runat="server" Text="Delete Member Permanently" OnClick="btn_DeleteMemberPermanently_Click" />
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
                                    <img src="imgs/MemberList.jpg" width="100px" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView CssClass="table table-striped table-bordered"
                                    ID="gv_MemberList" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="ID" SortExpression="member_id" ReadOnly="True" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="contract_no" HeaderText="Contract No" SortExpression="contract_no" />
                                        <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
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
