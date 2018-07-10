<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
    <head>
        <script src="js_user/customerMgmt.js" type="text/javascript"></script>
        <%@include file="upp.jsp" %>
        
      <script>
        function called()
        {
        $("#example1").dataTable();
        $('#example2').dataTable({
            "bPaginate": true,
            "bLengthChange": false,
            "bFilter": false,
            "bSort": true,
            "bInfo": true,
            "bAutoWidth": false
        });
        }
        </script>
 
    </head>
    <body onload="noBack();"  onpageshow="if (event.persisted) noBack();" onunload="" class="skin-blue">
  
        <!-- header logo: style can be found in header.less -->
        <jsp:include page="head.jsp"></jsp:include>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <%@include file="aside.jsp" %>
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside onload="called()" id="addContent" class="right-side">
                 <section class="content">
                 <div class="row">
                        <div class="col-md-6">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Message</h3>
                                </div>

                                    <div class="box-body">
                                      <div id="Messages"  >${requestScope['Messages']}</div>
                                    </div>
                            </div>
                        </div>
                  </div>
	                </section>
	          </aside>
	            <!-- /.right-side -->
	        </div>
	
    </body>
</html>