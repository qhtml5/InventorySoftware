<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>SMS | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js_user/serviceLogMgmt.js"></script>
    </head>
    <body class="skin-blue">
        <jsp:include page="head.jsp"/>
        <div class="wrapper row-offcanvas row-offcanvas-left">
        
            <%@include file="aside.jsp" %>
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <section class="content-header">
                    <h1> Service Log
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="#">New</a></li>
                        <li class="active">Service Log</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Customer Id & Customer Name :  &nbsp;&nbsp;&nbsp;<label id="cusName"></label> </h3>
                                    <div class="box-tools">
                                        <div class="input-group">
                                            <select class="form-control input-sm pull-right" style="width: 150px;" id="cId" name="cId" onchange="getCusDetailByCID(this.value);">
                                            </select>
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-default" id="getListCustService" name="getListCustService" onclick="getListOfCustServceDetail();"><i class="fa fa-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <table id="imgRow" class="table table-hover" style="display: none">
                                        <tr>
                                        <form role="form" name="myForm" action="UploadDownloadFileServlet" method="post" enctype="multipart/form-data" runat="server">
                                            <td style="width:200px"><h4>Installation Report</h4></td>

                                            <td style="width:200px">
                                                <input type="hidden"  id="ccId" name="ccId"/>
                                                <input type="file" id="fileName" name="fileName"></td>
                                            <td><button type="submit" class="btn btn-primary">Submit</button></td>

                                            <td id="fileDload"></td>
                                        </form>
                                        </tr>
                                    </table>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body table-responsive no-padding">
                                    <table class="table table-hover">
                                        <tr><td colspan="8"><b>Mendatory Service</b></tr>
                                        <tr>
                                            <th>SR No.</th>
                                            <th>Type</th>
                                            <th>Start Date </th>
                                            <th>End Date </th>
                                            <th>Customer Id </th>
                                            <th>Status</th>
                                            <th>Edit</th>
                                            <th>Report</th>
                                        </tr>
                                        <tr>
                                        <tbody id="rowOfServiceCMCAMC">
                                        </tbody>
                                        </tr>
                                    </table>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Call Service</h3>
                                    <div class="box-tools">
                                        <div class="pull-right">
                                            <button id="newCallService" name="newCallService" class="btn btn-primary" onclick="addCallService();">Add Call Service</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.box-header -->
                                <div class="box-body table-responsive no-padding">
                                    <table class="table table-hover">
                                        <tr>
                                        <tbody id="dynaTable">
                                        </tbody>
                                        </tr>
                                    </table>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->
                        </div>
                    </div>
                </section>
                <!-- /.content -->
            </aside>
            <!-- /.right-side -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>

        <!-- InputMask -->
        <script src="js/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
        <script src="js/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
        <script src="js/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
        <!-- date-range-picker -->
        <script src="js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

        <!-- AdminLTE App -->
        <script src="js/AdminLTE/app.js" type="text/javascript"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="js/AdminLTE/demo.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function(){
                customerListPapulate();
            });

        </script>
    </body>
</html>