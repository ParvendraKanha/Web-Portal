<%@ Page Title="KMPS | BMC Master" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BmcMaster2.aspx.cs" Inherits="Masters_BmcMaster2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <header>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css" />
        <!-- Theme style -->
        <link rel="stylesheet" href="../dist/css/adminlte.css" />

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
                    <h1>BMC Master</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Masters</a></li>
                        <li class="breadcrumb-item active">Bmc Master</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="card card-primary card-outline" style="left: 0px; top: 0px; height: 506px">
                <div class="card-header">
                    <h3 class="card-title">Add | Update | Delete | View</h3>
                </div>
                <!-- /.card-body -->
                <div class="card-body">
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Plant Name<span style="color:red;">*</span></label>
                        <div class="col-sm-7">
                            
                            <asp:DropDownList ID="tblPlant" runat="server"   
          AutoPostBack="false"  CssClass="custom-select">
      </asp:DropDownList>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">MCC Name<span style="color:red;">*</span></label>
                         <div class="col-sm-7" >
                          
                              <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                             <content template>
                           <asp:DropDownList ID="tblMcc" runat="server"   
          AutoPostBack="false"  CssClass="custom-select">
      </asp:DropDownList>
                                 </content>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">BMC Code<span style="color:red;">*</span></label>
                        <div class="col-sm-10">
                         
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBmcCode" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <content template>
                            <asp:textbox  id="txtBmcCode" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtBmcCode_TextChanged" ></asp:textbox>
                          <asp:Label ID="lbltxtBmcCode" runat="server" Text=""></asp:Label>
                            </content>
                           
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">BMC Name<span style="color:red;">*</span></label>
                        <div class="col-sm-10">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBmcNm" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <content template>
                            <asp:textbox  id="txtBmcNm" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtBmcNm_TextChanged" ></asp:textbox>
                          <asp:Label ID="lbltxtBmcNm" runat="server" Text=""></asp:Label>
                            </content>
                           
                        </div>
                    </div>
                     
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Address</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="txtAddress" runat="server" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">City</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="txtCity" runat="server" />
                        </div>
                    </div>
                    <div class="form-group row">
                        &nbsp;<div class="col-sm-10">
                            &nbsp;</div>
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
                           
                           
                                </tr>
                      
                        <tr>
                           <td colspan="2">
                            
                                 <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
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




