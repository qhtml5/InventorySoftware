/*//######################## Payment Bill Print #####################################################
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
*/
function getSupplierPayBill(supplierId) {
	if(supplierId !=0){
		document.getElementById("supplierPayDet").innerHTML="<label style='font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px'>Select Any Customer And Then Bill No to Display Data !! </label>";
		document.getElementById("supplierPayBill").innerHTML="";
		$('#sDoc').val("");
		var page="supplierPaymentBilNo.action?supplierId="+supplierId;
		ajaxpagefetcher.load("supplierPayBill",page,true);
	}else{
		document.getElementById("supplierPayDet").innerHTML="<label style='font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px'>Select Any Customer And Then Bill No to Display Data !! </label>";
		document.getElementById("supplierPayBill").innerHTML="";
		$('#sDoc').val("");
		document.getElementById("validation").innerHTML="";
		document.getElementById("validation1").innerHTML="";
		
	}
}

function getSupPayHistory(billNo) {
	var supplierId=$('#supplierId').val();
	
	if(billNo !=0 && supplierId!=0){
		var page="supplierPaymentDetailsByBilNo.action?billNo="+billNo+"&supplierId="+supplierId;
		ajaxpagefetcher.load("supplierPayDet",page,true);
	}else{
		document.getElementById("supplierPayDet").innerHTML="<label style='font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px'>Select Any Customer And Then Bill No to Display Data !! </label>";
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

function chequeDiv1() {
	document.getElementById("panelPay3").style.display = 'block';
	document.getElementById("panelPay2").style.display = 'none';
}

function cashDiv1() {
	document.getElementById("panelPay3").style.display = 'none';
	document.getElementById("panelPay2").style.display = 'block';
}

function amtValidation1() {
	var paidAmt = $('#sPaidAmt').val();
	if(paidAmt!=0 || paidAmt!=""){
		document.getElementById("flipPay3").disabled = true;
		$('#chqNo').val("NA");
		$('#chqDoc').val("NA");
		$('#chqBnk').val("NA");
		$('#chechPaidAmt').val("");
	}else{
		
		document.getElementById("flipPay3").disabled = false;
		$('#chqNo').val("");
		$('#chqDoc').val("");
		$('#chqBnk').val("");
	}
}

function chqValidation1() {
	var chqNo = $('#chqNo').val();
	//var chqDoc = $('#chqDoc').val();
	var chqBnk = $('#chqBnk').val();
	var chqAmt = $('#chechPaidAmt').val();
	if((chqNo=="" && chqBnk=="" && chqAmt =="")){
		document.getElementById("flipPay2").disabled = false;
		$('#sPaidAmt').val("");
	} else{
		document.getElementById("flipPay2").disabled = true;
		$('#sPaidAmt').val("");
	}
}

function validateSupplierPay() {
	var salesDate = $('#sDoc').val();
	//var bill = $('#billno').val();
	var paidAmt = $('#sPaidAmt').val();
	var chqAmt = $('#chechPaidAmt').val();
	var chqNo = $('#chqNo').val();
	
	var chqBnk = $('#chqBnk').val();
	
	var newDate=document.getElementById("year").value+"-"+document.getElementById("month").value+"-"+document.getElementById("days").value;
	
	document.getElementById("chqDoc").value=newDate;
	
	var chqDoc = $('#chqDoc').val();
	/*alert(chqAmt);
	alert(chqNo);
	alert(chqBnk);
	alert(chqDoc);*/
	if (salesDate == 0 || salesDate == "") {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Payment Date!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Payment Date!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Proceed";
		document.getElementById("sub").disabled = false;
		return false;
	} else if ((paidAmt == "" && chqNo == "" && chqDoc == "--" && chqBnk == "" && chqAmt== "")) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Payment Details!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Payment Details!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Proceed";
		document.getElementById("sub").disabled = false;
		return false;
	} else if ((paidAmt == 0 && chqAmt == 0) || (paidAmt == 0 && chqAmt == "") || (paidAmt == "" && chqAmt == 0) || (paidAmt == "" && chqAmt == "")) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Cheque Amount !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Cheque Amount !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Proceed";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(chqAmt)) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Valid Cheque Amount !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Valid Cheque Amount !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Proceed";
		document.getElementById("sub").disabled = false;
		return false;
	}  else if ((paidAmt == 0 && chqNo == 0)||(paidAmt == "" && chqNo == 0)||(paidAmt == 0 && chqNo == "")||(paidAmt == "" && chqNo == "")) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Cheque No. !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Cheque No. !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Proceed";
		document.getElementById("sub").disabled = false;
		return false;
	} else if ((paidAmt == 0 && chqDoc == "--") || (paidAmt == "" && chqDoc == "--")) {
		
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

function storeSupvalue(dueValue) {
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

function calSupPayAmt(newAmt,dueAmt) {
	
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
				payArray.push(document.getElementsByName("sPaidAmt[]")[a].value);
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

/*function validateSupPay() {
	
	document.getElementById("validation").innerHTML="";
	var listSize=$('#list').val();
	var sDoc=$('#sDoc').val();
	var payArray= new Array();
	var paymentAmount=$('#paymentAmount').val();
	var paymentAmount1=$('#paymentAmount1').val();
	var totDevidedAmt=0;
	
	for(var a=0;a<listSize-1;a++)
    {
		payArray.push(document.getElementsByName("sPaidAmt[]")[a].value);
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
}*/


function checkCode()
{
alert("called")	;
}

function calculatePaymentType(k)
{

 var paymentType=document.getElementById("paymentType"+k).value;
 
 if(paymentType=="cash")
	 {
	 
	 document.getElementById("chequeNo"+k).readOnly = true; 
	 document.getElementById("bankname"+k).readOnly = true; 
	 document.getElementById("chequeNo"+k).value="NA";
	 document.getElementById("bankname"+k).value="NA";
	 
	 }
 else if(paymentType=="cheque")
	 {
	
	 document.getElementById("chequeNo"+k).readOnly = false; 
	 document.getElementById("bankname"+k).readOnly = false; 
	 document.getElementById("chequeNo"+k).value="";
	 document.getElementById("bankname"+k).value="";
	 }
 else
	 {
	 document.getElementById("chequeNo"+k).value="NA";
	 document.getElementById("bankname"+k).value="NA";
	 
	 }


}

