<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.LoginUserCompanyMasterDto"%>
<html>
<head>

<%@include file="upp.jsp"%>


<!-- Simple Tabs -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/login.css" />

<script type="text/javascript" src="js/modalPopLite.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/simpletabs_1.3.js"></script>
<style type="text/css" media="screen">
@import "<%=request.getContextPath()%>/css/simpletabs.css";
</style>
<!-- Simple Tabs -->

<script>
	function called() {
		$("#example1").dataTable();
	
		$('#example2').dataTable({
			"bPaginate" : false,
			"bLengthChange" : false,
			"bFilter" : false,
			"bSort" : true,
			"bInfo" : true,
			"bAutoWidth" : false
		});
	}
</script>
<script>
	function validateContent() {

		var nameofcompany = $('#nameofcompany').val();
		var phoneno = $('#phoneno').val();
		var contactperson = $('#contactperson').val();
		var Email = $('#Email').val();
		var address = $('#address').val();
		var userName = $('#userName').val();
		var password = $('#passwords').val();

		if (nameofcompany == "") {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Enter a Suitable Company Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if (phoneno == "") {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Phone number required! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if (contactperson == "") {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Contact person name required! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		}

		else if (Email == "") {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Valid Email required! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		}

		else if (address == "") {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Full and correct address required! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		}

		else if (userName == "") {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Valid Login Name Required! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		}

		else if (password == "") {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Password Required!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		}

		else {
			document.getElementById("CompanyForm1").submit();
		}

	}
</script>


</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="" class="skin-blue">
<input type="hidden" name="fYearS" id="fYearS" value="${sessionScope['fYear']}">
	<!-- header logo: style can be found in header.less -->
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="aside.jsp"%>
		<!-- Right side column. Contains the navbar and content of the page -->
		<aside onchange="called()" id="addContent" class="right-side">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					DashBoard <small> Control panel</small>
				</h1>
				&nbsp;
				<s:if test="#request.message!=null">
					<b><%=request.getAttribute("message")%></b>
				</s:if>
				<s:else>


				</s:else>
				
			
				
			</section>
			<%-- <jsp:include page="admin/dashBoard.jsp"></jsp:include> --%>

			<section class="content">
				<div class="row">

					<!-- ./col -->
				</div>
				<div>
					<iframe src="clock.html" width="957px" scrolling="no"
						style="overflow: hidden"> </iframe>
				</div>
				<!-- /.row -->
				<div class="col-md-6">
					<!-- general form elements disabled -->
					<div class="box box-warning">
						<div class="box-header"></div>
						<!-- /.box-header -->
						<div class="box-body">

							<br />

                                                     
							<div class="col-lg-3 col-xs-6">
								<!-- small box -->
								<div class="small-box bg-aqua">
									<div class="inner">
										<h3></h3>
										<p>
											TOTAL SALES <b>${sessionScope['saleSize']}</b>

										</p>
									</div>
									<div class="icon">
										<img src="img/sales.png" height="70px" width="70px"
											style="margin: 20px -18px -2px 50px" />
									</div>

									<a href="salesListCall.action" onmouseover="called()" onmousemove="called()"
										onmouseout="called()"
										onclick=""
										class="small-box-footer"> More info <i
										class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-xs-6">
								<!-- small box -->
								<div class="small-box bg-green">
									<div class="inner">
										<h3>
											<sup style="font-size: 20px"></sup>
										</h3>
										<p>
											TOTAL PURCHASES <b>${sessionScope['totalstock']}</b>
										</p>
									</div>
									<div class="icon">
										<img src="img/purchase.png" height="70px" width="70px"
											style="margin: 20px -23px 12px 44px" />
									</div>
									<a href="stockListCall.action" class="small-box-footer"
										onclick="">
										More info <i class="fa fa-arrow-circle-right"></i>
									</a>
                                    
                                   
								</div>
							</div>
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<!-- ./col -->
							<div class="col-lg-3 col-xs-6">
								<!-- small box -->
								<div class="small-box bg-yellow">
									<div class="inner">
										<h3></h3>
										<p>
											TOTAL SUPPLIERS <b>${sessionScope['totalsupplier']}</b>
										</p>
									</div>
									<div class="icon">
										<img src="img/supplier.png" height="70px" width="70px"
											style="margin: 20px -20px 1px 51px" />
									</div>
									<a href="#" class="small-box-footer"
										onClick="viewSupplierList('<%=request.getContextPath()%>')">
										More info <i class="fa fa-arrow-circle-right"></i>
									</a>

								</div>
                                                                          
                                                                          
                                                    
                                                                          
                                                                          
								<div class="small-box bg-yellow">
									<div class="inner">
										<h3></h3>
										<p>
											TOTAL PRODUCTS <b>${sessionScope['itemSize']}</b>
										</p>
									</div>
									<div class="icon">
										<img src="img/products.png" height="70px" width="70px"
											style="margin: 20px -18px -38px 50px" />
									</div>
									<a href="#" class="small-box-footer" onmouseover="called()"
										onmousemove="called()" onmouseout="called()"
										onclick="addItemCall('<%=request.getContextPath()%>')">
										More info <i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>

							</div>
							<!-- ./col -->
							<div class="col-lg-3 col-xs-6">
								<!-- small box -->
								<div class="small-box bg-red">
									<div class="inner">
										
										<p>
											TOTAL CUSTOMERS <b>${sessionScope['totalcustomer']}</b>
										</p>
									</div>
									<div class="icon">
										<img src="img/customer.png" height="70px" width="70px"
											style="margin: 20px -29px 11px 55px" />
									</div>
									<a href="#" class="small-box-footer"
										onclick="editCustomerCall('0','<%=request.getContextPath()%>')">
										More info <i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
							<!-- <div class="col-lg-3 col-xs-6">
						small box
						<div class="small-box bg-red">
							<div class="inner">
								
								<p>
									VIEW DEBITED ITEMS
								</p>
							</div>
							<div class="icon">
								<img src="img/scheme.png" height="70px" width="70px" style="margin: 20px -19px -35px 50px"/>
							</div>
						<a href="viewDebitNote.action" class="small-box-footer" onmouseover="called()" onmousemove="called()"  onmouseout="called()">More info <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div> -->

							<div class="col-lg-3 col-xs-6">
								<div class="small-box bg-red">
									<div class="inner">
										<p>
											TOTAL USERS :<b>${sessionScope['totaluser']}</b>
										</p>
									</div>
									<div class="icon">
										<img src="img/customer.png" height="70px" width="70px"
											style="margin: 20px -19px -35px 50px" />
									</div>

									<s:if test="#session.roleStatus.equalsIgnoreCase('ADMIN')">
										<a href="#" class="small-box-footer"
											onclick="document.getElementById('companyDiv').style.display='block'; document.getElementById('fade1').style.display='block'">Edit
											Company details <i class="fa fa-arrow-circle-right"></i>
										</a>
									</s:if>
								</div>
							</div>


							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />
							<br />

						</div>
					</div>
				</div>
				
				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<section class="col-lg-6 connectedSortable">
						<div class="row">
							<div class="col-md-9">
								<div class="box box-primary">
									<div class="box-body no-padding">
										<!-- THE CALENDAR -->
										<img src="img/BarChart.jpeg" height="470px" width="530px"/>
									</div>
									<!-- /.box-body -->
								</div>
								<!-- /. box -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</section>
				</div>
				

				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<section class="col-lg-6 connectedSortable">
						<div class="row">
							<div class="col-md-9">
								<div class="box box-primary">
									<div class="box-body no-padding">
										<!-- THE CALENDAR -->
										<div id="calendar"></div>
									</div>
									<!-- /.box-body -->
								</div>
								<!-- /. box -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</section>
				</div>




			</section>

		</aside>





		<div id="companyDiv" class="white_content_company">
			<a href="javascript:void(0) "
				onclick="document.getElementById('companyDiv').style.display='none';document.getElementById('fade1').style.display='none'">
				<img src="img/Close-button.png" border="0" />
			</a>

			<div id="companyFormHeading1" style="margin: 0 0 0 310px;">
				<p>
					<b>Edit company details</b>
				</p>
			</div>
			<div id="validation"></div>
			<div style="height: 400px; overflow-y: scroll;">
				<s:form action="companyDetailsUpdate.action" id="CompanyForm1"
					method="post" theme="simple" enctype="multipart/form-data">

					<table>
						<tr>
							<td colspan=2>
								<hr width="114%" />
							</td>
						</tr>
						<tr>
							<td colspan=2><b>Company Details</b></td>
						</tr>
						<tr>
							<td>Name of Company :<span
								style="color: #f00; font-size: 20px;">*</span></td>
							<td><s:textfield id="nameofcompany"
									cssClass="CompanyFormTextfield"
									name="lValidateDetails.nameofcompany" theme="simple"
									readonly="true" /></td>
						</tr>

						<tr>
							<td>Phone no :<span style="color: #f00; font-size: 20px;">*</span></td>
							<td><s:textfield id="phoneno"
									cssClass="CompanyFormTextfield" name="lValidateDetails.phoneno"
									theme="simple" readonly="true" /></td>
						</tr>

						<tr>
							<td>Contact person :<span
								style="color: #f00; font-size: 20px;">*</span></td>
							<td><s:textfield id="contactperson"
									cssClass="CompanyFormTextfield"
									name="lValidateDetails.contactperson" theme="simple"
									readonly="true" /></td>
						</tr>

						<tr>
							<td>Email :<span style="color: #f00; font-size: 20px;">*</span></td>
							<td><s:textfield id="Email" cssClass="CompanyFormTextfield"
									name="lValidateDetails.email" theme="simple" readonly="true" /></td>
						</tr>

						<tr>
							<td>Address :<span style="color: #f00; font-size: 20px;">*</span></td>
							<td><s:textarea id="address" cssClass="CompanyFormTextArea"
									name="lValidateDetails.address" cols="56" rows="2"
									theme="simple" readonly="true" /></td>
						</tr>

						<tr>
							<td>VAT No:</td>
							<td><div>
									<s:textfield id="vatno" cssClass="CompanyFormTextfield"
										name="lValidateDetails.vatno" theme="simple" />
								</div></td>
						</tr>

						<tr>
							<td>PAN No:</td>
							<td><s:textfield id="panno" cssClass="CompanyFormTextfield"
									name="lValidateDetails.panno" theme="simple" /></td>
						</tr>

						<tr>
							<td>Service Tax No:</td>
							<td><s:textfield id="serviceTaxno"
									cssClass="CompanyFormTextfield"
									name="lValidateDetails.serviceTaxno" theme="simple" /></td>
						</tr>
						<tr>
							<td colspan=2>
								<hr width="114%" />
							</td>
						</tr>
						<tr>
							<td colspan=2><b> Bank Details</b></td>
						</tr>

						<tr>
							<td>Ac No:</td>
							<td><s:textfield id="acno" cssClass="CompanyFormTextfield"
									name="lValidateDetails.acno" theme="simple" readonly="true" /></td>
						</tr>

						<tr>
							<td>Bank Details:</td>
							<td><s:textarea id="BankDetails"
									cssClass="CompanyFormTextArea"
									name="lValidateDetails.BankDetails" cols="56" rows="2"
									theme="simple" readonly="true" /></td>
						</tr>

						<tr>
							<td colspan=2>
								<hr width="114%" />
							</td>
						</tr>
						<tr>
							<td colspan=2><b>Create Account</b></td>
						</tr>

						<tr>
							<td>Login :<span style="color: #f00; font-size: 20px;">*</span></td>
							<td><s:textfield id="userName"
									cssClass="CompanyFormTextfield"
									name="lValidateDetails.userName" theme="simple" /></td>
						</tr>

						<tr>
							<td>Password :<span style="color: #f00; font-size: 20px;">*</span></td>
							<td><s:password id="passwords"
									cssClass="CompanyFormTextfield"
									name="lValidateDetails.password" theme="simple" /></td>
						</tr>
						<tr>
							<td colspan=2>
								<hr width="114%" />
							</td>
						</tr>

					</table>
				</s:form>
			</div>
			<div style="margin: 0 0 0 330px;">
				<button class="submitbutton" onclick="return validateContent();">Submit</button>
			</div>
		</div>


	</div>
	<div id="schDIV" class="white_content_login">
		<a href="#"
			onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>

		<div id="lDetailsDiv"></div>
	</div>
	<!-- fullCalendar -->
	<script
		src="<%=request.getContextPath()%>/js/plugins/fullcalendar/fullcalendar.min.js"
		type="text/javascript"></script>


	<!-- Page script -->
	<script type="text/javascript">
		//########################################### Calender ######################################################

		$(function() {

			/* initialize the external events
			 -----------------------------------------------------------------*/
			function ini_events(ele) {
				ele.each(function() {

					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
					// use the element's text as the event title
					};

					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject);

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex : 1070,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					});

				});
			}
			ini_events($('#external-events div.external-event'));

			/* initialize the calendar
			 -----------------------------------------------------------------*/
			//Date for the calendar events (dummy data)
			var date = new Date();
			var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();
			$('#calendar').fullCalendar(
					{
						header : {
							left : 'prev,next today',
							center : 'title',
							right : 'month,agendaWeek,agendaDay'
						},
						buttonText : {//This is to add icons to the visible buttons
							prev : "<span class='fa fa-caret-left'></span>",
							next : "<span class='fa fa-caret-right'></span>",
							today : 'today',
							month : 'month',
							week : 'week',
							day : 'day'
						},
						//Random default events
						/*  events: [
						     {
						         title: 'All Day Event',
						         start: new Date(y, m, 1),
						         backgroundColor: "#f56954", //red 
						         borderColor: "#f56954" //red
						     },
						     {
						         title: 'Long Event',
						         start: new Date(y, m, d - 5),
						         end: new Date(y, m, d - 2),
						         backgroundColor: "#f39c12", //yellow
						         borderColor: "#f39c12" //yellow
						     },
						     {
						         title: 'Meeting',
						         start: new Date(y, m, d, 10, 30),
						         allDay: false,
						         backgroundColor: "#0073b7", //Blue
						         borderColor: "#0073b7" //Blue
						     },
						     {
						         title: 'Lunch',
						         start: new Date(y, m, d, 12, 0),
						         end: new Date(y, m, d, 14, 0),
						         allDay: false,
						         backgroundColor: "#00c0ef", //Info (aqua)
						         borderColor: "#00c0ef" //Info (aqua)
						     },
						     {
						         title: 'Birthday Party',
						         start: new Date(y, m, d + 1, 19, 0),
						         end: new Date(y, m, d + 1, 22, 30),
						         allDay: false,
						         backgroundColor: "#00a65a", //Success (green)
						         borderColor: "#00a65a" //Success (green)
						     },
						     {
						         title: 'Click for Google',
						         start: new Date(y, m, 28),
						         end: new Date(y, m, 29),
						         url: 'http://google.com/',
						         backgroundColor: "#3c8dbc", //Primary (light-blue)
						         borderColor: "#3c8dbc" //Primary (light-blue)
						     }
						 ], */
						editable : true,
						droppable : true, // this allows things to be dropped onto the calendar !!!
						drop : function(date, allDay) { // this function is called when something is dropped

							// retrieve the dropped element's stored Event Object
							var originalEventObject = $(this).data(
									'eventObject');

							// we need to copy it, so that multiple events don't have a reference to the same object
							var copiedEventObject = $.extend({},
									originalEventObject);

							// assign it the date that was reported
							copiedEventObject.start = date;
							copiedEventObject.allDay = allDay;
							copiedEventObject.backgroundColor = $(this).css(
									"background-color");
							copiedEventObject.borderColor = $(this).css(
									"border-color");

							// render the event on the calendar
							// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
							$('#calendar').fullCalendar('renderEvent',
									copiedEventObject, true);

							// is the "remove after drop" checkbox checked?
							if ($('#drop-remove').is(':checked')) {
								// if so, remove the element from the "Draggable Events" list
								$(this).remove();
							}

						}
					});

			/* ADDING EVENTS */
			var currColor = "#f56954"; //Red by default
			//Color chooser button
			var colorChooser = $("#color-chooser-btn");
			$("#color-chooser > li > a").click(function(e) {
				e.preventDefault();
				//Save color
				currColor = $(this).css("color");
				//Add color effect to button
				colorChooser.css({
					"background-color" : currColor,
					"border-color" : currColor
				}).html($(this).text() + ' <span class="caret"></span>');
			});
			$("#add-new-event").click(function(e) {
				e.preventDefault();
				//Get value and make sure it is not null
				var val = $("#new-event").val();
				if (val.length == 0) {
					return;
				}

				//Create event
				var event = $("<div />");
				event.css({
					"background-color" : currColor,
					"border-color" : currColor,
					"color" : "#fff"
				}).addClass("external-event");
				event.html(val);
				$('#external-events').prepend(event);

				//Add draggable funtionality
				ini_events(event);

				//Remove event from text input
				$("#new-event").val("");
			});
		});
		//##################################################### calender ###########################################################################
	</script>

</body>
</html>