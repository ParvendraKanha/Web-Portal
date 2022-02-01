<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserRights.aspx.cs" Inherits="UserManagement_UserRights" %>

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

        <!-- DataTables -->
        <link rel="stylesheet" href="../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css" />
        <link rel="stylesheet" href="../plugins/datatables-responsive/css/responsive.bootstrap4.min.css" />
        <link rel="stylesheet" href="../plugins/datatables-buttons/css/buttons.bootstrap4.min.css" />

        <style type="text/css">
            .form-group {
                margin-left: 160px;
            }

            .form-control {
                width: 500px;
            }

            .form-check-label{
                margin-left:20px;
            }
            .form-check-input{
                 margin-left:0px;
            }
        </style>

    </header>



    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5>Assign User Group Rights</h5>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">User Management</a></li>
                        <li class="breadcrumb-item active">User Rights</li>
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
                   <%-- <h3 class="card-title">Add | Update | View</h3>--%>
                </div>
                <!-- /.card-body -->
                <div class="card-body">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">User Group Rights<span style="color: red;">*</span></label>
                        <div class="col-sm-3">
                            <select class="custom-select" id="ddlUserRights">
                                <option>--Select--</option>
                                <option>Admin</option>
                                <option>HO</option>
                                <option>MCC</option>
                                <option>BMC</option>
                            </select>
                        </div>
                    </div>

                </div>
                <!-- /.card-body -->
                <div class="card-body">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>SL. NO.</th>
                                <th>Menu</th>
                                <th colspan="3">Action</th>
                                <th></th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>State Master</td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">Add</label>
                                </td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">Delete</label>

                                </td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">View</label>

                                </td>
                                <td>
                                    <input type="button" value="Save" class="btn btn-sm btn-primary" id="btnSaveState" name="btnSave_1" />
                                </td>

                            </tr>
                             <tr>
                                <td>2</td>
                                <td>District Master</td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">Add</label>
                                </td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">Delete</label>

                                </td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">View</label>

                                </td>
                                <td>
                                    <input type="button" value="Save" class="btn btn-sm btn-primary" id="btnSaveDistrict" name="btnSave_1" />
                                </td>

                            </tr>
                             <tr>
                                <td>3</td>
                                <td>Tahsil Master</td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">Add</label>
                                </td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">Delete</label>

                                </td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">View</label>

                                </td>
                                <td>
                                    <input type="button" value="Save" class="btn btn-sm btn-primary" id="btnSaveTahsil" name="btnSave_1" />
                                </td>

                            </tr>
                             <tr>
                                <td>4</td>
                                <td>Village Master</td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">Add</label>
                                </td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">Delete</label>

                                </td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">View</label>

                                </td>
                                <td>
                                    <input type="button" value="Save" class="btn btn-sm btn-primary" id="btnSaveVillage" name="btnSave_1" />
                                </td>
                            </tr>
                             <tr>
                                <td>5</td>
                                <td>Hamlet Master</td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">Add</label>
                                </td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">Delete</label>

                                </td>
                                <td>
                                    <input class="form-check-input" type="checkbox"  />
                                    <label class="form-check-label">View</label>

                                </td>
                                <td>
                                    <input type="button" value="Save" class="btn btn-sm btn-primary" id="btnSaveHamlet" name="btnSave_1" />
                                </td>

                            </tr>
                        </tbody>
                    </table>


                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->


</asp:Content>

