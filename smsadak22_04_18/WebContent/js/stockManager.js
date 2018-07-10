
//########################################################################## Stock Calculation JS Configuration satart here#############################
function test(ctxPath){
	
	document.getElementsByName("brate")[0].value="0";
	 var itemSizeList=document.getElementById("sizeListid").value;
	var articleCode=document.getElementById("articlesCode").value;
	var page = ctxPath + "/getArticleName.action?articleCode="+articleCode;
	ajaxpagefetcher.load("articleName", page, true);
	
	for(var k=0;k<itemSizeList;k++)
    {
   	     document.getElementsByName("tqty[]")[k].value="0";
   	     document.getElementsByName("ttot[]")[k].value="0";
    }
	/*var itemSizefrm=document.getElementById("itemSize").value;
	
	var loopsize=document.getElementById("loopSize").value;
	   if(loopsize>0)
		{
		  
		   for(var i=0;i<loopsize;i++)
			{
		    	var article=document.getElementsByName("article[]")[i].value;
		    	var itemSize=document.getElementsByName("itemSize[]")[i].value;
		    	if(articleCode==article && itemSizefrm==itemSize )
		    		{
		    			document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Article already added.!! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		    			document.getElementById("articlesCode").value="";
		    		}
			}
		}
	   
	document.getElementById('tot').value="0";
	var page = ctxPath + "/getArticleName.action?articleCode="+articleCode;
	ajaxpagefetcher.load("articleName", page, true);*/
}

function test2(ctxPath){
	var articleCode=document.getElementById("articlesCode").value;
	var itemSizefrm=document.getElementById("itemSize").value;
	var loopsize=document.getElementById("loopSize").value;
	if(document.getElementById("freeItem").value == "Click to Add Free Item"){
		if(loopsize>0)
		{
			
		   for(var i=0;i<loopsize;i++)
			{
			 
		    	var article=document.getElementsByName("article[]")[i].value;
		    	var itemSize=document.getElementsByName("itemSize[]")[i].value;
		    	var brate=document.getElementsByName("brate[]")[i].value;
		    	if(brate != 0)
		    	{
		    		if(articleCode==article && itemSizefrm==itemSize )
		    		{
		    		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Article already added.!! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		    		document.getElementById("articlesCode").value="";
		    		document.getElementById("itemSize").value="0";
		    		}
		    	}
			}
		}
	} else{
		
	}
}
function supplierComboCall(ctxPath) {
	var k=document.getElementById("supplierName").value;
	var page = ctxPath + "/supplierComboCall.action?supname="+k;
	ajaxpagefetcher.load("k", page, true);
}

function refreshSupplierComboCall(ctxPath) {
	
	var k="";
	document.getElementById("supplierName").value=k;
	var page = ctxPath + "/supplierComboCall.action?supname="+k;
	ajaxpagefetcher.load("k", page, true);
}

function callSuppChange(ctxPath)
{
	var k="";
	document.getElementById("supplierName").value=k;

}

function stockListCall(ctxPath) {
	var page = ctxPath + "/stockListCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function stockItemListCall(ctxPath) {
	var page = ctxPath + "/stockItemListCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function checkDupBill(bill) {
	
	var supplierId=document.getElementById("supplierId").value;
	var page ="checkDupBill.action?bill="+bill+"&supplierId="+supplierId;
	ajaxpagefetcher.load("addStockBt", page, true);
}

function stockItemListCall(ctxPath) {
	
	var page =ctxPath+"/stockItemListCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function getAllItemStock(itemId,itemName) {
	var page ="getItemStock.action?itemId="+itemId+"&itemName="+itemName;
	ajaxpagefetcher.load("iDetailsDiv", page, true);
}

function searchPurchaseDetailsByDATEorSup(context, sId,fromdate, todate) {

		document.getElementById("validation").innerHTML = "";
		var cstvat="";
		var page = context + "/searchPurchaseDetailsByDATEorSup.action?sId="+sId+"&fromdate="+ fromdate + "&todate=" + todate+"&vatcst="+cstvat;
		ajaxpagefetcher.load("stockDetailsDiv", page, true);
	
}

function clearDate() {
	document.getElementById("startDate").value="";
	document.getElementById("endDate").value="";
	document.getElementById("SupplierId").value="0";
}



function editInvoiceCall(ctx) {
	var page =ctx+"/editInvoiceCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function viewBillToEdit(bill) {
	var page ="admin/editBill.jsp?billNo="+bill;
	ajaxpagefetcher.load("addContent", page, true);
}
function validateBill() {
	var newBill=$('#newBill').val();
	var oldBill=$('#oldBill').val();

	if (newBill=="") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Bill No! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	}
}
function chkDupBillForEdit() {
	var newBill=$('#newBill').val();

	if (newBill!="") {
		var page ="chkDupBillForEdit.action?billNo="+newBill;
		ajaxpagefetcher.load("editBillBtn", page, true);
	}
}
//########################################################################## Stock Calculation JS Configuration End here#############################

//########################################################################## Debit Note Calculation JS Configuration start here#############################

function selectStockDetails() {
	var supplierId=$('#supplierId').val();
	
	document.getElementById("supplierStockDetails").innerHTML = "<br/><br /><label	style='font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px'>Select any invoice number to display data !! </label>";
	
	if(supplierId>0){
		var page ="callBillDetails.action?supplierId="+supplierId;
		ajaxpagefetcher.load("billno", page, true);
	}else{
		document.getElementById("supplierStockDetails").innerHTML = "<br/><br /><label	style='font: italic; font-family: !important; font-weight: bold; color: navy; margin: 21px 11px 25px 261px'>Select any invoice number to display data !! </label>";
		document.getElementById("billNo").value=0;
	}
}

function selectStocksByBillBo(f) {
	var billNo=f.value;
	var supplierId=document.getElementById("supplierId").value;
	var page ="selectStockDetails.action?billNo="+billNo+"&supplierId="+supplierId;
	ajaxpagefetcher.load("supplierStockDetails", page, true);
}

function selectDNDetails() {
	var supplierId=$('#supplierId').val();
	if(supplierId==0){
		document.getElementById("debitNoteDetails").innerHTML = "";
	}else{
		var page ="selectDNDetails.action?supplierId="+supplierId;
		ajaxpagefetcher.load("debitNoteDetails", page, true);
	}
}
function getDNDetails(dn,sid) {
	var page ="getDNDetails.action?supplierId="+sid+"&dn="+dn;
	ajaxpagefetcher.load("dnDetailsDiv", page, true);
}

function validateDebitCalc(){
	var sDoc =$('#sDoc').val();
	var gTot =$('#stockGrandTotal').val();
	if(sDoc == 0 || sDoc == ""){
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value="Add Debit details";
		document.getElementById("sub").disabled = false;
		return false;
	} else if(gTot == 0 || gTot == "" || isNaN(gTot)){
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Debit Atleast One Item! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value="Add Debit details";
		document.getElementById("sub").disabled = false;
		return false;
	}
	return true;
}

//########################################################################## Debit Note Calculation JS Configuration End here#############################

//########################################################################## Ledger Configuration Start here#############################
	function selectPLedgerDetails(){
		var supplierId=$('#supplierId').val();
		$('#mode').val("0");
		document.getElementById("startDate").value="";
		document.getElementById("endDate").value="";
		document.getElementById("validation").innerHTML = "";
		if(supplierId==0){
			$('#mode').val("0");
			document.getElementById("purchaseLedgerDetails").innerHTML = "";
		}else{
			var page ="selectPLedgerDetails.action?supplierId="+supplierId;
			ajaxpagefetcher.load("purchaseLedgerDetails", page, true);
		}
	}
	
	function getpLedgerByModeAndSup(){
		var supplierId=$('#supplierId').val();
		var mode=$('#mode').val();
		document.getElementById("startDate").value="";
		document.getElementById("endDate").value="";
		document.getElementById("validation").innerHTML = "";
		if(mode==0){
			document.getElementById("purchaseLedgerDetails").innerHTML = "";
		} else if(supplierId==0){
			document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please select any Supplier to continue !! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			document.getElementById("purchaseLedgerDetails").innerHTML = "";
			return false;
		}else{
			var page ="getpLedgerByModeAndSup.action?supplierId="+supplierId+"&mode="+mode;
			ajaxpagefetcher.load("purchaseLedgerDetails", page, true);
		}
	}
	
	function searchLedgerByDATE(context,fromdate,todate)
	{
		
		var frYear=fromdate.substring(0, 4);
		var tYear=todate.substring(0, 4);
		var frMn=parseInt(fromdate.substring(5, 7));
		var tMn=parseInt(todate.substring(5, 7));
		var yRange = document.getElementById("fYearS").value;
	 	var frYearSess=yRange.substring(0, 4);
	 	var toYearSess=yRange.substring(5, 9);

	 	var supplierId=$('#supplierId').val();
	    var mode=$('#mode').val();
	    
		if((supplierId==0 && todate =="" && fromdate =="") || (supplierId==0 && todate !="" && fromdate !="")){
			document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please select any supplier to continue !! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			document.getElementById("purchaseLedgerDetails").innerHTML = "";
			return false;
		}else if ((supplierId!=0 && fromdate !="" &&  todate =="")) {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select To Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if ((supplierId!=0 &&  todate!="" && fromdate =="")) {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select From Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if ((supplierId!=0 && (frYear<frYearSess || frYear>toYearSess) && fromdate != "" &&  todate != "")) {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Range should be "+yRange+"! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if ((supplierId!=0 && (frYear==frYearSess && frMn<4) && fromdate != "" &&  todate != "")) {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Start Month should be April ! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if ((supplierId!=0 && (tYear==toYearSess && tMn>3) && fromdate != "" &&  todate != "")) {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>End Month should be upto March! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if ((supplierId!=0 &&  (tYear<frYearSess || tYear>toYearSess) && fromdate != "" &&  todate != "")){
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Range should be "+yRange+"! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else{
			document.getElementById("validation").innerHTML = "";
			var page ="selectPLedgerDetails.action?supplierId="+supplierId+"&mode="+mode+"&fromdate="+fromdate+"&todate="+todate;
			ajaxpagefetcher.load("purchaseLedgerDetails", page, true);
		}
		
	}
	
	function exportingLedgerDetails(fromdate,todate)
	{
	 	var supplierId=$('#supplierId').val();
	    var mode=$('#mode').val();
	    if((supplierId==0 && todate !="" && fromdate !="")){
			document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please select any supplier to continue !! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			document.getElementById("purchaseLedgerDetails").innerHTML = "";
			return false;
		}else if ((supplierId!=0 && fromdate !="" &&  todate =="") || (supplierId==0 && fromdate !="" &&  todate =="")) {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select To Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else if ((supplierId!=0 &&  todate!="" && fromdate =="") || (supplierId==0 &&  todate!="" && fromdate =="")) {
			document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select From Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
			return false;
		} else{
			var g="exportingLedgerDetails.action?supplierId="+supplierId+"&mode="+mode+"&fromdate="+fromdate+"&todate="+todate;
			document.getElementById("exlLedger").action = g;
			document.getElementById("exlLedger").submit();
		}
	}
	
	function searchHoleLedgerByDATE(context,fromdate,todate)
	{
		var frYear=fromdate.substring(0, 4);
		var tYear=todate.substring(0, 4);
		var frMn=parseInt(fromdate.substring(5, 7));
		var tMn=parseInt(todate.substring(5, 7));
		var yRange = document.getElementById("fYearS").value;
	 	var frYearSess=yRange.substring(0, 4);
	 	var toYearSess=yRange.substring(5, 9);
		
	 	var supplierId=$('#supplierId').val();
	 	
	 	document.getElementById("validation").innerHTML = "";
	    var page ="selectHoleLedgerDetails.action?supplierId="+supplierId+"&fromdate="+fromdate+"&todate="+todate;
		ajaxpagefetcher.load("purchaseLedgerDetails", page, true);
	}
	function getLedgerDetails(dn,bill,supplierId){
			var page ="lDetails.action?billNo="+bill+"&dn="+dn+"&supplierId="+supplierId;
			ajaxpagefetcher.load("lDetailsDiv", page, true);
	}
	
	
	function getAllDetailsOfStock(billno,supplierId){
	
	    var page ="getStockDetailsbyBillNo.action?billNo="+billno+"&supplierId="+supplierId;
  	    ajaxpagefetcher.load("lDetailsDiv", page, true);
     }

	
	function printLedgerDetails(dn,bill,supplierId)
	{
		var page ="printledger.action?billNo="+bill+"&dn="+dn;
		ajaxpagefetcher.load("lDetailsDiv2", page, true);
	}
	
	
	function printCoverLetter(dn,bill,supplierId)
	{
		
		var page ="printCoverLatter.action?billNo="+bill+"&dn="+dn;
		ajaxpagefetcher.load("lDetailsDiv2", page, true);
	}

//########################################################################## Ledger Configuration End here#############################

//########################################### JAvascript function for Stock Calculation --Start here ######################################################## -->   

var rowNum = 0;
var serialNo=0;
var totalRows=0;
var subTotal=0;
    
    function calculateTotalStock(qty,inc)
	 {
		 var buyrate=document.getElementsByName("brate")[0].value;
		 var ftotal=parseFloat(qty) *parseFloat(buyrate);
		 document.getElementById("ttot"+inc).value=ftotal;
		 if(buyrate=="")
		 {
		 document.getElementsByName("brate")[0].value="0";
		 var buyrate2=document.getElementsByName("brate")[0].value;
		 var ftotal=parseFloat(qty) *parseFloat(buyrate2);
		 document.getElementById("ttot"+inc).value=ftotal.toFixed(2);
		 }
	 }
   
   function addRowEx2(frm) {
   	var articlesCode = $('#articlesCode').val();
   	var msgChk = $('#msgChk').val();
   	var buyRate = $('#1').val();

   	if (articlesCode == 0 || articlesCode == "") {
   		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please select Item! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
   		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please select Item! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
   		return false;
   	} else if (msgChk == 0) {
   		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please select Valid Item! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
   		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please select Valid Item! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
   		return false;
   	} else if (isNaN(buyRate)) {
   		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Illegal Characters For Buy Rate! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
   		document.getElementById("validation1").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Illegal Characters For Buy Rate! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
   		return false;
   	} else{
   		
   		//##########################################################################################################################################################
   		//###################################################### Dynamic Array multiple rows code start here ##########################################################
   		//##########################################################################################################################################################
   		serialNo++;
   		rowNum ++;
   		
        var itemSizeList=document.getElementById("sizeListid").value;
   		var iSize2 = new Array();
   		var iquant2 = new Array();
   		var totq2=new Array();
   		for(var a=0;a<itemSizeList;a++)
   	    {
   		  var qauntity2=parseFloat(document.getElementsByName("tqty[]")[a].value)    ;     
	   	   
	       if(!isNaN(parseFloat(document.getElementsByName("ttot[]")[a].value)))
	       {	   
	   		if(qauntity2!=0 )
	   		{
		   		iSize2.push(document.getElementsByName("itemSizeName[]")[a].value);
		   		iquant2.push(document.getElementsByName("tqty[]")[a].value);
		   		totq2.push(document.getElementsByName("ttot[]")[a].value);
	   		}
	       }
	   	}
   	 for(var i=0;i<iSize2.length;i++)
   		{
	   		var row = '<p id="rowNum'+rowNum+'"> <input type="text"  class="textboxStockSerial" readonly="true" name="SerialNo[]" id="serialNo'+serialNo+'" size="1" value="'+serialNo+'">    <input type="text"  class="textboxStock"  readonly="readonly" name="article[]" size="11" value="'+frm.articles.value+'"> <input type="text"  class="textboxStock"  readonly="readonly" size="11" name="itemSize[]" value="'+iSize2[i]+'">  <input type="text"  class="textboxStock" size="11" readonly="readonly" name="qty[]" value="'+iquant2[i]+'">  <input   class="textboxStock" readonly="readonly" type="text" name="brate[]" size="22" value="'+frm.brate.value+'">  <input type="text" class="textboxStock" readonly="readonly" size="3" id="tot'+rowNum+'" name="tot[]" value="'+totq2[i]+'"><img src="img/deleteStock.png" onclick="removeRow('+rowNum+');" width="25px" height="25px" style="cursor: pointer;"/></p>';
	   		jQuery('#itemRows').append(row);
	
	           for(var k=0;k<itemSizeList;k++)
		        {
			   	     document.getElementsByName("tqty[]")[k].value="0";
			   	     document.getElementsByName("ttot[]")[k].value="0";
		        }
	          
	           var takeSubTotal=document.getElementById("stockSubTotal").value;
	           var tot=totq2[i];
	           subTotal=parseFloat(takeSubTotal)+parseFloat(tot);
	   		  
	           document.getElementById("stockSubTotal").value=subTotal;
	           calculateGrandTot();
     		   document.getElementById("tot"+rowNum).focus();
    		   document.getElementById('articlesCode').focus();
	   		
	   		serialNo++;
	   		rowNum ++;
   		}
   	
   		document.getElementById("articleName").innerHTML= "";
   		document.getElementById('articlesCode').value="";
   		document.getElementsByName('brate')[0].value="0";
        document.getElementById('tot').value="0";
        document.getElementById("validation").innerHTML="";
        document.getElementById("validation1").innerHTML="";
   		
   		//##########################################################################################################################################################
   		//###################################################### Dynamic Array multiple rows code End here ##########################################################
   		//##########################################################################################################################################################
   		
   		document.getElementById("tot"+rowNum).focus();
   		document.getElementById('articlesCode').focus();

   		document.getElementById("validation").innerHTML="";
   		document.getElementById("validation").innerHTML="";
   		
   		x=document.getElementById("tot");
   		x.value='0';
   		frm.articles.value = '';
   		frm.itemSize.value = '0';
   		frm.qty.value = '0';
   		frm.brate.value = '0';
   		frm.loc.value = '';
   		
   		frm.SerialNo.value=serialNo;
   	}
	
}

   
   
   
   
   
   
   
function removeRow(rnum) {
    var	total=0;
	var res=0;
	total=parseFloat(document.getElementById("tot"+rnum).value).toFixed(2);
	res=parseFloat(document.getElementById("stockSubTotal").value).toFixed(2) - total;
	
	document.getElementById("stockSubTotal").value=res;
	//document.getElementById("lessUnit").value=0;
	//document.getElementById("discounts").value=0;
	//document.getElementById("vat").value=0;
	//document.getElementById("stockSubTotal").value=0;
	//document.getElementById("lFreight").value=0;
	//document.getElementById("stockGrandTotal").value=0;
	calculateGrandTot();
	var loopSize=document.getElementById("loopSize").value;
	document.getElementById("loopSize").value=parseInt(loopSize) - 1;
	jQuery('#rowNum'+rnum).remove();
	
}

function calledaz(context)
{
	var itemids=[];
	var mrps=[];
	
	var rowNum=document.getElementById("rowNum").value;
	
	   for(var j=0;j<rowNum;j++)
		{
		
		var itemId=   document.getElementsByName("idto.itemId")[j].value;
		var itemmrp=  document.getElementsByName("idto.itemMrp")[j].value;
		  itemids.push(itemId);
		  mrps.push(itemmrp);
		   
		}
	   
	
	
	var iname=document.getElementById("iName").value;
	var e = document.getElementById("itemTypeId");
	var itype = e.options[e.selectedIndex].value;
	var g = document.getElementById("itemBrandId");
	var brandID = g.options[g.selectedIndex].value;
	var h = document.getElementById("itemUnit");
	var itemUnit = h.options[h.selectedIndex].value;
	
	
	
	    
	
	
	
	if (iname == "") {
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Item Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (itype == 0) {
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Item Type! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (brandID == 0) {
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Brand Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (itemUnit == 0) {
		document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Unit! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	}  else{
			var page = context + "/addItemFromStock.action?iName=" + iname+"&itemTypeId="+itype+"&itemBrandId="+brandID+"&itemUnit="+itemUnit+"&itemCode="+itemids+"&itemMrp="+mrps;
			ajaxpagefetcher.load("resultUpdate", page, true);
			clearfield();
	}
}

function calledaz2(context)
{
	var itemName = $('#iName').val();
	var bId = $('#itemBrandId').val();
	var iCode = $('#iCode').val();
	var page = context + "/addItemFromStock2.action?itemName=" + itemName + "&bId=" + bId+ "&itemCode=" + iCode;
	ajaxpagefetcher.load("addItemBt", page, true);
	
}

function disableFunction()
{
	document.getElementById('tot').readOnly = true;
}
function sum(a,b)
{
	 var itemSizeList=document.getElementById("sizeListid").value;
	 for(var k=0;k<itemSizeList;k++)
     {
	   	     document.getElementsByName("tqty[]")[k].value="0";
	   	     document.getElementsByName("ttot[]")[k].value="0";
     }
}

function billCall()
{
	var bill=document.getElementById("bill").value;
	var challan=document.getElementById("challan").value;
	
	
	if(bill=="")
		{
		document.getElementById("challan").disabled=false;
		}
	else
		{
		if(challan=="" || challan>0 )
			{
			document.getElementById("challan").disabled=false;
			}
		else
			{
			document.getElementById("challan").disabled=true;
			}

		}
}

function disableCst() {
	var vat = $('#vat').val();
	if(vat!=0 || vat!=""){
		document.getElementById("flipPay3").disabled = true;
		$('#cst').val("0");
		$('#waybill').val("NA");
	}else{
		document.getElementById("flipPay3").disabled = false;
		$('#cst').val("0");
		$('#waybill').val("");
	}
}

function disableVat() {
	var cst = $('#cst').val();
	var waybill = $('#waybill').val();
	if((cst=="0" && waybill=="") || (cst=="" && waybill=="")){
		document.getElementById("flipPay2").disabled = false;
		$('#vat').val("0");
	} else{
		document.getElementById("flipPay2").disabled = true;
		$('#vat').val("0");
	}
}

function calculateGrandTot() {
	var stockSubTotal=parseFloat(document.getElementById("stockSubTotal").value);
	var lessUnit=parseFloat(document.getElementById("lessUnit").value);
	var discounts=parseFloat(document.getElementById("discounts").value);
	var vat=parseFloat(document.getElementById("vat").value);
	var cst=parseFloat(document.getElementById("cst").value);
	var lFreight=parseFloat(document.getElementById("lFreight").value);
	var gTot="";
	
	
	var pdiscountamt=stockSubTotal * discounts/100;

	
	$("#discountamt").val(pdiscountamt);
	
	
	if(vat!=0){
		
		

		
		var value1=(stockSubTotal-(lessUnit+pdiscountamt));
		var vatAmount=vat/100;
		var gstamt=parseFloat(value1)*parseFloat(vatAmount);
	
		var value2=value1+(value1*vatAmount);
		
		$("#gstamt").val(gstamt.toFixed(2));
		
		var csgstrate=parseFloat(vat)/2;
		$("#cgstrate").val(csgstrate.toFixed(2));
		$("#sgstrate").val(csgstrate.toFixed(2));
		
		
		$("#cgstamt").val(parseFloat(gstamt.toFixed(2))/2);
		$("#sgstamt").val(parseFloat(gstamt.toFixed(2))/2);
		$("#igstamt").val("0")
		$("#igstrate").val("0")
		
		gTot=value2+lFreight;
	}else{
		$("#gstamt").val("0")
		$("#cgstrate").val("0")
		$("#cgstamt").val("0")
		$("#sgstrate").val("0")
		$("#sgstamt").val("0")
		$("#igstamt").val("0")
		$("#igstrate").val("0")
		$("#vat").val("0")
		
		var cstAmount=cst/100;
		var value1=(stockSubTotal-(lessUnit+discounts));
		var value2=value1+(value1*cstAmount);
		gTot=value2+lFreight;
	}
	document.getElementById("stockGrandTotal").value=gTot;
}

function igstcalculateGrandTot() {
	var stockSubTotal=parseFloat(document.getElementById("stockSubTotal").value);
	var lessUnit=parseFloat(document.getElementById("lessUnit").value);
	var discounts=parseFloat(document.getElementById("discounts").value);
	var vat=parseFloat(document.getElementById("igstrate").value);
	var cst=parseFloat(document.getElementById("cst").value);
	var lFreight=parseFloat(document.getElementById("lFreight").value);
	var gTot="";
	
	
	var pdiscountamt=stockSubTotal * discounts/100;

	
	$("#discountamt").val(pdiscountamt);
	
	
	if(vat!=0){
		
		

		
		var value1=(stockSubTotal-(lessUnit+pdiscountamt));
		var vatAmount=vat/100;
		var gstamt=parseFloat(value1)*parseFloat(vatAmount);
	
		var value2=value1+(value1*vatAmount);
		
		$("#igstamt").val(gstamt.toFixed(2));
		
		
		$("#cgstrate").val("0");
		$("#sgstrate").val("0");
		
		
		$("#cgstamt").val("0");
		$("#sgstamt").val("0");
		
		$("#gstamt").val("0")
		$("#vat").val("0")
		gTot=value2+lFreight;
	}else{
		$("#gstamt").val("0")
		$("#cgstrate").val("0")
		$("#cgstamt").val("0")
		$("#sgstrate").val("0")
		$("#sgstamt").val("0")
		$("#igstamt").val("0")
		$("#igstrate").val("0")
			$("#gstamt").val("0")
		$("#vat").val("0")
		
		
		var cstAmount=cst/100;
		var value1=(stockSubTotal-(lessUnit+discounts));
		var value2=value1+(value1*cstAmount);
		gTot=value2+lFreight;
	}
	document.getElementById("stockGrandTotal").value=gTot;
}



function resetValue(){
	document.getElementById("stockSubTotal").value=0;
	document.getElementById("lessUnit").value=0;
	document.getElementById("discounts").value=0;
	document.getElementById("vat").value=0;
	document.getElementById("cst").value=0;
	document.getElementById("waybill").value="";
	document.getElementById("lFreight").value=0;
	document.getElementById("stockGrandTotal").value=0;
	document.getElementById("supplierId").value=0;
	document.getElementById("bill").value=0;
	document.getElementById("challan").value=0;
	document.getElementById("articlesCode").value="";
	document.getElementById("1").value=0;
	document.getElementById("3").value=0;
	document.getElementById("tot").value=0;
	document.getElementById("loopSize").value=0;
	clearfield();
}

function clearfield() {
	
	document.getElementById("iName").value="";
	document.getElementById("itemTypeId").value=0;
	document.getElementById("itemBrandId").value=0;
	document.getElementById("itemUnit").value=0;
	document.getElementById("iCode").value="";
	
	
	
}

// ########################################### JAvascript function for Stock Calculation --End here ######################################################## -->      

//########################################### Session refresh code start here ######################################################## -->     
function sessionReloadCall()
{
	setInterval(sload,100000);
}

function sload()
{
	
	
	var page ="sessionCheck.action";
	ajaxpagefetcher.load("sesreload", page, true);
	
	setInterval(redirectSession,10000);

}


function redirectSession()
{
	var s=document.getElementById("sessionStatus").value;

	if(s=="sessionExpired")
		{
		window.location="logout.action";
		}
	
}
//########################################### Session refresh code End here ######################################################## -->     
