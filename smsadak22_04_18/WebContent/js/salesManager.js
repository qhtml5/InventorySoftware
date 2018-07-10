//######################################################### Credit Note Calculation ####################################################################

function searchCustBarcode(barcodename)
{
//	var page ="searchCustBarcode.action?customerBarcode="+barcodename;
	var page ="searchCustBarcode.action?customerBarcode="+barcodename;
	ajaxpagefetcher.load("cust", page, true);
	document.getElementById("productCode").value="";
	document.getElementById("pc").innerHTML="";	
}


function searchbyProductcode(productCode)
{

//	var page ="searchCustBarcode.action?customerBarcode="+barcodename;
	var page ="searchProductCode.action?productCode="+productCode;
	ajaxpagefetcher.load("pc", page, true);
	document.getElementById("searchBarcode").value="";
	document.getElementById("cust").innerHTML="";
}


function searchCustDetailsByProductcode(productCode)
{

//	var page ="searchCustBarcode.action?customerBarcode="+barcodename;
	var page ="searchCustDetailstByProductCode.action?productCode="+productCode;
	ajaxpagefetcher.load("cust", page, true);
}


function selectSalesDetailsbyCustId(customerid)
{
	var page ="callSaleBillDetailsByCustID.action?custID="+customerid;
	ajaxpagefetcher.load("billnoDiv", page, true);
}


function selectSalesDetails() {
	
	var customerId=$('#customerBarcode').val();
	document.getElementById("saleDetCre").innerHTML = "<br/><br /><label	style='font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px'>Select any invoice number to display data !! </label>";
	if(customerId!=0){
		var page ="callSaleBillDetails.action?customerBarcode="+customerId;
		ajaxpagefetcher.load("billnoDiv", page, true);
	}else{
		document.getElementById("saleDetCre").innerHTML = "<br/><br /><label	style='font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px'>Select any invoice number to display data !! </label>";
		document.getElementById("billno").value=0;
	}
}

function selectSalesByBillBo(f) {
	var billNo=f.value;
	var page ="selectSalesDetails.action?billNo="+billNo;
	ajaxpagefetcher.load("customerSalesDetails", page, true);
}

function calculateCreditNoteVal(rqty,saleRt,itemtot,incVal){
	    var listsize=0;
	    var crSubTot=0;
	    var crGrandTot=0;
	    document.getElementById("crSubTot").value="0";
	    document.getElementById("crGTot").value="0";
	    if(rqty.value=="")
		{
	    rqty.value="0";
		}
	    var netRTotal = parseFloat(saleRt.value) * parseFloat(rqty.value);
	    itemtot.value = netRTotal;
	    listsize = parseInt(document.getElementById("crSize").value);
	    crSubTot=document.getElementById("crSubTot").value;
	    for(var h=0;h<listsize;h++)
		{
	    crSubTot=parseFloat(document.getElementsByName("critemtot[]")[h].value)+parseFloat(crSubTot);
	    document.getElementById("crSubTot").value=crSubTot;
	    crGrandTot=crSubTot * (parseFloat(document.getElementById("crVat").value)/100);
	    crGrandTot=crGrandTot+crSubTot;
	    document.getElementById("crGTot").value=crGrandTot;
		}
	
}
// Modify this portion for credit note calculation
/*function exceedQtyChk(updateItemTot,rqty,uQty,rit) {
	
	var chkval=0;
	if(rqty.value==""){
		rqty.value=0;
	}
	if(updateItemTot.value<0){
			document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Item Quantity Exceeds Stock! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			//rqty.value=0;
			
			x=document.getElementById("returnSubTotal").value;
			rit1=rit.value;
			rit.value=0;
			newSubTot=parseFloat(x)-parseFloat(rit1);
			document.getElementById("returnSubTotal").value=newSubTot;

			returnGrandTot=newSubTot+(newSubTot*parseFloat(document.getElementById("vat").value)/100);
			document.getElementById("stockGrandTotal").value=returnGrandTot;
			
			rqty.value=0;
			updateItemTot.value=0;
			uQty.value=0;
			
	}
	return false;
}



function calculateGrandTotForDebitNote() {
	var stockSubTotal=parseFloat(document.getElementById("upstockSubTotal").value);
	var lessUnit=parseFloat(document.getElementById("lessUnit").value);
	var discounts=parseFloat(document.getElementById("discounts").value);
	var vat=parseFloat(document.getElementById("vat").value);
	var lFreight=parseFloat(document.getElementById("lFreight").value);
	var vatAmount=vat/100;
	var value1=(stockSubTotal-(lessUnit+discounts));
	var value2=value1+(value1*vatAmount);
	var gTot=value2-lFreight;
	document.getElementById("stockGrandTotal").value=gTot;
}*/

function getCustomerSaleDet() {
	
	var cBCode=$('#customerBarcode').val();
	
	var billno=$('#billno').val();
	if(billno!=0){
		var page ="customerSaleDet.action?customerBarcode="+cBCode+"&billno="+billno;
		ajaxpagefetcher.load("saleDetCre", page, true);
	}
}

 function getCustomerSaleDet2(billno)
{
	
	var cBCode=$('#customerBarcode').val();
	
	if(billno!=0){
		
		document.getElementById("saleDetCre").style.display="block"	;
		var page ="customerSaleDet.action?customerBarcode="+cBCode+"&billno="+billno;
		ajaxpagefetcher.load("saleDetCre", page, true);
	}	
   
	if(billno=="")
		{
		
		setInterval(blankclr(billno), 1000);
		}
}

function blankclr(billno)
{
	if(billno=="")
		{
	document.getElementById("saleDetCre").innerHTML="";	
		}
}





function getCreditNoteList() {
	
	var cBCode=$('#customerBarcode').val();
	if(cBCode!=0){
		var page ="getCnListofCus.action?customerBarcode="+cBCode;
		ajaxpagefetcher.load("cnListDiv", page, true);
	} else {
		document.getElementById("cnListDiv").innerHTML="";
	}
}

function getCNRefundableDetByBillno(billno)
{
	
	var page ="getCNRefundableDetByBillno.action?billno="+billno;
	ajaxpagefetcher.load("dnDetailsDiv", page, true);
	

}

 function getCreditNoteListByCustBarcode(custBarcode)
 {
	    var page ="getCreditNoteListByCustBarcode.action?custBarcode="+custBarcode;
		ajaxpagefetcher.load("cn", page, true);
	 
 }


function validateProReplace() {
	var salesDate1 = $('#salesDate').val();
	var bill1 = $('#saleBill').val();
	var customerBarcode = $('#customerBarcode').val();
	var cnNo = $('#cnNo').val();
	var salesSubTotal1 = $('#salesSubTotal').val();
	var lessUnit1 = $('#saleslessUnit').val();
	var discounts1 = $('#salesDiscounts').val();
	var vat1 = $('#salesVat').val();
	var lFreight1 = $('#salesLFreight').val();
	var salesGrandTotal1 = $('#salesGrandTotal').val();
	//alert(customerBarcode);
	if (salesDate1 == 0 || salesDate1 == "") {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Sales Date!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Sales Date!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (bill1 == 0 || bill1 == "") {
			
			document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Bill no!!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
			document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Bill no!!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
			document.getElementById("sub").value="Add Sale";
			document.getElementById("sub").disabled = false;
			return false;
	} else if (customerBarcode == 0) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Customer Details!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Customer Details!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (cnNo == 0) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Credit Note No !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Credit Note No !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (salesSubTotal1 == 0 || salesSubTotal1 == "") {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Sales Details Required ! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Sales Details Required ! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(vat1)) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Unit Scheme Contains Illegal Characters ! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Unit Scheme Contains Illegal Characters ! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(lessUnit1)) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Unit Scheme Contains Illegal Characters ! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Unit Scheme Contains Illegal Characters ! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (lessUnit1 == "") {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Put 0 or Some Value for Unit Scheme! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Put 0 or Some Value for Unit Scheme! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(discounts1)) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Discounts Contains Illegal Characters!  <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Discounts Contains Illegal Characters!  <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (discounts1 == "") {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Put 0 or Some Value for Discounts! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Put 0 or Some Value for Discounts! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(lFreight1)) {
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Lorry Freight Contains Illegal Characters!  <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Lorry Freight Contains Illegal Characters!  <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (lFreight == "") {
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Put 0 or Some Value for Lorry Freight!  <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Put 0 or Some Value for Lorry Freight!  <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(salesGrandTotal1) || salesGrandTotal1 == 0) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Invalid Entry! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Invalid Entry! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	}
	return true;
}




//######################################################### Credit Note Calculation ####################################################################


//########################################################################## Sales Calculation JS Configuration satart here#############################

function salesListCall(ctxPath) {
	var page = ctxPath + "/salesListCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function getAllDetailsOfSales(billno,doc){

	
	
    var page ="getSalesDetailsbyBillNo.action?billNo="+billno+"&doc="+doc;
	    ajaxpagefetcher.load("slDetailsDiv", page, true);
 }

function checkDupSalesBill(bill) {
	var page ="checkDupSalesBill.action?bill="+bill;
	ajaxpagefetcher.load("addSaleBt", page, true);
}

function printSalesDetails(bill)
{
	var page ="printSalesDetails.action?billNo="+bill;
	ajaxpagefetcher.load("slDetailsDiv2", page, true);
}


function getCustByName(){
	var customerName=document.getElementById("customerName").value;
	var page ="getCustByName.action?customerName="+customerName;
	ajaxpagefetcher.load("custNameDiv", page, true);
}

function searchSalesDetailsByDATEorCus(context, cId,fromdate, todate,checkuncheckstatus) {
	var frYear=fromdate.substring(0, 4);
	var tYear=todate.substring(0, 4);
	var frMn=parseInt(fromdate.substring(5, 7));
	var tMn=parseInt(todate.substring(5, 7));
	var yRange = document.getElementById("fYearS").value;
 	var frYearSess=yRange.substring(0, 4);
 	var toYearSess=yRange.substring(5, 9);
 	var cnstatus=document.getElementById("checkboxuncheck").value;
	
 
 	if (cId==0 && fromdate == "" &&  todate == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Something to Search! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if ((cId==0 && fromdate !="" &&  todate =="") || (cId!=0 && fromdate !="" &&  todate =="")) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select To Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if ((cId==0 &&  todate !="" && fromdate =="") || (cId!=0 &&  todate !="" && fromdate =="")) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Start Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if ((cId==0 && (frYear<frYearSess || frYear>toYearSess) && fromdate != "" &&  todate != "") ||(cId!=0 && (frYear<frYearSess || frYear>toYearSess) && fromdate != "" &&  todate != "")) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Range should be "+yRange+"! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if ((cId==0 && (frYear==frYearSess && frMn<4) && fromdate != "" &&  todate != "") || (cId!=0 && (frYear==frYearSess && frMn<4) && fromdate != "" &&  todate != "")) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Start Month should be April ! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if ((cId==0 && (tYear==toYearSess && tMn>3) && fromdate != "" &&  todate != "") ||(cId!=0 && (tYear==toYearSess && tMn>3) && fromdate != "" &&  todate != "")) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>End Month should be upto March! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	}  else if ((cId==0 &&  (tYear<frYearSess || tYear>toYearSess) && fromdate != "" &&  todate != "") || (cId!=0 &&  (tYear<frYearSess || tYear>toYearSess) && fromdate != "" &&  todate != "")){
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Range should be "+yRange+"! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else {
		document.getElementById("validation").innerHTML = "";
		var page = context + "/searchSalesDetailsByDATEorCus.action?cId="+cId+"&fromdate="+ fromdate + "&todate=" + todate+"&checkuncheckstatus="+cnstatus;
		ajaxpagefetcher.load("salesDetailsDiv", page, true);
	}
}

function saleExport(context,cId)
{
	var fromdate=document.getElementById('startDate').value;
	var todate= document.getElementById('endDate').value;
	var cnstatus=document.getElementById("checkboxuncheck").value;

	var g=context + "/exportingSaleDetails.action?cId="+cId+"&fromdate="+ fromdate + "&todate=" + todate+"&cnstatus="+cnstatus;
	document.getElementById("exportingsaleDetails").action = g;
	document.getElementById("exportingsaleDetails").submit();
	
}




function clearDate() {
	document.getElementById("startDate").value="";
	document.getElementById("endDate").value="";
	document.getElementById("customerId").value="0";
}

function getItemFromStock(ctx) {
	
	var saleArticlesCode=document.getElementById("saleArticlesCode").value;
	document.getElementById('articleNameDiv').innerHTML = "";
	/*if(saleArticlesCode == 0 ||  saleArticlesCode == ""){
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Give Item Code!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Give Item Code!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		return false;
	} else{*/
		var page =ctx+"/getItemFromStock.action?articlesCode="+saleArticlesCode;
		ajaxpagefetcher.load("articleNameDiv", page, true);
	//}
}

function getSalesStockDetails(stockId) {
			var page ="getSalesStockDetails.action?stockId="+stockId;
			ajaxpagefetcher.load("iDet", page, true);
}

function mulSaleqty(a,b,maxQty,sTot,inc)
{
	
	var rateperitem=$("#rateperitem"+inc).val();
	
	/*var rate=0;
	 var _txt1 = document.getElementById(a);
     var _txt2 = document.getElementById(b);
     var _txt4 = document.getElementById("salesTot");

     var stockQuantity=parseInt(maxQty.value);
     var sellQuantity=parseInt(_txt2.value);
     
     if(sellQuantity>stockQuantity)
     {
    	 document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Quantity Exceeds! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
    	 document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Quantity Exceeds! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
    	 _txt2.value=0;
    	  document.getElementById("salesTot").value=0;
    	 _txt2.focus();
     }else{
    	 
    	 var t1=0, t2=0;
         if(_txt1.value != "") t1=_txt1.value;
         if(_txt2.value != "") t2=_txt2.value;
         rate = parseFloat(t1) * parseFloat(t2);
          _txt4.value=parseFloat(rate).toFixed(2);
          document.getElementById("salesTot").disabled=false;
     }*/
	var rate=0;

    var stockQuantity=parseInt(maxQty.value);
    var sellQuantity=parseInt(b.value);
    
    if(sellQuantity>stockQuantity)
    {
   	 document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Quantity Exceeds! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
   	 document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Quantity Exceeds! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
   	 b.value=0;
   	 sTot.value=0;
   	 b.focus();
    }else{
   	 
   	 var t1=0, t2=0,cgstamt=0,cgstrate=0,sgstrate=0,sgstamt=0;
        if(a.value != "") t1=a.value;
        if(b.value != "") t2=b.value;
        rate = parseFloat(t1) * parseFloat(t2);
       
        $("#basetotal"+inc).val(rate);
        
        var discount1=$("#discount1"+inc).val();
        var discount2=$("#discount2"+inc).val();
      
       
        rate=rate-parseFloat(discount1);
       
        $("#discamt"+inc).val(parseFloat(discount1));
        
        var discount2amt=rate * parseFloat(discount2)/100
        $("#discamt"+inc).val(parseFloat(discount2amt));
        rate=rate-parseFloat(discount2amt);
        
       var changetot=rate *parseFloat(rateperitem)/100
       
       
    
       
       $("#rateperitemamt"+inc).val(parseFloat(changetot).toFixed(2));
       gstrate=parseFloat(rateperitem)/2;
       
       cgstrate=gstrate;
       cgstamt=rate*parseFloat(cgstrate)/100
     
       
       $("#cgstrate"+inc).val(cgstrate);
       $("#cgstamt"+inc).val(cgstamt);
       
       sgstrate=gstrate;
       sgstamt=rate*parseFloat(sgstrate)/100
       
       $("#sgstrate"+inc).val(sgstrate);
       $("#sgstamt"+inc).val(sgstamt);
       
       rate=rate+changetot;
       
       
       
        sTot.value=parseFloat(rate).toFixed(2);
        sTot.disabled=false;
    }
}


var rowNum = 0;
var serialNo=0;
var totalRows=0;
var subTotal=0;

function addSalesRow(frm) {
	

	var articlesCode = $('#saleArticlesCode').val();

	if (articlesCode == 0 || articlesCode == "") {
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please select Article! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please select Article! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	}else{
		
		serialNo++;
   		rowNum ++;
   		
        var itemSizeList=document.getElementById("listSize").value;
   		var iSize2 = new Array();
   		var iquant2 = new Array();
   		var totq2=new Array();
   		var itemA=new Array();
   		var srateA=new Array();
   		var brate=new Array();
   		var itemName=new Array();
   		var rateperitem=new Array()
   		var cgstrate=new Array()
   		var cgstamt=new Array()
   		var sgstrate=new Array()
   		var sgstamt=new Array()
   		var igstrate=new Array()
   		var igstamt=new Array()
   		var hsncode=new Array()
   		var rateperitemamt=new Array()
   		var discount1=new Array()
   		var discount2=new Array()
   		var discountamt=new Array()
   		var basetotal=new Array();
   		var totqtys=0.0;
   		
   		for(var a=0;a<itemSizeList;a++)
   	    {
	   		var quantity2=document.getElementsByName("saleQty[]")[a].value;
	   		var rate1=document.getElementsByName("saleRate[]")[a].value;
	
	   		if(quantity2 != 0 && rate1!=0)
	   		{
		   		iSize2.push(document.getElementsByName("itemSizeName[]")[a].value);
		   		iquant2.push(document.getElementsByName("saleQty[]")[a].value);
		   		totq2.push(document.getElementsByName("salesTot[]")[a].value);
		   		srateA.push(document.getElementsByName("saleRate[]")[a].value);
		   		brate.push(document.getElementsByName("brate[]")[a].value);
		   		itemA.push(document.getElementsByName("itemId[]")[a].value);
		   		itemName.push(document.getElementsByName("itemName[]")[a].value);
		   		
		   		cgstrate.push(document.getElementsByName("cgstrate")[a].value);
		   		cgstamt.push(document.getElementsByName("cgstamt")[a].value);
		   		
		   		sgstrate.push(document.getElementsByName("sgstrate")[a].value);
		   		sgstamt.push(document.getElementsByName("sgstamt")[a].value);
		   		
		   		igstrate.push(document.getElementsByName("igstrate")[a].value);
		   		igstamt.push(document.getElementsByName("igstamt")[a].value);
		   		hsncode.push(document.getElementsByName("hsncode")[a].value);
		   		rateperitem.push(document.getElementsByName("rateperitem")[a].value);
		   		rateperitemamt.push(document.getElementsByName("rateperitemamt")[a].value);
		   		
		   		discount1.push(document.getElementsByName("discount1")[a].value);
		   		discount2.push(document.getElementsByName("discount2")[a].value);
		   		discountamt.push(document.getElementsByName("discamt")[a].value);
		   		basetotal.push(document.getElementsByName("basetotal")[a].value);
	   		}
	   		
	   		else
	   			{
	   			document.getElementById("validation").innerHTML="<b style=color:red>Quantity and Rate required !!</b>";
	   			document.getElementById("validation1").innerHTML="<b style=color:red>Quantity and Rate required !!</b>";
	   			}
	   	}


   	 for(var i=0;i<iSize2.length;i++)
		{
   		totqtys=parseInt(totqtys)+parseInt(iquant2[i]);
			document.getElementById("salesLoopSize").value=rowNum;
			var row = '<tr id="rowNum'+rowNum+'">'
           +'<td> <input type="text" readonly="true" name="article[]" size="9"  value="'+itemA[i]+'"><input type="hidden"   readonly="true" name="SerialNo[]" id="serialNo'+serialNo+'" size="1" readonly="true" value="'+serialNo+'"> </td>'
          +' <td> <input type="text" readonly="true" name="hsncode" size="1"  value="'+hsncode[i]+'"> </td>'
          +'<td><input type="text" readonly="true" size="4" name="articleName[]"  value="'+itemName[i]+'"></td>'
          +'<td> <input type="text" readonly="true" size="4"  name="size[]"  value="'+iSize2[i]+'"><input type="hidden" size="1"   name="brate[]"  value="'+brate[i]+'"><input type="hidden" size="1"  name="itemId[]"  value="'+itemA[i]+'"></td>'
       
         +' <td> <input type="text" readonly="true"  size="4"  name="qty[]" value="'+iquant2[i]+'"></td>'
         +'<td>  <input  readonly="true"  size="1"  type="text" name="srateA[]" size="1" value="'+srateA[i]+'"></td>'
         +'<td>  <input  readonly="true"  size="1"  type="text" name="basetotal" size="1" value="'+basetotal[i]+'"></td>'
         +'<td>  <input  readonly="true"  size="1"  type="text" name="discount1" size="1" value="'+discount1[i]+'"></td>'
         +'<td>  <input  readonly="true"  size="1"  type="text" name="discount2" size="1" value="'+discount2[i]+'%"></td>'
         +'<td>  <input  readonly="true"  size="1"  type="text" name="discountamt" size="1" value="'+discountamt[i]+'"></td>'
         +'<td>  <input type="text" readonly="true"   size="4" name="rateperitem" value="'+rateperitem[i]+'"></td>'
         +'<td>  <input type="text" readonly="true"  size="4" name="rateperitemamt" value="'+rateperitemamt[i]+'"></td>'
        
         +'<td>  <input type="text" readonly="true"  id="tot'+rowNum+'" size="5" name="tot[]" value="'+totq2[i]+'"></td>'
			
          
          +'<td> <input type="text"   readonly="true" name="cgstrate"  size="4" readonly="true" value="'+cgstrate[i]+'"> </td>'
			+'<td> <input type="text"   readonly="true" name="cgstamt"  size="4" readonly="true" value="'+cgstamt[i]+'"> </td>'
			
			+'<td> <input type="text"   readonly="true" name="sgstrate"  size="4" readonly="true" value="'+sgstrate[i]+'"> </td>'
			+'<td> <input type="text"  readonly="true" name="sgstamt"  size="4" readonly="true" value="'+sgstamt[i]+'"> </td>'
			
			+'<td> <input type="text"   readonly="true" name="igstrate"  size="1" readonly="true" value="'+igstrate[i]+'"> </td>'
			+'<td> <input type="text"   readonly="true" name="igstamt"  size="1" readonly="true" value="'+igstamt[i]+'"> </td>'
			
			+'<td><img src="img/deleteStock.png" onclick="removeSalesRow('+rowNum+');" width="25px" height="25px" style="cursor: pointer;"/></td></tr>';
			jQuery('#salesItemRows').append(row);
			
           var takeSubTotal=document.getElementById("salesSubTotal").value;
           var tot=totq2[i];
           subTotal=parseFloat(takeSubTotal)+parseFloat(tot);
           
           document.getElementById('articleNameDiv').innerHTML = "";
           document.getElementById("salesSubTotal").value=subTotal;
         
           
           calSaleGrandTot();
           document.getElementById("tot"+rowNum).focus();
		   document.getElementById('saleArticlesCode').focus();

   		serialNo++;
   		rowNum ++;
		}
     var gtotqtys=$("#totqtys").val();
	    
   	 gtotqtys=parseInt(gtotqtys)+parseInt(totqtys);
   	$("#totqtys").val(gtotqtys);
		document.getElementById("validation").innerHTML="";
		document.getElementById("validation1").innerHTML="";
		document.getElementById('saleArticlesCode').value = "";
		document.getElementById('articleNameDiv').innerHTML = "";

		frm.SerialNo.value=serialNo;
	}
	
}

function removeSalesRow(rnum) {
	
	var	total=0;
	var res=0;
	total=parseFloat(document.getElementById("tot"+rnum).value).toFixed(2);
	res=parseFloat(document.getElementById("salesSubTotal").value).toFixed(2) - total;
	document.getElementById("salesSubTotal").value=res;
	//document.getElementById("saleslessUnit").value=0;
	//document.getElementById("salesDiscounts").value=0;
	//document.getElementById("salesVat").value=0;
	//document.getElementById("salesLFreight").value=0;
	//document.getElementById("salesGrandTotal").value=0;
	calSaleGrandTot();
	var loopSize=document.getElementById("salesLoopSize").value;
	
	document.getElementById("salesLoopSize").value=parseInt(loopSize) - 1;
	jQuery('#rowNum'+rnum).remove();

}

function calSaleGrandTot() {
	var subTotal=$("#salesSubTotal").val();
	  var lessUnit=parseFloat(document.getElementById("saleslessUnit").value);
      var total=subTotal-parseFloat(lessUnit);
      $("#salesGrandTotal").val(total);
}


function resetSaleValue(){
	
	document.getElementById("salesSubTotal").value=0;
	document.getElementById("saleslessUnit").value=0;
	document.getElementById("salesDiscounts").value=0;
	document.getElementById("salesVat").value=0;
	document.getElementById("salesLFreight").value=0;
	document.getElementById("salesGrandTotal").value=0;
	
	document.getElementById("salesDate").value="";
	document.getElementById("saleBill").value=0;
	document.getElementById("customerId").value=0;
	document.getElementById("customerName").value="";
	document.getElementById("otcName").value="";
	document.getElementById("otcMobile").value="";
	document.getElementById("otcAddr").value="";
	
	document.getElementById("saleArticlesCode").value="";
	document.getElementById("salesLoopSize").value=0;
	document.getElementById("afterdiscount").value=0;
	document.getElementById("amountreceived").value=0;
	document.getElementById("amountreturn").value=0;
	

}

function regcusDivValidation() {
	var customerId = $('#customerId').val();
	
	if(customerId!=0){
		$("#flipSale").hide();
	}else{
		$("#flipSale").show();
		document.getElementById("customerName").value="";
	}
}

function otcDivValidation(tempCustBarcode) {
	var otcName = $('#otcName').val();
	var otcMobile = $('#otcMobile').val();
	var otcAddr = $('#otcAddr').val();

	if(otcName=="" && otcMobile=="" && otcAddr==""){
		$("#flipSale1").show();
	} else{
		$("#flipSale1").hide();
	}
	
	var tCustBarcode=tempCustBarcode.value;
	var page ="getTempCustDetails.action?tCustBarcode="+tCustBarcode;               
	ajaxpagefetcher.load("tempCust", page, true);
	setInterval(callTempCust, 1000);
	
}

function callTempCust()
{
	document.getElementById('tempCust').style.display = "block";
}

function getTempCusBuyDetails() {
	var tBarcode = $('#tempCustBarcode').val();
	var page ="getTempCustBuyDetails.action?tCustBarcode="+tBarcode;               
	ajaxpagefetcher.load("tCusBuyDiv", page, true);
	document.getElementById('tCusBuyDiv').style.display = "block";
}

 function addtempCustomer()
 {
	    var page ="addTempCustCall.action";
		ajaxpagefetcher.load("tempCust", page, true);
		document.getElementById('tempCust').style.display = "block";
		document.getElementById('tempCustBarcode').value="";
 }

 function addonttimetempCustomer()
 {
	    var page ="addonttimetempCustomer.action";
		ajaxpagefetcher.load("tempCust", page, true);
		document.getElementById('tempCust').style.display = "block";
		document.getElementById('tempCustBarcode').value="";
 }
 function submitTempDetails(otcName,otcMobile,otcAddr)
 {
	 
	 var page ="addTempCustDetails.action?custName="+otcName.value+"&custMobile="+otcMobile.value+"&custAddress="+otcAddr.value; 
	 ajaxpagefetcher.load("tempCust", page, true);
	 document.getElementById('tempCust').style.display = "block";
	 
 }
 
function validateSale() {
	
	var salesDate = $('#salesDate').val();
	var bill = $('#saleBill').val();
	var customerId = $('#customerId').val();
	var otcName = $('#otcName').val();
	var otcMobile = $('#otcMobile').val();
	var otcAddr = $('#otcAddr').val();
	
	var salesSubTotal = $('#salesSubTotal').val();
	var lessUnit = $('#saleslessUnit').val();
	var discounts = $('#salesDiscounts').val();
	
	var vat = $('#salesVat').val();
	var lFreight = $('#salesLFreight').val();
	var salesGrandTotal = $('#salesGrandTotal').val();
	var amountreturn=document.getElementById("amountreturn").value;

	if (salesDate == 0 || salesDate == "") {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Sales Date!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Sales Date!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (bill == 0 || bill == "") {
			
			document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Bill no!!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
			document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Bill no!!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
			document.getElementById("sub").value="Add Sale";
			document.getElementById("sub").disabled = false;
			return false;
	} else if (customerId == 0 && otcName == "" ) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Customer Details!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Customer Details!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (customerId == 0 && otcName == "") {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Customer Name !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please provide Customer Name !<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	}  else if (isNaN(otcMobile)) {
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Customer Mobile Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Customer Mobile Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (salesSubTotal == 0 || salesSubTotal == "") {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Sales Details Required ! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Sales Details Required ! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(salesGrandTotal) || salesGrandTotal == 0) {
		
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Invalid Entry! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Invalid Entry! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return false;
	}
	/*else if(parseFloat(amountreturn)==0)
		{
		alert("called");
		document.getElementById("sub").value="Add Sale";
		document.getElementById("sub").disabled = false;
		return true
		}*/
	return true;
}

function searchCustHoleLedgerByDATE(context,fromdate,todate)
{
	var frYear=fromdate.substring(0, 4);
	var tYear=todate.substring(0, 4);
	var frMn=parseInt(fromdate.substring(5, 7));
	var tMn=parseInt(todate.substring(5, 7));
	var yRange = document.getElementById("fYearS").value;
 	var frYearSess=yRange.substring(0, 4);
 	var toYearSess=yRange.substring(5, 9);
 	var supplierId=$('#custID').val();
 	var fd=document.getElementById("startDate").value;
 	var td=document.getElementById("endDate").value;
 	
 	
		document.getElementById("validation").innerHTML = "";
	    var page ="selectHolecustLedgerDetails.action?cId="+supplierId+"&fromdate="+fd+"&todate="+td;
		ajaxpagefetcher.load("purchaseLedgerDetails", page, true);
	
}

//*************************************************************************************************************************************************************************
//*************************************************************** CREDIT NOTE COVERLETTER JS CONFIG STARTSS HERE **************************************************************************
//************************************************************************************************************************************************************************

function printCreditCoverLetter(cn,bill,customerId){
	var page= "printCreditCoverLetter.action?billNo="+bill+"&cn="+cn ;
	ajaxpagefetcher.load("lDetailsDiv2", page, true);
}

function printCreditLedgerDetails(cn,bill,customerId){
	var page="printCreditLedger.action?billNo="+bill+"&cn="+cn ;
	ajaxpagefetcher.load("lDetailsDiv2", page, true);
}

//*************************************************************************************************************************************************************************
//*************************************************************** CREDIT NOTE COVERLETTER JS CONFIG ENDS HERE **************************************************************************
//************************************************************************************************************************************************************************

//---------------------------------------------------------------Work start 21-09-2016-------------------------------------------------------------------------------------
function calculateAmnt()
{
	


var amountreceived=document.getElementById("amountreceived").value;
var grandTotal=document.getElementById("salesGrandTotal").value;

var total=0;

if(parseFloat(amountreceived)<parseFloat(grandTotal))
	{
	document.getElementById("amountreturn").value="0"
	document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Amount must be greater or equal then Grand Total<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";	
	document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Amount must be greater or equal then Grand Total<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";		
	}
else {
	
	total=parseFloat(amountreceived)-parseFloat(grandTotal);
	document.getElementById("amountreturn").value=total;
	document.getElementById("validation").innerHTML="";
	document.getElementById("validation1").innerHTML="";
	
}



}


function searchcustomer()
{
	
	var cstname=document.getElementById("searchCustomer").value;
	var smsremain=document.getElementById("remainsms").value;
	
	var page="searchCustomerforsms.action?cstname="+cstname+"&smsremain="+smsremain;
	ajaxpagefetcher.load("smsd", page, true);	
}


function spcall()
{
	var sname=document.getElementById("sp").value;

	var page="searchSupplierByName.action?sp="+sname;
	ajaxpagefetcher.load("sps", page, true);

}
