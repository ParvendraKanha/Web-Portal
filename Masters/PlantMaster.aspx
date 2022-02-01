<%@ Page Title="KMPS | Plant Master" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PlantMaster.aspx.cs" Inherits="Masters_PlantMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <header>
        <script src="../Scripts/jquery-3.6.0.js"></script>

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
                    <h1>Plant Master</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Masters</a></li>
                        <li class="breadcrumb-item active">Plant Master</li>
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
                        <label class="col-sm-2 col-form-label">Plant Code<span style="color:red;">*</span></label>
                        <div class="col-sm-10">
                           
                           
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                           
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPlantCode" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <content template>
                          
                                 <asp:TextBox   id="txtPlantCode" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtPlantCode_TextChanged"  ></asp:TextBox>
                                 <asp:Label ID="lbltxtPlantCode" runat="server" Text=""></asp:Label>
                            </content>
                            </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Plant Name<span style="color:red;">*</span></label>
                        <div class="col-sm-10">
                          
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPlantNm" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <content template>
                          
                                 <asp:TextBox   id="txtPlantNm" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtPlantNm_TextChanged" ></asp:TextBox>
                                 <asp:Label ID="lbltxtPlantNm" runat="server" Text=""></asp:Label>
                            </content>
                            
                           
                        </div>



                    </div>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Other Code Name<span style="color:red;">*</span></label>
                        <div class="col-sm-10">
                          
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtothercode" ErrorMessage="Please Enter "></asp:RequiredFieldValidator>
                            <content template>
                          
                                 <asp:TextBox   id="txtothercode" CssClass="form-control" runat="server" AutoPostBack="true" ></asp:TextBox>
                                 <asp:Label ID="lbltxtothercode" runat="server" Text=""></asp:Label>
                            </content>
                            
                           
                        </div>



                    </div>



                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Address</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="txtPlantAddress" runat="server" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">City</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="txtCity"  runat="server" />
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                    <table style="margin-left:500px;">
                        <tr>
                            <td>
                                <asp:Button ID="Create" class="btn btn-primary" runat="server" onclick="Button1_Click" Text="Save" > </asp:Button></td>
                                
                            <td>
                                <asp:Button ID="Button1" class="btn btn-primary" runat="server" onclick="Cancle_Click" Text="Cancel"  CausesValidation="false"></asp:Button></td>
                               
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
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


