

function clearZero(id) {
	
	if (id.value == 0) {
		id.value = "";
	}
}

function hi()
{
	
alert("hi");
}

function checkDupPurchaseBill(bill) {
	var page ="checkDupBill.action?bill="+bill;
	ajaxpagefetcher.load("addStockBt", page, true);
}

// ################################ printing function #############################################################
function myFunction() {
	window.print();
}

function CenterWindow(windowWidth, windowHeight, windowOuterHeight, url, wname,features, billno,doc)
{
	
	windowWidth=700;
	windowHeight=540;
	
	

	var centerLeft = parseInt((window.screen.availWidth - windowWidth) / 2);
	var centerTop = parseInt(((window.screen.availHeight - windowHeight) / 2)
			- windowOuterHeight);

	var misc_features;
	if (features) {
		misc_features = ', ' + features+', status=no, location=no, scrollbars=yes, resizable=yes';
	} else {
		misc_features = ', status=no, location=no, scrollbars=yes, resizable=yes';
	}

	var newUrl = url + "?billno=" + billno+"&doc="+doc;

	var windowFeatures = 'width=' + windowWidth + ',height=' + windowHeight
			+ ',left=' + centerLeft + ',top=' + centerTop + misc_features;
	var win = window.open(newUrl, wname, windowFeatures);
	win.focus();
	return win;
}
// ################################ printing function #############################################################

// ############################# Different Menu Related function Start here/ ###################################################


function popuppageForItem(windowWidth, windowHeight, windowOuterHeight, url, wname,features, billno)
{
	
	windowWidth=700;
	windowHeight=490;
	

	var centerLeft = parseInt((window.screen.availWidth - windowWidth) / 2);
	var centerTop = parseInt(((window.screen.availHeight - windowHeight) / 2)
			- windowOuterHeight);

	var misc_features;
	if (features) {
		misc_features = ', ' + features+', status=no, location=no, scrollbars=yes, resizable=yes';
	} else {
		misc_features = ', status=no, location=no, scrollbars=yes, resizable=yes';
	}

	var newUrl = url ;

	var windowFeatures = 'width=' + windowWidth + ',height=' + windowHeight
			+ ',left=' + centerLeft + ',top=' + centerTop + misc_features;
	var win = window.open(newUrl, wname, windowFeatures);
	win.focus();
	return win;
}



function fetchMatchCustomer(schemeName) {

	var page = "fetchEligibleCustomerList.action?schemeName="
			+ schemeName.value;

	ajaxpagefetcher.load("eligibleCustomer", page, true);
	document.getElementById("eligibleproducts").innerHTML = "";
}

function fetchEligibleProducts(customername, schemeName, sdate, edate) {

	var page = "fetchEligibleproductsList.action?schemeName="
			+ schemeName.value + "&sdate=" + sdate.value + "&edate="
			+ edate.value + "&customername=" + customername.value;
	ajaxpagefetcher.load("eligibleproducts", page, true);
}

function itemCategoryCall() {
	var page = "showItemCategory.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function viewcategoryCall(ctxPath) {
	var page = ctxPath + "/viewcategoryCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function editItemCategoryCall(id, ctxPath) {
	var page = ctxPath + "/editItemCategoryCall.action?itemTypeID=" + id;
	ajaxpagefetcher.load("addContent", page, true);
}

function sTockCall(ctxPath) {

	var page = ctxPath + "/sTockCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function addSizeCall() {
	
	var page = "addSizeCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function addSizeCall2() {
	alert("called");
}

function editSizeCall(id, ctxPath) {
	var page = ctxPath + "/editSizeCall.action?sizeId=" + id;
	ajaxpagefetcher.load("addContent", page, true);
}

function addBrandCall() {
	var page = "addBrandCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}
function editBrandCall(id, ctxPath) {
	var page = ctxPath + "/editBrandCall.action?itemBrandId=" + id;
	ajaxpagefetcher.load("addContent", page, true);
}

function addItemCall() {
	var page = "addItemCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}



function addMultipleItems(frm) {
 
	   		//##########################################################################################################################################################
	   		//###################################################### Dynamic Array multiple rows code start here ##########################################################
	   		//##########################################################################################################################################################
	   		serialNo++;
	   		rowNum ++;
	   		
	     
	   	 for(var i=0;i<1;i++)
	   		{
	   		

		   		var row = '<p id="rowNum'+rowNum+'"> '
		   		
		   		+'<input type="text"  id="tot'+rowNum+'"  class="textboxStock" name="idto.itemId" size="11"  >' 
		   	
		   		
		   		+'MRP <input type="text"  class="textboxStock" id="mrp'+rowNum+'" onkeyup="checkDuplicateId('+rowNum+');"  name="idto.itemMrp" size="11"  >'
		   		
		   		+'<input type="hidden" class="textboxStock" id="dupt'+rowNum+'" name="dupT" value="0"  />'
		   		
		   		+'<img src="img/deleteStock.png" onclick="removeRow4('+rowNum+');" width="25px" height="25px" style="cursor: pointer;"/> '
		   		+'<div id="dp'+rowNum+'" style="margin:-28px 68px 28px 384px;"><img src="img/dup.gif" style="display:none" id="dupImg'+rowNum+'" width="67px" height="34px" style="cursor: pointer; margin:9px 5px -15px 5px;"/></div></p>';
		   		
		   		
		   		jQuery('#itemRows2').append(row);
		
		   		
	   		}
	   	document.getElementById("tot"+rowNum).focus();
		document.getElementById("rowNum").value=rowNum;
	   		
	   		//##########################################################################################################################################################
	   		//###################################################### Dynamic Array multiple rows code End here ##########################################################
	   		//##########################################################################################################################################################
	   		
	   	document.getElementById('pbutton').style.display = 'block';	
	   	}


    function removeRow4(rnum) {
	jQuery('#rowNum'+rnum).remove();
	
	jQuery('#dp'+rnum).remove();
	rowNum=rowNum-1;
	document.getElementById("rowNum").value=rowNum;
	
}

var rn="";
function  checkDuplicateId(rowNum) 
{
	 rn=rowNum;
	var id=	document.getElementById("tot"+rowNum).value;

	
	var mrp=document.getElementById("mrp"+rowNum).value;
	var fID=id+" MRP "+mrp;
	
	var page = "checkDuplicateItemID.action?id="+fID;
	ajaxpagefetcher.load("dupId", page, true);
	
	setTimeout(checkEngine, 1000);
	
}
    
function checkEngine()  
{
	
var dupres=document.getElementById("dupChk").value;

if(dupres>0)
	{
document.getElementById("mrp"+rn).value="";
document.getElementById("dupImg"+rn).style.display="block";
	}
else
	{
	document.getElementById("dupImg"+rn).style.display="none";
	}

document.getElementById("dupt"+rn).value=dupres;






}



function getItemsCall(ctxPath) {
	var page = ctxPath + "/getItemsCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}
function editItemsCall(id, ctxPath) {
	var page = ctxPath + "/editItemsCall.action?itemId=" + id;
	ajaxpagefetcher.load("addContent", page, true);
}

function addWareHouseCall(ctxPath) {
	var page = ctxPath + "/addWareHouseCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function locListCall(ctxPath) {
	var page = ctxPath + "/locationListCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function editLocationCall(locId, ctxPath) {
	var page = ctxPath + "/editLocationCall.action?locId=" + locId;
	ajaxpagefetcher.load("addContent", page, true);
}

function addcustomerCall(ctxPath) {

	var page = ctxPath + "/addcustomerCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function supplierCall(ctxPath) {
	var page = ctxPath + "/supplierCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function editSupplierCall(id, ctxPath) {
	var page = ctxPath + "/editSupplierCall.action?SupplierId=" + id;
	ajaxpagefetcher.load("addContent", page, true);
}

function addcustCall(ctxPath) {

	var page = ctxPath + "/addcustomerCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function viewSupplierList(ctxPath) {
	var page = ctxPath + "/viewSupplierList.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function adminIndexCall(ctxPath) {
	var page = ctxPath + "/adminIndexCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function addcustomerCall(ctxPath) {

	var page = ctxPath + "/addcustomerCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}
function addcustCall(ctxPath) {

	var page = ctxPath + "/addcustomerCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function editCustomerCall(id, ctxPath) {
	var page = ctxPath + "/editCustomerCall.action?customerId=" + id;
	ajaxpagefetcher.load("addContent", page, true);
}

function addSchemeCall(ctxPath) {
	var page = ctxPath + "/addSchemeCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

function checkDupScheme() {
	schemeName = $('#sName').val();
	var page = "checkDupScheme.action?schemeName=" + schemeName;
	// var page="admin/addSchemeBtn.jsp";
	ajaxpagefetcher.load("addSchemeBt", page, true);
}

function viewSchemeCall(ctxPath) {
	var page = ctxPath + "/viewSchemeCall.action";
	ajaxpagefetcher.load("addContent", page, true);
}

//------------------------- Bar Code ____________________________________________
function searchBarcodesByDATE(context, fromdate, todate) {
	if (fromdate == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Start Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (todate == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select To Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else {
		var page = context + "/barcodesBYFROMAndTODATE.action?fromdate="+ fromdate + "&todate=" + todate;
		ajaxpagefetcher.load("dTab", page, true);
	}
}
//------------------------- Bar Code ____________________________________________

// --------------------------- Duplicate Chk Function _______________________________________
function ChkDupItem() {
	var itemName = $('#iName').val();
	var bId = $('#itemBrandId').val();
	var iCode = $('#iCode').val();
	iCode=iCode.toUpperCase();
	itemName=itemName.toUpperCase();
	var page = "checkDupItem.action?itemName=" + itemName + "&bId=" + bId+ "&itemCode=" + iCode;
	document.getElementById("iCode").value=iCode;
	document.getElementById("iName").value=itemName;
	var pbutton = document.getElementById("pbutton");
	pbutton.style.display = 'none';
	ajaxpagefetcher.load("addItemBt", page, true);
}

/*function ChkDupItemCode() {
	var iCode = $('#iCode').val();
	var page = "checkDupItemCode.action?itemCode=" + iCode;
	var pbutton = document.getElementById("pbutton");
	pbutton.style.display = 'none';
	ajaxpagefetcher.load("addItemBt", page, true);
}*/


function ChkDupBrand() {
	var bName = $('#iBrandName').val();
	var page = "checkDupBrand.action?bName=" + bName;
	var pbutton = document.getElementById("pbutton");
	pbutton.style.display = 'none';
	ajaxpagefetcher.load("addItemBt", page, true);
}

function ChkDupSize() {
	var sName = $('#iSizeName').val();
	var page = "checkDupSize.action?sizeName=" + sName;
	var pbutton = document.getElementById("pbutton");
	pbutton.style.display = 'none';
	ajaxpagefetcher.load("addItemBt", page, true);
}

function ChkDupItemType() {
	var itemTypeName = $('#itemType').val();
	var page = "checkDupItemType.action?itemTypeName="+itemTypeName;
	var pbutton = document.getElementById("pbutton");
	pbutton.style.display = 'none';
	ajaxpagefetcher.load("addItemBt", page, true);
}
// --------------------------- Duplicate Chk Function _______________________________________

// ############################# Different Menu Related function End here ###################################################

// ############################# Different Validation function Start here ###################################################



function validateItemType() {
	var itemType = $('#itemType').val();
	// var Description = $('#Description').val();
	if (itemType == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Item Type Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	}
	return true;
}

function validateBrand() {
	var iBrandName = $('#iBrandName').val();
	if (iBrandName == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Brand Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	}
	return true;
}

function validateSize() {
	var iSizeName = $('#iSizeName').val();
	if (iSizeName == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Size! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	}
	return true;
}

function validateScheme() {
	var sName = $('#sName').val();
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var schemeQty = $('#schemeQty').val();

	var f = 0;
	var customerIds = document.getElementsByName("customerIds");
	for ( var i = 0; i < customerIds.length; i++) {
		if (customerIds[i].type == 'checkbox') {
			if (customerIds[i].checked) {
				f = 1;
				break;
			}
		}
	}

	var f1 = 0;
	var checkedId = document.getElementsByName("checkedId");
	for ( var i = 0; i < checkedId.length; i++) {
		if (checkedId[i].type == 'checkbox') {
			if (checkedId[i].checked) {
				f1 = 1;
				break;
			}
		}
	}

	if (sName == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Scheme Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Scheme";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (startDate == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Start Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Scheme";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (endDate == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select End  Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Scheme";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (schemeQty == 0) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Quantity! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Scheme";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (f == 0) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Atleast One Customer! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Scheme";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (f1 == 0) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Atleast One Item! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Scheme";
		document.getElementById("sub").disabled = false;
		return false;
	}
	return true;
}

function validateLocation() {
	var lName = $('#lName').val();
	var lDes = $('#lDes').val();
	var lAddr = $('#lAddr').val();
	var lPh = $('#lPh').val();
	var lMob = $('#lMob').val();
	var lPin = $('#lPin').val();
	var lState = $('#lState').val();
	var lFax = $('#lFax').val();
	// var lEmail = $('#lEmail').val();

	// var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

	if (lName == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (lDes == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Description! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (lAddr == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Address! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (lPh == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Phone! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (isNaN(lPh)) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Phone contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (lMob == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Mobile! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (isNaN(lMob)) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Mobile contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (lMob.length != 10) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please enter 10 digit mobile no. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (lPin == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Pin! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (isNaN(lPin)) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Pin No. contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (lState == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter State! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (lFax == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Fax No.! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (isNaN(lFax)) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Fax No. contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	}
	return true;
}

function validateSupplier() {
	var SUPPLIERNAME = $('#SUPPLIERNAME').val();
	var ADDRESS = $('#ADDRESS').val();
	var ContactPerson = $('#ContactPerson').val();
	var PHONE = $('#PHONE').val();
	var MOB = $('#MOB').val();
	var PIN = $('#PIN').val();
	var STATE = $('#STATE').val();
	var Fax = $('#Fax').val();
	// var EMAIL = $('#EMAIL').val();

	// var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

	/*if (SUPPLIERNAME == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (ADDRESS == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Address! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Address! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (ContactPerson == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Contact Person's Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Contact Person's Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (isNaN(PHONE)) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Phone No contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Phone No contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (MOB == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Mobile! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Mobile! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (isNaN(MOB)) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Mobile contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Mobile contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (MOB.length != 10) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please enter 10 digit mobile no. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please enter 10 digit mobile no. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (PIN == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Pin! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Pin! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (isNaN(PIN)) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Pin contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Pin contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (STATE == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter State! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter State!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (isNaN(Fax)) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>fax No. contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>fax No. contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	}*//*
		 * else if (!EMAIL.match(mailformat)) {
		 * document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>You
		 * have entered an invalid Email Address! <img src='img/validation.png'
		 * width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		 * return false; }
		 */
	return true;
}


function convertCapital(cName)
{
custName=cName.value;	
document.getElementById("cName").value=custName.toUpperCase(); 
}


 function convertCapitalItemId(iCode)
 {
	var itemIds=iCode.value;	
	document.getElementById("iCode").value=itemIds.toUpperCase();  
 }
 
function validateCustomer() {
	var cName = $('#cName').val();
	var ADDRESS = $('#ADDRESS').val();
	var PHONE = $('#PHONE').val();
	var MOB = $('#MOB').val();
	// var EMAIL = $('#EMAIL').val();
	var PIN = $('#PIN').val();
	var STATE = $('#STATE').val();

	// var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

	/*if (cName == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (ADDRESS == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Address! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Address! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (isNaN(PHONE)) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Phone No contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'Phone No contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (MOB == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Mobile! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Mobile! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (isNaN(MOB)) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Mobile contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Mobile contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (MOB.length != 10) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please enter 10 digit mobile no. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please enter 10 digit mobile no. <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	}*//*
		 * else if (!EMAIL.match(mailformat)) {
		 * document.getElementById("validation").innerHTML="<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>You
		 * have entered an invalid Email Address! <img src='img/validation.png'
		 * width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		 * return false; }
		 *//*else if (PIN == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Pin! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter Pin! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (isNaN(PIN)) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Pin contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Pin contanis illlegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (STATE == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter State! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation2").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter State! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	}*/
	return true;
}

function validateStock() {

	var purchaseDate = $('#purchaseDate').val();
	var supplierId = $('#supplierId').val();
	var bill = $('#bill').val();
	var challan = $('#challan').val();

	var stockSubTotal = $('#stockSubTotal').val();
	var lessUnit = $('#lessUnit').val();
	var discounts = $('#discounts').val();
	var vat = $('#vat').val();
	var cst = $('#cst').val();
	var waybill = $('#waybill').val();
	var lFreight = $('#lFreight').val();
	var stockGrandTotal = $('#stockGrandTotal').val();


	if (purchaseDate == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Purchse Date!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Purchse Date!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (supplierId == 0) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Add supplier details !!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Add supplier details !!<img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/> </p>";
		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (bill == 0 && challan == 0 || bill == "" && challan == "") {

		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter either Bill no. or Challan! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Enter either Bill no. or Challan! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (stockSubTotal == 0 || stockSubTotal == "") {

		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Purchase Details Required! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Purchase Details Required! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";

		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(vat) && vat != "") {

		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Vat Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Vat Scheme Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(cst) && cst!="") {

		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Cst Scheme Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Cst Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(lessUnit)) {

		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Unit Scheme Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Unit Scheme Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (lessUnit == "") {

		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Put 0 or Some Value for Unit Scheme! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Put 0 or Some Value for Unit Scheme! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(discounts)) {

		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Discounts Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Discounts Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (discounts == "") {

		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'> Please Put 0 or Some Value for Discounts! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Put 0 or Some Value for Discounts! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(lFreight)) {

		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Lorry Freight Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Lorry Freight Contains Illegal Characters! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (lFreight == "") {

		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Put 0 or Some Value for Lorry Freight! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Put 0 or Some Value for Lorry Freight! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	} else if (isNaN(stockGrandTotal) || stockGrandTotal == 0) {

		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Invalid Entry! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("validation1").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Invalid Entry! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		document.getElementById("sub").value = "Add Purchase";
		document.getElementById("sub").disabled = false;
		return false;
	}

	return true;
}
// ############################# Different Validation function End here
// ###################################################

function ValidateEmail(email) {
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if (email.match(mailformat)) {
		return true;
	} else {
		alert("You have entered an invalid email address!");
		return false;
	}
}
function ValidateMobNumber(fld, mobNo) {

	if (mobNo == "") {
		alert("You didn't enter a phone number.");
		fld.value = "";
		fld.focus();
		return false;
	} else if (isNaN(mobNo)) {
		alert("The phone number contains illegal characters.");
		fld.value = "";
		fld.focus();
		return false;
	} else if (mobNo.length != 10) {
		alert("The phone number is the wrong length. \nPlease enter 10 digit mobile no.");
		fld.value = "";
		fld.focus();
		return false;
	}
}

// ##########################################################################Scheme
// Calculation JS Configuration satart here#############################
function supplierComboCall(ctxPath) {
	var k = document.getElementById("supplierName").value;
	var page = ctxPath + "/supplierComboCall.action?supname=" + k;
	ajaxpagefetcher.load("k", page, true);
}
function refreshSupplierComboCall(ctxPath) {

	var k = "";
	document.getElementById("supplierName").value = k;
	var page = ctxPath + "/supplierComboCall.action?supname=" + k;
	ajaxpagefetcher.load("k", page, true);
}

function callSuppChange(ctxPath) {
	var k = "";
	document.getElementById("supplierName").value = k;
}

function setProduct(schemeName, context) {

	var page = context + "/callItemsBySchemeNames.action?schemename="
			+ schemeName;
	ajaxpagefetcher.load("schemeNameDIV", page, true);
}

function setCustomers(schemeName, context) {

	var page = context + "/callCustomersBySchemeNames.action?schemename="
			+ schemeName;
	ajaxpagefetcher.load("schemeNameDIV", page, true);
}

function delScheme(schemeId, context) {
	var page = context + "/calldelSchemeBySchemeNames.action?schemename="
			+ schemeId;
	ajaxpagefetcher.load("schemeNameDIV", page, true);
}

function toggle(source) {
	checkboxes = document.getElementsByName('checkedId');
	for ( var i = 0, n = checkboxes.length; i < n; i++) {
		checkboxes[i].checked = source.value;
	}
}

function searchSchemeByDATE(context, fromdate, todate) {
	if (fromdate == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Start Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (todate == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select To Date! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else {
		var page = context + "/SchemesBYFROMAndTODATE.action?fromDate="
				+ fromdate + "&toDate=" + todate;
		ajaxpagefetcher.load("dTab", page, true);
	}
}

function validateSchemeDel(context, val1, val2, schemename) {

	var page = context + "/schemeDelValidation.action?userName=" + val1
			+ "&password=" + val2 + "&schemename=" + schemename;
	ajaxpagefetcher.load("result", page, true);
}

function searchItems(context, val) {
	var page = context + "/callItemsByItemsName.action?itemsnames=" + val;
	ajaxpagefetcher.load("itemDisplay", page, true);
}

function searchCST(context, val) {
	var page = context + "/callCustomersByCustomerNames.action?customernames="
			+ val;
	ajaxpagefetcher.load("customerDisplay", page, true);
}

function searchCustomers(context, val) {
	var page = context + "/callCustomersByCustomerNames.action?customernames="
			+ val;
	ajaxpagefetcher.load("customerDisplay", page, true);
}

// ##########################################################################
// Scheme Calculation JS Configuration End here#############################

// ############################################################################
// D>N calculation Start here ############################################

function exceedQtyChk(updateItemTot, rqty, uQty, rit) {

	var chkval = 0;
	if (rqty.value == "") {
		rqty.value = 0;
	}
	if (updateItemTot.value < 0) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Item Quantity Exceeds Stock! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		// rqty.value=0;

		x = document.getElementById("returnSubTotal").value;
		rit1 = rit.value;
		rit.value = 0;
		newSubTot = parseFloat(x) - parseFloat(rit1);
		document.getElementById("returnSubTotal").value = newSubTot;

		returnGrandTot = newSubTot
				+ (newSubTot * parseFloat(document.getElementById("vat").value) / 100);
		document.getElementById("stockGrandTotal").value = returnGrandTot;

		rqty.value = 0;
		updateItemTot.value = 0;
		uQty.value = 0;

	}
	return false;
}

function calculateDebitNote(qty, rqty, itemtotal, incValue, buyrate) {
	var newt;
	var listsize;
	var updatedSubtotal = 0;
	var finalsubtot = 0;
	var returnGrandTot = 0;

	if (rqty == "") {
		document.getElementById("qty" + incValue).value = qty;
	}

	else {
		var netRTotal = parseFloat(buyrate) * parseFloat(rqty);
		document.getElementById("rItemtot" + incValue).value = netRTotal;
		newt = parseFloat(itemtotal)
				- parseFloat(document.getElementById("rItemtot" + incValue).value);
		document.getElementById("updateFinalTotal" + incValue).value = newt;
		document.getElementById("uQty" + incValue).value = parseInt(qty)
				- parseInt(rqty);
		listsize = document.getElementById("stockDTO").value;
		for ( var i = 0; i < listsize; i++) {
			updatedSubtotal = updatedSubtotal
					+ parseFloat(document.getElementsByName("returnItemtotal")[i].value);
			document.getElementById("returnSubTotal").value = updatedSubtotal;
			finalsubtot = parseFloat(document.getElementById("stockSubTotal").value)
					- parseFloat(updatedSubtotal);
			document.getElementById("upstockSubTotal").value = finalsubtot;
			taxamount = parseFloat(updatedSubtotal)
					* parseFloat(document.getElementById("vat").value) / 100;
			document.getElementById("taxamount").value = taxamount;
			returnGrandTot = parseFloat(updatedSubtotal)
					+ (parseFloat(updatedSubtotal)
							* parseFloat(document.getElementById("vat").value) / 100);
			document.getElementById("stockGrandTotal").value = returnGrandTot;
		}
	}
}

function calculateGrandTotForDebitNote() {
	var stockSubTotal = parseFloat(document.getElementById("upstockSubTotal").value);
	var lessUnit = parseFloat(document.getElementById("lessUnit").value);
	var discounts = parseFloat(document.getElementById("discounts").value);
	var vat = parseFloat(document.getElementById("vat").value);
	var lFreight = parseFloat(document.getElementById("lFreight").value);
	var vatAmount = vat / 100;
	var value1 = (stockSubTotal - (lessUnit + discounts));
	var value2 = value1 + (value1 * vatAmount);
	var gTot = value2 - lFreight;
	document.getElementById("stockGrandTotal").value = gTot;
}
// ############################################################################ D>N calculation End here ############################################

//############################################################### Barcode Related Scripts start here ##############################################################
function cloneImagebySelect(url,k,val)
{

	var strUser = val.value;
	var num=parseInt(strUser);
	for(var i=0;i<num;i++)
    {
    imageA = new Image();
    imageA.src = url;
    document.getElementById("content3").appendChild(imageA);
    }
}

function cloneImageofCustomer(context,val)
{
    var url=document.getElementById("tempCustBarcodeUrl").value;
    url=context+document.getElementById("tempCustBarcodeUrl").value;
	var strUser = val.value;
	var num=parseInt(strUser);
	for(var i=0;i<num;i++)
    {
    imageA = new Image();
    imageA.src = url;
    document.getElementById("content3").appendChild(imageA);
    }
}


function cloneImageofCustomer2(context,val,url)
{
    url=context+url;
	var strUser = val.value;
	var num=parseInt(strUser);
	for(var i=0;i<num;i++)
    {
    imageA = new Image();
    imageA.src = url;
    document.getElementById("content3").appendChild(imageA);
    }
}






function printDetailsForCsutomer() 
{
	
	var printContent = document.getElementById("content3");
    var windowUrl = 'about:blank';
    var uniqueName = new Date();
    var windowName = 'Print' + uniqueName.getTime();
    var printWindow = window.open(windowUrl, windowName, 'left=500,top=500,width=2000,height=1000,scrollbars=yes');
    printWindow.document.write(printContent.innerHTML);
    printWindow.print();
    
    printWindow.onbeforeunload = clearContent4();

//    location.reload();
   
    printWindow.document.getElementById('content3').style.display='block';
    printWindow.focus();
    printWindow.document.close();
    printWindow.close();
    return true;
}
function clearContent4()
{
	document.getElementById("content3").innerHTML="";
	document.getElementById("cloneCustBarcode").value="0";
}

function printDetails() 
{
	
	var printContent = document.getElementById("content3");
    var windowUrl = 'about:blank';
    var uniqueName = new Date();
    var windowName = 'Print' + uniqueName.getTime();
    var printWindow = window.open(windowUrl, windowName, 'left=500,top=500,width=2000,height=1000,scrollbars=yes');
    printWindow.document.write(printContent.innerHTML);
    printWindow.print();
    
    printWindow.onbeforeunload = clearContent3();
    var itemLength=document.getElementById("itemsLength").value;
  
    itemLength=parseInt(itemLength);
    for(var i=0;i<itemLength;i++)
	{
    	
    	document.getElementsByName("cloneImage")[i].value="0";
    	
	}
//    location.reload();
   
    printWindow.document.getElementById('content3').style.display='block';
    printWindow.focus();
    printWindow.document.close();
    printWindow.close();
    return true;
}
function clearContent3()
{
	
	document.getElementById("content3").innerHTML="";
	document.getElementById("bStartDate").value="";
	document.getElementById("bEndDate").value="";
	location.reload();
	
}
//############################################################### Barcode Related Scripts start here ##############################################################

function addValidate()
{
	
var dupchk=document.getElementById("dupChk").value;
alert("called");
return false;

}

function validateItem() {
	
	var iName = $('#iName').val();
	var itemTypeId = $('#itemTypeId').val();
	var itemBrandId = $('#itemBrandId').val();
	var itemUnit = $('#itemUnit').val();
    var dup=   $('#dupChk').val(); 
    var hsncode=   $('#hsncode').val()
	if (iName == "") {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Item Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (itemTypeId == 0) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Item Type! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	}  else if (itemBrandId == 0) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Brand Name! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} else if (itemUnit == 0) {
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Please Select Unit! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
	} 
	else if(dup == "1")
		{
		
		document.getElementById("validation").innerHTML = "<p style='color:red;margin:-11px 39px 9px 339px;font-size: 18px;font-weight: bold;'>Duplicate Item code found!!! <img src='img/validation.png' width='30px' height='30px' style='margin:-3px 47px -7px 7px'/></p>";
		return false;
		}
	else	
	{
		return true;
	}	
}