<%@ Page Title="KMPC | Village Master" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Village.aspx.cs" Inherits="Geographical_Village" %>

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
                    <h1>Village Master</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Geographical Masters</a></li>
                        <li class="breadcrumb-item active">Village Master</li>
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
                        <label class="col-sm-2 col-form-label">State Name<span style="color: red;">*</span></label>
                        <div class="col-sm-7">

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="state" ErrorMessage="Please Enter " ForeColor="#CC3300"></asp:RequiredFieldValidator>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                           

                            <content template>
                                <asp:DropDownList ID="state" runat="server"
                                    AutoPostBack="true" CssClass="custom-select" OnSelectedIndexChanged="state_SelectedIndexChanged" >
                                </asp:DropDownList>
                            </content>
                           
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">District Name<span style="color: red;">*</span></label>
                        <div class="col-sm-7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="district" ErrorMessage="Please Enter " ForeColor="#CC3300"></asp:RequiredFieldValidator>
                         

                            <content template>
                                <asp:DropDownList ID="district" runat="server"
                                    AutoPostBack="true" CssClass="custom-select" OnSelectedIndexChanged="district_SelectedIndexChanged">
                                </asp:DropDownList>
                            </content>
                            
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Tahsil Name<span style="color: red;">*</span></label>
                        <div class="col-sm-7">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="subdistrict" ErrorMessage="Please Enter " ForeColor="#CC3300"></asp:RequiredFieldValidator>
                           

                            <content template>
                                <asp:DropDownList ID="subdistrict" runat="server"
                                    AutoPostBack="true" CssClass="custom-select">
                                </asp:DropDownList>
                            </content>
                          
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Village Code<span style="color: red;">*</span></label>
                        <div class="col-sm-10">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtVillageCode" ErrorMessage="Please Enter " ForeColor="#CC3300"></asp:RequiredFieldValidator>
                            <asp:TextBox  cssclass="form-control" id="txtVillageCode" runat="server" OnTextChanged="txtVillageCode_TextChanged" AutoPostBack="true" ></asp:TextBox>
                        <asp:Label ID="lbltxtVillageCode" runat="server" Text="" CssClass="col-sm-2 col-form-label"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Village Name<span style="color: red;">*</span></label>
                        <div class="col-sm-10">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtVillageNm" ErrorMessage="Please Enter " ForeColor="#CC3300"></asp:RequiredFieldValidator>
                             <asp:TextBox  cssclass="form-control" id="txtVillageNm" runat="server" AutoPostBack="true" OnTextChanged="txtVillageNm_TextChanged" ></asp:TextBox>
                        <asp:Label ID="lbltxtVillageNm" runat="server" Text="" CssClass="col-sm-2 col-form-label"></asp:Label>
                            
                        </div>
                    </div>

                </div>
                <!-- /.card-body -->
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

