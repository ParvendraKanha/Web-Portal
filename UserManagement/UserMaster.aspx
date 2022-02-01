<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserMaster.aspx.cs" Inherits="UserManagement_UserMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <header>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css" />
        <!-- Theme style -->
        <link rel="stylesheet" href="../dist/css/adminlte.min.css" />

        <!-- jQuery -->
       <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.0/sweetalert.min.css"
        rel="stylesheet" type="text/css" />
        <script src="../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../dist/js/demo.js"></script>

        <style type="text/css">
            .form-group {
                margin-left: 160px;
            }

            /*.form-control {
                width: 500px;
            }*/
             
            .form-check-label{
                margin-left:180px;
            }
            .form-check-input{
                 margin-left:150px;
            }
       
        </style>

    </header>



    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>User Master</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">User Management</a></li>
                        <li class="breadcrumb-item active">User Master</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="card card-primary card-outline">
                <div class="card-header">
                    <h3 class="card-title">Add | Update | Delete | View</h3>
                </div>
                <!-- /.card-body -->
                <div class="card-body">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">User Group<span style="color: red;">*</span></label>
                        <div class="col-sm-4">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlRole" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <select class="custom-select" id="ddlRole" runat="server">
                                <option>Admin</option>
                                <option value="HO">HO</option>
                                <option value="MCC">MCC</option>                                
                                <option value="BMC">BMC</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Name of User<span style="color: red;">*</span></label>
                        <div class="col-sm-4">
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserNm" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <input type="text" class="form-control" id="txtUserNm"  runat="server"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Login ID<span style="color: red;">*</span></label>
                        <div class="col-sm-4">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLoginId" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <content template>
                            <asp:TextBox ID="txtLoginId" CssClass="form-control" runat="server" OnTextChanged="txtLoginId_TextChanged" AutoPostBack="true"></asp:TextBox>
                                </content>
                            
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Password<span style="color: red;">*</span></label>
                        <div class="col-sm-4">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLoginId" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <input type="text" class="form-control" id="txtpwd"  runat="server"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Plant<span style="color: red;">*</span></label>
                        <div class="col-sm-4">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlPlantNm" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                                            <content template>
                                                <asp:DropDownList ID="ddlPlantNm" runat="server"
                                                    AutoPostBack="False" CssClass="custom-select" OnSelectedIndexChanged="ddlPlantNm_SelectedIndexChanged" >
                                                </asp:DropDownList>
                                                </content>
                           
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">MCC<span style="color: red;">*</span></label>
                        <div class="col-sm-4">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlMccNm" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                                            <content template>
                                                <asp:DropDownList ID="ddlMccNm" runat="server"
                                                    AutoPostBack="False" CssClass="custom-select" OnSelectedIndexChanged="ddlMccNm_SelectedIndexChanged" >
                                                </asp:DropDownList>
                           
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">BMC<span style="color: red;">*</span></label>
                        <div class="col-sm-4">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlBmcNm" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                                            <content template>
                                                <asp:DropDownList ID="ddlBmcNm" runat="server"
                                                    AutoPostBack="False" CssClass="custom-select" >
                                                </asp:DropDownList>
                                                </content>
                            
                        </div>
                    </div>
                    <div class="form-group row">
                         <input class="form-check-input" type="checkbox" runat="server" id="isactive"  />
                        <label class="form-check-label">Is Active</label>
                    </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                    <table style="margin-left: 500px;">
                         <tr>
                            <td>
                               <asp:Button ID="Create" CssClass="btn btn-primary" runat="server" onclick="Button1_Click" Text="Save" > </asp:Button></td>
                            <td>
                                  <asp:Button ID="Button1" CssClass="btn btn-default float-right" runat="server" onclick="Cancle_Click" Text="Cancel"  CausesValidation="false"> </asp:Button></td>
                        </tr>

                         <tr>
                            <td>
                                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                            </td>
                            
                        </tr>
                    </table>


                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->


</asp:Content>
