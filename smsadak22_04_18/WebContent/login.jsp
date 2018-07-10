<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.LoginUserCompanyMasterDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta charset="utf-8">
<title>SMSPRO</title>
<link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/login.css" />
<script src="<%=request.getContextPath() %>/js/jquery-1.11.2.min.js"></script>
<link href="css/modalPopLite.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/modalPopLite.min.js"></script>
<script type="text/javascript" src="js/ajaxpagefetcher.js"></script>
<script type="text/javascript">
	$(function() {
		$('#popup-wrapper').modalPopLite({
			openButton : '#companyRegisterText',
			closeButton : '#close-btn'
		});
	});

	function checkFinancialYear()
	{
		var d = new Date();
		var n = d.getFullYear(); 
		var startdate=n;
		var todate=parseInt(startdate+1);
		var financialrage=startdate+"-"+todate;
		document.getElementById("financialyear").value=financialrage;
	}
	
	
	function validateContent() {

		var nameofcompany = $('#nameofcompany').val();
		var phoneno = $('#phoneno').val();
		var contactperson = $('#contactperson').val();
		var Email = $('#Email').val();
		var address = $('#address').val();
		var userName = $('#userName').val();
		var password = $('#passwords').val();
		var img = $('#upload-File').val();
		if (nameofcompany == "") {
			document.getElementById("validation").innerHTML="<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Enter a Suitable Company Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if (phoneno == "") {
			document.getElementById("validation").innerHTML="<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Phone number required! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if (contactperson == "") {
			document.getElementById("validation").innerHTML="<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Contact person name required! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		}

		else if (Email == "") {
			document.getElementById("validation").innerHTML="<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Valid Email required! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		}

		else if (address == "") {
			document.getElementById("validation").innerHTML="<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Full and correct address required! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		}

		else if (userName == "") {
			document.getElementById("validation").innerHTML="<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Valid Login Name Required! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		}

		else if (password == "") {
			document.getElementById("validation").innerHTML="<p style='color:red;margin:0px 0px 0px 0px; font-size: 15px;font-weight: bold;'>Password Required!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		}

		else {
			document.getElementById("CompanyForm1").submit();
		}
	}
	
	function getYearRangeOfStock() {
		var companyId = $('#companyId').val();
		if (companyId != 0) {
			var page= "getYearRangeOfStock.action?companyId="+companyId;
			ajaxpagefetcher.load("yearRangeDiv", page, true);
		} else {
			document.getElementById("yearRangeDiv").innerHTML="";
		} 
	}

	function setRange(){
		var yearRangeId = $('#yearRangeId').val();
		document.getElementById("fYearRange").value=yearRangeId;
	}
	
	function validateLogin(context) {
		var companyId = $('#companyId').val();
		var fYearRange = $('#yearRangeId').val();
		var username = $('#username').val();
		var password = $('#password').val();
		if (companyId == 0) {
			document.getElementById("logVal").innerHTML="<p style='color:red;margin:0px 0px 0px 20px; font-size: 15px;font-weight: bold;'>Select a Suitable Company Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if (fYearRange == 0) {
			document.getElementById("logVal").innerHTML="<p style='color:red;margin:0px 0px 0px 20px; font-size: 15px;font-weight: bold;'>Select Financial Year! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if (username == "") {
			document.getElementById("logVal").innerHTML="<p style='color:red;margin:0px 0px 0px 20px; font-size: 15px;font-weight: bold;'>Enter User Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if (password == "") {
			document.getElementById("logVal").innerHTML="<p style='color:red;margin:0px 0px 0px 20px; font-size: 15px;font-weight: bold;'>Enter Password! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		}else{
			document.getElementById("logForm").submit();
		}
	}

</script>
</head>
<body onload="checkFinancialYear()">
	<div class="container">
		<section id="content">
							<a href="https://www.facebook.com/PR-Inventory-Solutions-307862899674653/" target="_blank"><img src="img/ssmslogologine.png" height= 122px width=148px; /></a>
		<s:form action="submitloginDetails.action"  method="post" id="logForm">
		
			<div style="margin:-14px 31px -9px 35px; ">

			
			
			<br/><h1>Adak Shoe & Chappals</h1><br/>
			<b style="color:red">Now GST Ready !!</b>
			<br/></div>
			<div id="logVal"></div>
			<br/>
			<div>
			<s:select theme="simple" cssStyle="cursor:pointor;" onchange="setRange()"
	headerKey="0" headerValue="-Financial Year-" list="YearRange" 
	listKey="fYear" listValue="fYear" id="yearRangeId" name="fYearDto.fYear" />
				
				<input type="hidden" name="companyId" id="companyId" value="1">
			</div>
			<div id="yearRangeDiv"> </div>
			<br>
			<div>
				<input type="text" name="usernames" placeholder="Username"
					id="username" />
			</div>
			<div>
				<input type="password" name="password" placeholder="Password"
					 id="password" />
			</div>
			
			<div>
				<input type="button" value="Log in" onclick="validateLogin('<%=request.getContextPath()%>')"/>

				<%-- <div id="companyRegisterText">
					<a href="#"
						onclick="document.getElementById('companyDiv').style.display='block'; document.getElementById('fade1').style.display='block'">Company
						Register</a>
				</div>--%>.
				

			</div>

			<div>
			
				<s:if test="%{#request.loginStatus=='logout'}">
					<label id="loggedoutText">Logged out Successfully !!</label>
				</s:if>

				<s:elseif test="%{#request.loginStatus=='invalidLogin'}">
					<label id="invalidLogin">Invalid Login retry!!</label>
				</s:elseif>
				<s:elseif test="%{#request.loginStatus=='sessionExpired'}">
					<label id="invalidLogin">Session Expired.Please login
						again!!</label>
				</s:elseif>

				<s:elseif test="%{#request.loginStatus=='companycreated'}">
					<label id="loggedoutText">Company created successfully!!</label>
				</s:elseif>

			</div>
		</s:form>
		
	</div>
	<div id="companyDiv" class="white_content_company">
		<a href="javascript:void(0) "
			onclick="document.getElementById('companyDiv').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>
		
		<div id="companyFormHeading1" style="margin: 0 0 0 310px; "><p><b>Create Company Form</b></p></div>
		<div id="validation"></div>
		<div style="height: 400px; overflow-y:scroll;">
			<s:form action="companyDetailsSave.action" id="CompanyForm1"
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
						<td>Name of Company :<span style="color:#f00; font-size:20px;">*</span></td>
						<td><s:textfield id="nameofcompany"
								cssClass="CompanyFormTextfield" name="loginobj.nameofcompany"
								theme="simple" /></td>
					</tr>

					<tr>
						<td>Phone no :<span style="color:#f00; font-size:20px;">*</span></td>
						<td><s:textfield id="phoneno" cssClass="CompanyFormTextfield"
								name="loginobj.phoneno" theme="simple" /></td>
					</tr>

					<tr>
						<td>Contact person :<span style="color:#f00; font-size:20px;">*</span></td>
						<td><s:textfield id="contactperson"
								cssClass="CompanyFormTextfield" name="loginobj.contactperson"
								theme="simple" /></td>
					</tr>

					<tr>
						<td>Email :<span style="color:#f00; font-size:20px;">*</span></td>
						<td><s:textfield id="Email" cssClass="CompanyFormTextfield"
								name="loginobj.Email" theme="simple" /></td>
					</tr>

					<tr>
						<td>Address :<span style="color:#f00; font-size:20px;">*</span></td>
						<td><s:textarea id="address" cssClass="CompanyFormTextArea"
								name="loginobj.address" cols="56" rows="2" theme="simple" /></td>
					</tr>

					<tr>
						<td>VAT No:</td>
						<td><div>
								<s:textfield id="vatno" cssClass="CompanyFormTextfield"
									name="loginobj.vatno" theme="simple" />
							</div></td>
					</tr>

					<tr>
						<td>PAN No:</td>
						<td><s:textfield id="panno" cssClass="CompanyFormTextfield"
								name="loginobj.panno" theme="simple" /></td>
					</tr>

					<tr>
						<td>Service Tax No:</td>
						<td><s:textfield id="serviceTaxno"
								cssClass="CompanyFormTextfield" name="loginobj.serviceTaxno"
								theme="simple" /></td>
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
								name="loginobj.acno" theme="simple" /></td>
					</tr>

					<tr>
						<td>Bank Details:</td>
						<td><s:textarea id="BankDetails"
								cssClass="CompanyFormTextArea" name="loginobj.BankDetails"
								theme="simple" /></td>
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
						<td>Login :<span style="color:#f00; font-size:20px;">*</span></td>
						<td><s:textfield id="userName" cssClass="CompanyFormTextfield" name="loginobj.userName" theme="simple" /></td>
					</tr>

					<tr>
						<td>Password :<span style="color:#f00; font-size:20px;">*</span></td>
						<td><s:password id="passwords" cssClass="CompanyFormTextfield" name="loginobj.password" theme="simple" /></td>
					</tr>
					<tr>
						<td colspan=2>
							<hr width="114%" />
						</td>
					</tr>
					<tr>
						<td>Company Image/Logo :</td>
						<td>
							<s:file name="loginobj.userPhoto" id="upload-File"  onchange="showimagepreview(this);" label="Image" theme="simple" />  
							<img id="img_prev" width="100" height="100" src="img/blankImage.jpg" />
						</td>
					</tr>
				</table>
			</s:form>
			</div>
			<div style="margin: 0 0 0 330px; ">
				<button  class="submitbutton" onclick="return validateContent();">Submit</button>
			</div>
	</div>
	<div id="fade1" class="black_overlay"></div>
	<!-- container -->
</body>
</html>