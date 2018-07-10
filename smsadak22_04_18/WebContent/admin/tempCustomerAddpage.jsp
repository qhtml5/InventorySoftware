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
                                 
                                        <label for="customerSearch">Customer Name:</label>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="saleDto.tempCustName" id="otcName" onfocus="clearZero(this)" cssClass="textboxStockloc" onkeyup="otcDivValidation()" theme="simple" /><br/>
										<label for="customerSearch">Mobile:</label>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="saleDto.temCustMobileNo" id="otcMobile" onfocus="clearZero(this)" cssClass="textboxStockloc" onkeyup="otcDivValidation()" theme="simple" /><br/>
										<label for="customerSearch">Address:</label>
										<s:textarea name="saleDto.tempCustAddress" id="otcAddr" cols="50" rows="0"  onkeyup="otcDivValidation()" theme="simple" /> <input type="button" onclick="submitTempDetails(document.getElementById('otcName'),document.getElementById('otcMobile'),document.getElementById('otcAddr'))" value="submit" /> 

</body>
</html>