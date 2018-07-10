//######################## Payment Bill Print #####################################################
function duePrintF() {
	window.print();
}


function printDuePay(windowWidth, windowHeight, windowOuterHeight, url, wname,features, cId)
{
	var centerLeft = parseInt((window.screen.availWidth - windowWidth) / 2);
	var centerTop = parseInt(((window.screen.availHeight - windowHeight) / 2)
			- windowOuterHeight);

	var misc_features;
	if (features) {
		misc_features = ', ' + features+', status=no, location=no, scrollbars=yes, resizable=yes';
	} else {
		misc_features = ', status=no, location=no, scrollbars=yes, resizable=yes';
	}
	var newUrl;
	if(cId=="NA"){
		newUrl = url;
	}else{
		newUrl = url + "?customerId=" + cId;
	}

	var windowFeatures = 'width=' + windowWidth + ',height=' + windowHeight
			+ ',left=' + centerLeft + ',top=' + centerTop + misc_features;
	var win = window.open(newUrl, wname, windowFeatures);
	win.focus();
	return win;
}

//######################## Payment Bill Print #####################################################

function getCustomerPayBill(customerId) {
	if(customerId !=0){
		
		
		document.getElementById("customerPayDet").innerHTML="<label style='font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px'>Select Any Customer And Then Bill No to Display Data !! </label>";
		document.getElementById("customerPayBill").innerHTML="";
		$('#sDoc').val("");
		var page="customerPaymentBilNo.action?customerId="+customerId;
		ajaxpagefetcher.load("customerPayDet",page,true);
	}else{
		document.getElementById("customerPayDet").innerHTML="<label style='font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px'>Select Any Customer And Then Bill No to Display Data !! </label>";
		document.getElementById("customerPayBill").innerHTML="";
		$('#sDoc').val("");
		document.getElementById("validation").innerHTML="";
		document.getElementById("validation1").innerHTML="";
		
	}
}

function getPayHistory(billNo) {
	if(billNo !=0){
		var page="customerPaymentDetailsByBilNo.action?billNo="+billNo;
		ajaxpagefetcher.load("customerPayDet",page,true);
	}else{
		document.getElementById("customerPayDet").innerHTML="<label style='font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px'>Select Any Invoice Number or Customer to Display Data !! </label>";
		//$('#sDoc').val("");
		document.getElementById("validation").innerHTML="";
		document.getElementById("validation1").innerHTML="";
		
	}
}

function getDueDetails(cusId) {
	if(cusId !=0)
	{
		var page="customerPayDueStatus.action?customerId="+cusId;
		ajaxpagefetcher.load("customerDueDet",page,true);
	}else{
		document.getElementById("customerDueDet").innerHTML="<label style='font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px'>Select Any Customer to Display Data !! </label>";
	}
}

/*function getPayDetailsofCustomer(cusId) {
	if(cusId !=0)
	{
		document.getElementById("billno").value=0;
		var page="customerPayStatus.action?customerId="+cusId;
		ajaxpagefetcher.load("customerPayDet",page,true);
	}else{
		document.getElementById("customerPayDet").innerHTML="<label style='font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px'>Select Any Invoice Number or Customer to Display Data !! </label>";
	}
}*/

function chequeDiv() {
	document.getElementById("panelPay1").style.display = 'block';
	document.getElementById("panelPay").style.display = 'none';
}

function cashDiv() {
	document.getElementById("panelPay1").style.display = 'none';
	document.getElementById("panelPay").style.display = 'block';
}

function amtValidation() {
	var paidAmt = $('#paidAmt').val();
	if(paidAmt!=0){
		document.getElementById("flipPay1").disabled = true;
		$('#chqNo').val("NA");
		$('#chqDoc').val("NA");
		$('#chqBnk').val("NA");
		$('#cpaidAmt').val("");
	}else{
		document.getElementById("flipPay1").disabled = false;
		$('#chqNo').val("");
		$('#chqDoc').val("");
		$('#chqBnk').val("");
		$('#paidAmt').val("0.0");
	}
}

function chqValidation() {
	var chqNo = $('#chqNo').val();
	var chqDoc = $('#chqDoc').val();
	var chqBnk = $('#chqBnk').val();

	if((chqNo=="" && chqDoc=="" && chqBnk=="")){
		document.getElementById("flipPay").disabled = false;
		$('#paidAmt').val("");
	} else{
		document.getElementById("flipPay").disabled = true;
		$('#paidAmt').val("");
	}
}

function validateCustomerPay() {
	var salesDate = $('#sDoc').val();
	var bill = $('#billno').val();
	var paidAmt = $('#paidAmt').val();
	var chqNo = $('#chqNo').val();
	
	var chqBnk = $('#chqBnk').val();
	
	var newDate=document.getElementById("year").value+"-"+document.getElementById("month").value+"-"+document.getElementById("days").value;
	
	document.getElementById("chqDoc").value=newDate;
	
	var chqDoc = $('#chqDoc').val();
	
	if (salesDate == 0 || salesDate == "") {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Payment Date!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Payment Date!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Proceed";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (bill == 0 || bill == "") {
			
			document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Bill no!!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
			document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Bill no!!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
			document.getElementById("sub").value="Proceed";
			document.getElementById("sub").disabled = false;
			return false;
	} else if ((paidAmt == 0 && chqNo == 0 && chqDoc == 0 && chqBnk == 0) || (paidAmt == "" && chqNo == "" && chqDoc == "" && chqBnk == "")) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Payment Details!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Payment Details!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Proceed";
		document.getElementById("sub").disabled = false;
		return false;
	} else if ((paidAmt == 0 && chqNo == 0)||(paidAmt == "" && chqNo == 0)||(paidAmt == 0 && chqNo == "")||(paidAmt == "" && chqNo == "")) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Cheque No. !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Cheque No. !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Proceed";
		document.getElementById("sub").disabled = false;
		return false;
	} else if ((paidAmt == 0 && chqDoc == 0) || (paidAmt == 0 && chqDoc == "") || (paidAmt == "" && chqDoc == 0) || (paidAmt == "" && chqDoc == "")) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Cheque Date !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Cheque Date !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Proceed";
		document.getElementById("sub").disabled = false;
		return false;
	} else if ((paidAmt == 0 && chqBnk == 0) || (paidAmt == 0 && chqBnk == "") || (paidAmt == "" && chqBnk == 0) || (paidAmt == "" && chqBnk == "")) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Bank Details! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Bank Details! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Proceed";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(paidAmt)) {
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Payable Amount Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Payable Amount Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Proceed";
		document.getElementById("sub").disabled = false;
		return false;
	}
}


function excelWholeCustomerDue() {
	
	var g="excelWholeCustomerDue.action";
	document.getElementById("exlCusDue").action = g;
	document.getElementById("exlCusDue").submit();
}

function storevalue(dueValue) {
	var paymentAmount=$('#paymentAmount').val();
	var pm=parseFloat(paymentAmount);
	var dm=parseFloat(dueValue);
	if(pm>dm){
		$('#paymentAmount').val("0");
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Total Payment Amount Exceeds Total Due Amount. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
	} else{
		$('#paymentAmount1').val(paymentAmount);
	}
}

function calPayAmt(newAmt,dueAmt) {
	
	document.getElementById("validation").innerHTML="";
	var paymentAmount=$('#paymentAmount').val();
	var pm=parseFloat(paymentAmount);
	var listSize=$('#list').val();
	var payArray= new Array();
	var totDevidedAmt=0;
	var nm=0;
	var dm=0;
	if(pm == 0 || paymentAmount == ""){
		newAmt.value=0;
		$('#paymentAmount').focus();
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Total Payment Amount. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
	} else {
			nm=parseFloat(newAmt.value);
			 dm=parseFloat(dueAmt.value);
			
		if(nm>dm){
			newAmt.value=0;
			newAmt.focus();
			document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Amount exceeds Due Amount. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		} else {
			for(var a=0;a<listSize-1;a++)
		    {
				payArray.push(document.getElementsByName("cPaidAmt[]")[a].value);
		    }
			for(var i=0;i<payArray.length;i++)
			{
				if(payArray[i]>0 && payArray[i]!=""){
					totDevidedAmt= parseFloat(totDevidedAmt)+parseFloat(payArray[i]);
				}
			}
			var newPayAMt=parseFloat(paymentAmount)-parseFloat(totDevidedAmt);
			if(newPayAMt>0 || newPayAMt == 0){
				$('#paymentAmount1').val(newPayAMt);
			} else if(newPayAMt<0){
				newAmt.value=0;
				document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Amount total exceeds Total Payment Amount. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
			}
		}
	}
}

function validateCusPay() {
	document.getElementById("validation").innerHTML="";
	var listSize=$('#list').val();
	var sDoc=$('#sDoc').val();
	var payArray= new Array();
	var paymentAmount=$('#paymentAmount').val();
	var paymentAmount1=$('#paymentAmount1').val();
	var totDevidedAmt=0;
	
	for(var a=0;a<listSize-1;a++)
    {
		payArray.push(document.getElementsByName("cPaidAmt[]")[a].value);
    }
	for(var i=0;i<payArray.length;i++)
	{
		if(payArray[i]>0 && payArray[i]!=""){
			totDevidedAmt= parseFloat(totDevidedAmt)+parseFloat(payArray[i]);
		}
	}
	if(sDoc == ""){
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Payment Date. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		return false;
	} else if(paymentAmount ==0 || paymentAmount ==""){
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Total Payment Amount. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		return false;
	} else if(totDevidedAmt == 0){
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Provide Billwise Amount. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		return false;
	} else if(paymentAmount1 != 0){
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Remaining Rs. "+paymentAmount1+" for any Bill No. and Proceed. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		return false;
	}
	return true;
}

function rtCustomerList(customername)
{


var page ="retreiveCustomerList.action?customername="+customername;
ajaxpagefetcher.load("customerList", page, true);
}