<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <script src="js_user/customerMgmt.js" type="text/javascript"></script>
        <%@include file="upp.jsp" %>
        
        
        
    </head>
    <body onload="noBack();"  onpageshow="if (event.persisted) noBack();" onunload="" class="skin-blue">
  
        <!-- header logo: style can be found in header.less -->
        <jsp:include page="head.jsp"></jsp:include>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <%@include file="aside.jsp" %>
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside id="addContent" class="right-side">
                <!-- Content Header (Page header) -->
                
                 <section class="content">
              
                 <div class="row">
                        <!-- left column -->
                        <div class="col-md-6">
                            <!-- general form elements -->
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Message</h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                              
                                    <div class="box-body">
                                      
                                      <div id="errorMessages"  >${requestScope['Messages']}</div>
                                        <br/>
                                        <br/><br/>
                                         
                                    </div><!-- /.box-body -->

                                 
                        
                            </div><!-- /.box -->

                            <!-- Form Element sizes -->
                           <!-- /.box -->

                         

                            <!-- Input addon -->
                           <!-- /.box -->

                        </div><!--/.col (left) -->
                        <!-- right column -->
                      <!--/.col (right) -->
                    </div>
<br/>
<br/>
<br/>
                </section>
                
                
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Custom Tabs (Pulled to the right) -->
                           
                            <!-- nav-tabs-custom -->
                        </div>
                        <!-- /.col -->
                    </div>
                </section>
                <!-- /.content -->
            </aside>
            <!-- /.right-side -->
        </div>
        <!-- ./wrapper -->
        <!-- jQuery 2.0.2 -->
        <!--<script src="js/jquery.min.js"></script>-->
        <!--<script src="js/jquery.js"></script>-->
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/jquery.min.js"></script>
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
        <!-- Page script --> <script type="text/javascript">
            $(function() {
//                 populateProductQty();
//                 goodsListPapulate();
                //Datemask dd/mm/yyyy
                $("#datemask").inputmask("dd-mm/--yyyy", {"placeholder": "dd-mm-yyyy"});
                //Datemask2 mm/dd/yyyy
                $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
                //Money Euro
                $("[data-mask]").inputmask();

                //Date range picker
                $('#reservation').daterangepicker();
                //Date range picker with time picker
                $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
                //Date range as a button
                $('#daterange-btn').daterangepicker(
                {
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                        'Last 7 Days': [moment().subtract('days', 6), moment()],
                        'Last 30 Days': [moment().subtract('days', 29), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                    },
                    startDate: moment().subtract('days', 29),
                    endDate: moment()
                },
                function(start, end) {
                    $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                }
            );

                //iCheck for checkbox and radio inputs
                $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                    checkboxClass: 'icheckbox_minimal',
                    radioClass: 'iradio_minimal'
                });
                //Red color scheme for iCheck
                $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                    checkboxClass: 'icheckbox_minimal-red',
                    radioClass: 'iradio_minimal-red'
                });
                //Flat red color scheme for iCheck
                $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                    checkboxClass: 'icheckbox_flat-red',
                    radioClass: 'iradio_flat-red'
                });
            });
        </script>

    </body>
</html>