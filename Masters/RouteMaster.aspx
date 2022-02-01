<%@ Page Title="KMPS | Route Master" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RouteMaster.aspx.cs" Inherits="Masters_RouteMaster" %>

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
            .form-group{
                margin-left:160px;
            }
            .form-control{
                width:500px;
            }

        </style>

    </header>



    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Route Master</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Masters</a></li>
                        <li class="breadcrumb-item active">Route Master</li>
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
                        <label class="col-sm-2 col-form-label">Plant Name<span style="color:red;">*</span></label>
                        <div class="col-sm-7">
                            <asp:DropDownList ID="selectplant" runat="server"   
          AutoPostBack="false"  CssClass="custom-select">
      </asp:DropDownList>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">MCC Name<span style="color:red;">*</span></label>
                         <div class="col-sm-7">
                            <asp:DropDownList ID="selectmcc" runat="server"   
          AutoPostBack="false"  CssClass="custom-select">
      </asp:DropDownList>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label class="col-sm-2 col-form-label">BMC Name<span style="color:red;">*</span></label>
                         <div class="col-sm-7">
                           <asp:DropDownList ID="bmc" runat="server"   
          AutoPostBack="false"  CssClass="custom-select">
      </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Route Code<span style="color:red;">*</span></label>
                        <div class="col-sm-10">
                             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRouteCode" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <content template>
                            <asp:textbox  id="txtRouteCode" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtRouteCode_TextChanged" ></asp:textbox>
                          <asp:Label ID="lbltxtRouteCode" runat="server" Text=""></asp:Label>
                            </content>
                           
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Route Name<span style="color:red;">*</span></label>
                        <div class="col-sm-10">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtRouteNm" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <content template>
                            <asp:textbox  id="txtRouteNm" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtRouteNm_TextChanged" ></asp:textbox>
                          <asp:Label ID="lbltxtRouteNm" runat="server" Text=""></asp:Label>
                            </content>
                           
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Route Distance</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="txtdistance"  runat="server"/>
                        </div>
                    </div>
                    
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                    <table style="margin-left:500px;">
                        <tr>
                            <td>
                                <asp:Button ID="Create" class="btn btn-primary" runat="server" onclick="Button1_Click" Text="Save" ></asp:Button></td>
                            <td>
                                <asp:Button ID="Button1" class="btn btn-primary" runat="server" onclick="Cancle_Click" Text="Cancel"  CausesValidation="false"></asp:Button></td>                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" BackColor="#00FF99"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>


                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->


</asp:Content>
