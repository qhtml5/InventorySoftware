<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
    <%@ page language="java" import="dTO.SalesMasterDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
        <s:hidden name="saleDto.tempCustBarcodeUrl" id="tempCustBarcodeUrl"/>  <s:hidden name="saleDto.regcustomerId"  id="customerIds"/>  
        <label for="customerSearch">Customer Name:</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="saleDto.tempCustName" id="otcName" onfocus="clearZero(this)" cssClass="textboxStockloc" onkeyup="otcDivValidation()" theme="simple" /><br/>
		<label for="customerSearch">Mobile:</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="saleDto.temCustMobileNo" id="otcMobile" onfocus="clearZero(this)" cssClass="textboxStockloc" onkeyup="otcDivValidation()" theme="simple" /> &nbsp; Total sale amount to customer :<b><%=request.getAttribute("totalSellAmount") %></b> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<s:if test="#request.totalSellAmount>'0.0'">
		<a href="#" onclick="getTempCusBuyDetails(); document.getElementById('schDIV3').style.display='block'; document.getElementById('fade1').style.display='block'">View Details</a><img src="<%=request.getContextPath()%>/img/viewDetails.png"width="32px" height="23px" style=" margin: -24px 28px 6px 614px;cursor: pointer;" onclick="printDetailsForCsutomer()" />
		</s:if>
		
		<br/>
		<label for="customerSearch">Address:</label>
		<s:textarea name="saleDto.tempCustAddress" id="otcAddr" cols="50" rows="0"  onkeyup="otcDivValidation()" theme="simple" /> 
		<div style="margin:-44px 39px 31px 435px;" >Number of prints : <input type="text" name="cloneImage" id="cloneCustBarcode" onkeyup="cloneImageofCustomer('<%=request.getContextPath()%>',this);" value="0" size="2" onfocus="clearZero(this)" />
		<img src="<%=request.getContextPath()%>/img/printing.png"width="45px" height="45px" style="margin: -33px 28px -12px 166px; cursor: pointer;" onclick="printDetailsForCsutomer()" />
		</div>
    <div id="content3" style="display:none"></div>
</body>
</html>