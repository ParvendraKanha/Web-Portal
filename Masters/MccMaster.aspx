<%@ Page Title="KMPC | MCC Master" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MccMaster.aspx.cs" Inherits="Masters_MccMaster" %>

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
            .form-group {
                margin-left: 160px;
            }

            .form-control {
                width: 500px;
            }
        </style>

         




    </header>



    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>MCC Master</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Masters</a></li>
                        <li class="breadcrumb-item active">MCC Master</li>
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
                        <label class="col-sm-2 col-form-label">Plant Name*</span></label>
                        <div class="col-sm-7">
                            <asp:DropDownList ID="tblPlant" runat="server"   
          AutoPostBack="false"  CssClass="custom-select" >
      </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">MCC Code<span style="color:red;">*</span></label>
                        <div class="col-sm-10">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                           
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMccCode" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <content template>
                            <asp:textbox  id="txtMccCode" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtMccCode_TextChanged"></asp:textbox>
                          <asp:Label ID="lbltxtMccCode" runat="server" Text=""></asp:Label>
                            </content>
                                </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">MCC Name<span style="color:red;">*</span></label>
                        <div class="col-sm-10">
                           
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMccNm" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <content template>
                            <asp:textbox  id="txtMccNm" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtMccNm_TextChanged"></asp:textbox>
                          <asp:Label ID="lbltxtMccNm" runat="server" Text=""></asp:Label>
                            </content>
                           
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Other Code<span style="color:red;">*</span></label>
                        <div class="col-sm-10">
                           
                           
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtOthrcode" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <content template>
                            <asp:textbox  id="txtOthrcode" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtOthrcode_TextChanged" ></asp:textbox>
                          <asp:Label ID="lblothercode" runat="server" Text=""></asp:Label>
                            </content>
                                </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Address</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="txtAddress"  runat="server"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label"> City </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="txtCity"  runat="server" />

                        </div>
                    </div>
                    
                   
                    
                <!-- /.card-body -->
                <div class="card-footer">
                    <table style="margin-left: 500px;">
                        <tr>
                            <td>
                                <asp:Button ID="Create" class="btn btn-primary" runat="server" onclick="Button1_Click" Text="Save" ></asp:Button></td>
                            <td>
                                <asp:Button ID="Button1" class="btn btn-primary" runat="server" onclick="Cancle_Click" Text="Cancel"  CausesValidation="false"></asp:Button></td>
                        </tr>

                          <tr>
                           <td colspan="2">
                            
                                 <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                            </td>
                               
                        </tr>
                    </table>


                </div>

                          
               
                    </table>


                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->


   



</asp:Content>

      






