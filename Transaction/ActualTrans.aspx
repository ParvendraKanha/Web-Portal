<%@ Page Title="KMPS | RMRD Transaction" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ActualTrans.aspx.cs" Inherits="Transaction_ActualTrans" %>

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

        <!-- DataTables JavaScript -->
        <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
        <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
        <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

        <!-- Export JavaScript -->
        <script src="../vendor/datatables/js/dataTables.buttons.min.js"></script>
        <script src="../vendor/datatables/js/buttons.html5.min.js"></script>
        <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
        <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.4.0/js/buttons.print.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.4.0/js/buttons.flash.min.js"></script>

        <link href="https://cdn.datatables.net/buttons/1.4.0/css/buttons.dataTables.min.css" rel="stylesheet" />

        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" />
        <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

        <style type="text/css">
            .pagination {
                display: inline-block;
                padding-left: 0;
                margin: 20px 0;
                border-radius: 4px;
            }

                .pagination > li {
                    display: inline;
                }

                    .pagination > li > a,
                    .pagination > li > span {
                        position: relative;
                        float: left;
                        padding: 6px 12px;
                        margin-left: -1px;
                        line-height: 1.42857143;
                        color: #337ab7;
                        text-decoration: none;
                        background-color: #fff;
                        border: 1px solid #ddd;
                    }

                    .pagination > li:first-child > a,
                    .pagination > li:first-child > span {
                        margin-left: 0;
                        border-top-left-radius: 4px;
                        border-bottom-left-radius: 4px;
                    }

                    .pagination > li:last-child > a,
                    .pagination > li:last-child > span {
                        border-top-right-radius: 4px;
                        border-bottom-right-radius: 4px;
                    }

                    .pagination > li > a:hover,
                    .pagination > li > span:hover,
                    .pagination > li > a:focus,
                    .pagination > li > span:focus {
                        z-index: 2;
                        color: #23527c;
                        background-color: #007bff;
                        border-color: #ddd;
                    }

                .pagination > .active > a,
                .pagination > .active > span,
                .pagination > .active > a:hover,
                .pagination > .active > span:hover,
                .pagination > .active > a:focus,
                .pagination > .active > span:focus {
                    z-index: 3;
                    color: #fff;
                    cursor: default;
                    background-color: #007bff;
                    border-color: #337ab7;
                }

                .pagination > .disabled > span,
                .pagination > .disabled > span:hover,
                .pagination > .disabled > span:focus,
                .pagination > .disabled > a,
                .pagination > .disabled > a:hover,
                .pagination > .disabled > a:focus {
                    color: #777;
                    cursor: not-allowed;
                    background-color: #fff;
                    border-color: #ddd;
                }

            .pagination-lg > li > a,
            .pagination-lg > li > span {
                padding: 10px 16px;
                font-size: 18px;
                line-height: 1.3333333;
            }

            .pagination-lg > li:first-child > a,
            .pagination-lg > li:first-child > span {
                border-top-left-radius: 6px;
                border-bottom-left-radius: 6px;
            }

            .pagination-lg > li:last-child > a,
            .pagination-lg > li:last-child > span {
                border-top-right-radius: 6px;
                border-bottom-right-radius: 6px;
            }

            .pagination-sm > li > a,
            .pagination-sm > li > span {
                padding: 5px 10px;
                font-size: 12px;
                line-height: 1.5;
            }

            .pagination-sm > li:first-child > a,
            .pagination-sm > li:first-child > span {
                border-top-left-radius: 3px;
                border-bottom-left-radius: 3px;
            }

            .pagination-sm > li:last-child > a,
            .pagination-sm > li:last-child > span {
                border-top-right-radius: 3px;
                border-bottom-right-radius: 3px;
            }

            .pager {
                padding-left: 0;
                margin: 20px 0;
                text-align: center;
                list-style: none;
            }

                .pager li {
                    display: inline;
                }

                    .pager li > a,
                    .pager li > span {
                        display: inline-block;
                        padding: 5px 14px;
                        background-color: #fff;
                        border: 1px solid #ddd;
                        border-radius: 15px;
                    }

                        .pager li > a:hover,
                        .pager li > a:focus {
                            text-decoration: none;
                            background-color: #eee;
                        }

                .pager .next > a,
                .pager .next > span {
                    float: right;
                }

                .pager .previous > a,
                .pager .previous > span {
                    float: left;
                }

                .pager .disabled > a,
                .pager .disabled > a:hover,
                .pager .disabled > a:focus,
                .pager .disabled > span {
                    color: #777;
                    cursor: not-allowed;
                    background-color: #fff;
                }
        </style>

        <style type="text/css">
            thead,
            tfoot {
                background-color: #41f491;
                /*color: #fff;*/
                text-align: left;
            }


            /* tbody {
                background-color: #e4f0f5;
            }*/

            caption {
                padding: 10px;
                caption-side: bottom;
            }

            .table-bordered thead th, .table-bordered thead td {
                background-color: #007bff;
            }

            /* table {
                border-collapse: collapse;
                border: 1px solid rgb(200, 200, 200);
                letter-spacing: 1px;
                font-family: sans-serif;
                font-size: 10px;
            }*/

            /*td {
                
                border: 0px solid rgb(190, 190, 190);
                padding: 5px 10px;
                text-align: left;
                font-size: 11px;
                white-space: nowrap;
            }*/

            th {
                border: 0px solid rgb(190, 190, 190);
                padding: 5px 10px;
                text-align: left;
                font-size: 15px;
                color: white;
            }

            td {
                text-align: left;
            }


            /*input {
                text-transform: uppercase;
            }*/



            .html5buttons {
                float: right;
                margin-left: 763px;
                margin-top: 25px;
            }

            .dt-buttons {
                margin-left: 10px;
            }

            .dataTables_length {
                float: left;
                margin-top: -60px;
                margin-left: 10px;
            }

            .dataTables_filter {
                max-width: 100%;
                margin-top: -47px;
                font-weight: 500;
                margin-left: 324px;
            }

            .dataTables_info {
                margin-right: 80px;
                margin-top: -10px;
                margin-left: 10px;
            }

            #UserList_paginate {
                margin-left: 10px;
                margin-top: -20px;
            }

            #UserList {
                margin-left: 10px;
                margin-right: 10px;
            }
        </style>

        <script src="../Js/PourerTrans.js"></script>
    </header>



    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>RMRD Transaction</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Transaction</a></li>
                        <li class="breadcrumb-item active">Actual Transaction</li>
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
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>Plant Code</label>
                                <input type="text" class="form-control" placeholder="Enter ..." />
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>MCC</label>
                                <select class="custom-select" id="ddlMCC">
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>BMC</label>
                                <select class="custom-select" id="ddlBMC">
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>MPP</label>
                                <select class="custom-select" id="ddlMPP">
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>Date Of Shift</label>
                                <input type="text" class="form-control" placeholder="Enter ..." />
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <label>Shift</label>
                            <div class="form-group clearfix">

                                <div class="icheck-primary d-inline">
                                    <input type="radio" id="radioPrimary1" name="r1" />
                                    <label for="radioPrimary1">
                                        Morning                       
                                    </label>
                                </div>
                                <div class="icheck-primary d-inline">
                                    <input type="radio" id="radioPrimary2" name="r1" />
                                    <label for="radioPrimary2">
                                        Evening                       
                                    </label>
                                </div>
                            </div>
                        </div>

                        
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>Cattle Type</label>
                                <select class="custom-select" id="ddlCattle">
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>Milk Type</label>
                                <select class="custom-select" id="ddlMilkType">
                                </select>
                            </div>
                        </div>
                                               

                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>No Of Cans</label>
                                <input type="text" class="form-control" placeholder="Enter ..." />
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>Truck No</label>
                                <input type="text" class="form-control" placeholder="Enter ..." />
                                
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>Arrival Time</label>
                                <input type="text" class="form-control" placeholder="Enter ..." />
                                
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group">
                                <label>Smaple No</label>
                                <input type="text" class="form-control" placeholder="Enter ..." />
                                
                            </div>
                        </div> 
                        <div class="col-sm-1">
                            <div class="form-group">
                                <label>QTY</label>
                                <input type="text" class="form-control" placeholder="Enter ..." />
                            </div>
                        </div>
                        <div class="col-sm-1">
                            <div class="form-group">
                                <label>FAT</label>
                                <input type="text" class="form-control" placeholder="Enter ..." />
                            </div>
                        </div>
                        <div class="col-sm-1">
                            <div class="form-group">
                                <label>SNF</label>
                                <input type="text" class="form-control" placeholder="Enter ..." />
                            </div>
                        </div>
                        <div class="col-sm-1">
                            <div class="form-group">
                                <label>Rate</label>
                                <input type="text" class="form-control" disabled />
                            </div>
                        </div>
                        <div class="col-sm-1">
                            <div class="form-group">
                                <label>Amount</label>
                                <input type="text" class="form-control" disabled />
                            </div>
                        </div>

                    </div>
                </div>
                <!-- /.card-body -->

                <table style="margin-left: 435px;">
                    <tr>
                        <td>
                            <button type="submit" id="btnAdd" class="btn btn-primary">Add</button>
                            <button type="submit" id="btnCancel" class="btn btn-default">Cancel</button></td>

                    </tr>
                </table>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-primary">
                                <%--<table id="UserList" class="table table-striped table-bordered table-hover" style="font-size: 12px;">
                                    <thead>
                                        <tr>
                                            <th>Plant</th>
                                            <th>MCC</th>
                                            <th>BMC</th>
                                            <th>MPP</th>
                                            <th>Member Name</th>
                                            <th>Collection Date</th>
                                            <th>Shift</th>
                                            <th>Cattle Type</th>
                                            <th>QTY</th>
                                            <th>FAT</th>
                                            <th>SNF</th>
                                            <th>RATE</th>
                                            <th>AMOUNT</th>
                                            <th>&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>--%>
                            </div>

                        </div>
                    </div>
                </div>




            </div>
        </div>
        <div id="LoadingImage" style="margin: 0px; padding: 0px; position: fixed; right: 0px; top: 0px; width: 100%; height: 100%; background-color: rgb(102, 102, 102); z-index: 30001; filter: alpha(opacity=60); -moz-opacity: 0.8; opacity: 0.8; display: none;">
            <p style="position: absolute; color: White; top: 50%; left: 45%; z-index: 1000; filter: alpha(opacity=100); opacity: 1; -moz-opacity: 1;">
                Loading data, please wait...
                                <br />
                <img src="../dist/img/Preloader_8.gif" />
            </p>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->


</asp:Content>

