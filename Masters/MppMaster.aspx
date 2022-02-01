<%@ Page Title="KMPS | MPP Master" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MppMaster.aspx.cs" Inherits="Masters_MppMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <header>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css" />
        <!-- Theme style -->
        <link rel="stylesheet" href="../dist/css/adminlte.min.css" />

        <!-- jQuery -->
        <script src="../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../dist/js/demo.js"></script>

        <style type="text/css">
            .form-check-label {
                margin-left: 180px;
            }

            .form-check-input {
                margin-left: 150px;
            }
        </style>
    </header>



    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>MPP Master</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Masters</a></li>
                        <li class="breadcrumb-item active">MPP Master</li>
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
                <div>
                    <table>
                        <tr>
                            <td style="width: 600px;">
                                <!-- /.card-body -->

                                <div class="card-body">
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Plant Name<span style="color: red;">*</span></label>
                                        <div class="col-sm-5">
                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="plant" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                                            <content template>
                                                <asp:DropDownList ID="plant" runat="server"
                                                    AutoPostBack="False" CssClass="custom-select" >
                                                </asp:DropDownList>
                                            </content>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">MCC Name<span style="color: red;">*</span></label>
                                        <div class="col-sm-5">
                                           
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mcc" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                                            <content template>
                                                <asp:DropDownList ID="mcc" runat="server"
                                                    AutoPostBack="False" CssClass="custom-select">
                                                </asp:DropDownList>
                                            </content>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">BMC Name<span style="color: red;">*</span></label>
                                        <div class="col-sm-5">
                                           
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="bmc" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                                            <content template>
                                                <asp:DropDownList ID="bmc" runat="server"
                                                    AutoPostBack="False" CssClass="custom-select">
                                                </asp:DropDownList>
                                            </content>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Route Name<span style="color: red;">*</span></label>
                                        <div class="col-sm-5">
                                           
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="route" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                                            <content template>
                                                <asp:DropDownList ID="route" runat="server"
                                                    AutoPostBack="true" CssClass="custom-select">
                                                </asp:DropDownList>
                                            </content>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Address</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" id="txtAddress" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">City</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" id="txtcity" runat="server"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Contact No</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" id="txtmobileNo" runat="server"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-4 col-form-label">Activation Date</label>
                                        <div class="col-sm-5">
                                            <input type="date" runat="server" id="txtdate" value="dd-MM-yyyy" />
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td style="width: 600px;">
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">State<span style="color: red;">*</span></label>
                                    <div class="col-sm-5">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="state" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                                            <content template>
                                                <asp:DropDownList ID="state" runat="server"
                                                    AutoPostBack="True" CssClass="custom-select" OnSelectedIndexChanged="state_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </content>
                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">District<span style="color: red;">*</span></label>
                                    <div class="col-sm-5">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="District" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                                            <content template>
                                                <asp:DropDownList ID="District" runat="server"
                                                    AutoPostBack="True" CssClass="custom-select" OnSelectedIndexChanged="District_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </content>
                                            
                                       
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Tehsil<span style="color: red;">*</span></label>
                                    <div class="col-sm-5">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Subdistrict" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                                            <content template>
                                                <asp:DropDownList ID="Subdistrict" runat="server"
                                                    AutoPostBack="True" CssClass="custom-select" OnSelectedIndexChanged="Subdistrict_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </content>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Village<span style="color: red;">*</span></label>
                                    <div class="col-sm-5">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Village" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                                            <content template>
                                                <asp:DropDownList ID="Village" runat="server"
                                                    AutoPostBack="True" CssClass="custom-select" OnSelectedIndexChanged="Village_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </content>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Hamlet<span style="color: red;">*</span></label>
                                    <div class="col-sm-5">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Hamlet" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                                            <content template>
                                                <asp:DropDownList ID="Hamlet" runat="server"
                                                    AutoPostBack="False" CssClass="custom-select" OnSelectedIndexChanged="Hamlet_SelectedIndexChanged1" >
                                                </asp:DropDownList>
                                            </content>
                                       
                                           
                                      
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">MPP Code<span style="color: red;">*</span></label>
                                    <div class="col-sm-5">
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtMppCode" ErrorMessage="Please Enter " ForeColor="#CC3300"></asp:RequiredFieldValidator>
                        <asp:TextBox CssClass="form-control" ID="txtMppCode" runat="server" AutoPostBack="true" ></asp:TextBox>
                        <asp:Label ID="lbltxtMppCode" runat="server" Text="" CssClass="col-sm-2 col-form-label"></asp:Label>
                                        
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">MPP Name<span style="color: red;">*</span></label>
                                    <div class="col-sm-5">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtMppNm" ErrorMessage="Please Enter " ForeColor="#CC3300"></asp:RequiredFieldValidator>
                        <asp:TextBox CssClass="form-control" ID="txtMppNm" runat="server" AutoPostBack="true" ></asp:TextBox>
                        <asp:Label ID="lbltxtMppNm" runat="server" Text="" CssClass="col-sm-2 col-form-label"></asp:Label>
                                      
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <input class="form-check-input" type="checkbox" runat="server" id="isactive"  />
                                    <label class="form-check-label">Is MPP Active</label>
                                </div>

                            </td>
                        </tr>
                    </table>
                    <!-- /.card-body -->
                </div>

                <div class="card-footer">
                    <table style="margin-left: 500px;">
                        <tr>
                            <td>
                               <asp:Button ID="Create" CssClass="btn btn-primary" runat="server" onclick="Button1_Click" Text="Save" > </asp:Button></td>
                            <td>
                                  <asp:Button ID="Button1" CssClass="btn btn-default float-right" runat="server" onclick="Cancel_Click" Text="Cancel"  CausesValidation="false"> </asp:Button></td>
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

