<%@ Page Title="KMPC | State Master" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="State.aspx.cs" Inherits="Geographical_State" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <header>
        <script src="../Scripts/jquery-3.6.0.min.js"></script>
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
                    <h1>State Master</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Geographical Masters</a></li>
                        <li class="breadcrumb-item active">State Master</li>
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
                        <label class="col-sm-2 col-form-label">State Code<span style="color:red;">*</span></label>
                        <div class="col-sm-10">
                        <label class="col-sm-2 col-form-label"><span style="color:red;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStateCode" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            </span></label>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                           
                            <content template>
                            
                            <asp:TextBox   id="txtStateCode" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtStateCode_TextChanged" ></asp:TextBox>
                                </content>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                          
                            
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">State Name<span style="color:red;">*</span></label>
                        <div class="col-sm-10">
                            
                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStateNm" ErrorMessage="Please Enter " ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            
                          
                           
                            <content template>
                            <asp:TextBox   id="txtStateNm" CssClass="form-control" runat="server"  AutoPostBack="true" OnTextChanged="txtStateNm_TextChanged1"></asp:TextBox>
                        </content>
                             <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                </div>
                    </div>
                    
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                    <table style="margin-left:500px;">
                        <tr>
                            <td>
                               <asp:Button ID="Create" CssClass="btn btn-primary" runat="server" onclick="Button1_Click" Text="Save" > </asp:Button></td>
                            <td>
                                  <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" onclick="Cancel_Click" Text="Cancel" CausesValidation="false" > </asp:Button></td>
                                
                             <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
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




