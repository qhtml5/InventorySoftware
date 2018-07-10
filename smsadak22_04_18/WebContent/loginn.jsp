<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.LoginUserCompanyMasterDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<head>
  <meta charset="UTF-8">
  <title>Material Design Login Form</title>
  
  
  
      <link rel="stylesheet" href="nlogin/css/style.css">

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

<body>
  <hgroup>
  <h1>Adak Shoe and Chappals</h1>
 
</hgroup>
<s:form action="submitloginDetails.action"  method="post" id="logForm">
    <div class="group">
    <select  class="group" id="companyId" name="companyId" onchange="getYearRangeOfStock()" style="margin:-9px 33px 16px 23px">
					<option value="0">--Select Company--</option>
					<s:iterator value="companyList">
						<option value="<s:property value="companyId"/>">
							<s:property value="nameofcompany"/>
						</option>
					</s:iterator>
				</select>

  </div>
<div  class="group" id="yearRangeDiv"></div>

 			<div class="group" >
				<input type="text" name="usernames" placeholder="Username"
					id="username" />
			</div>
			<div class="group" >
				<input type="password" name="password" placeholder="Password"
					 id="password" />
			</div>
<input type="button" value="Log in" onclick="validateLogin('<%=request.getContextPath()%>')"/>
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
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="nlogin/js/index.js"></script>

</body>
</html>