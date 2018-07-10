<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>
<html>


<head>
<title>GST Invoice</title>
</head>
<body>

<table style="font-family: arial, sans-serif;border-collapse: collapse;width:1080px;" align="center">

  <tr>
    <td style="padding:3px;" colspan="2" align="center">
	<h2> INVOICE : <%=request.getAttribute("bill")%></h2>

	</td>
  </tr>
    <tr>
    <td style="padding:3px;" align="left">
<br/><br/>
<b>1. GSTIN: </b> <%=request.getAttribute("gsttin")%><br/>
<b>2. TIN under value added Tax: </b> <%=request.getAttribute("comVat")%><br/>
<b>3. Name: </b> <%=request.getAttribute("companyName")%> <br/>
<b>4. Address: </b> <%=request.getAttribute("companyAddress")%><br/>
<b>5. Serial No. of Invoice : </b> <%=request.getAttribute("bill")%><br/>
<b>6. Date of Invoice : </b> <%=request.getAttribute("Doc")%> <br/>




	
	</td>
	

  </tr>
</table>

<table style="font-family: arial, sans-serif;border-collapse: collapse;width:1080px;" align="center">

  <tr>
    <td style="padding:3px;"align="left">
	<h3>Details of Receiver (Billed to)</h3>
	<p style="line-height:20px;">
	Name : <%=request.getAttribute("customerName")%><br/>
	Address : <%=request.getAttribute("customerAddress")%><br/>
	State : <%=request.getAttribute("customerState")%> <br/>
	State Code : <%=request.getAttribute("stcode")%><br/>
	GSTIN/Unique ID : <%=request.getAttribute("customergsttin")%><br/>
	</p>
	</td>
	    <td style="padding:3px;"align="left">
	<h3>Details of Consignee (Shipped to)</h3>
	<p style="line-height:20px;">
	Name :<br/>
	Address :<br/>
	State :<br/>
	State Code :<br/>
	GSTIN/Unique ID :<br/>
	</p>
	</td>
  </tr>

</table>

<br/><br/>
<table style="font-family: arial, sans-serif;border-collapse: collapse;width:1080px;" align="center" border="1">

  <tr style="border:1px solid #b3b3b3;text-align: left;background-color: #f3f3f3;">
    <th style="padding:5px;" align="center">Sr.No</th>
    <th align="center">Description <br/>
	of Goods</th>
    <th align="center">HSN</th>
    <th align="center">Size</th>
	<th align="center">Qty.</th>
	
	<th align="center">Unit</th>
	<th align="center">Rate <br/>
	(per item)</th>
	<th align="center">Total</th>
	<th align="center">Discount</th>
	<th align="center">
	Taxable <br/>
	value
	</th>
	<th align="center" colspan="2" >CGST</th>
	<th align="center" colspan="2">SGST</th>
	<th align="center" colspan="2">IGST</th>
  </tr>
  
  <tr style="border: 1px solid #b3b3b3;text-align:left;background-color: #f3f3f3;">
    <td style="padding:8px;" align="center" colspan="10">&nbsp;&nbsp;</td>
	<td align="center" ><b>Rate</b></td>
	<td align="center"><b>Amt.</b></td>
	<td align="center" ><b>Rate</b></td>
	<td align="center"><b>Amt.</b></td>
	<td align="center"><b>Rate</b></td>
	<td align="center"><b>Amt.</b></td>
  </tr>
  
  
  
  
  	<s:if test="%{saleList.size>0}">
							<% int k = 1; %>
							<s:iterator value="saleList">
  <tr style="border:1px solid #b3b3b3;text-align: left;">
    <th style="padding:3px; font-size: 12px" align="center"><%=k %></th>
    <th align="center" style="padding:3px; font-size: 12px"><s:property value="itemName" /></th>
    <th align="center" style="padding:3px; font-size: 12px"><s:property value="hsncode" /></th>
    <th align="center" style="padding:3px; font-size: 12px"><s:property value="itemSizeName" /></th>
	<th align="center" style="padding:3px; font-size: 12px"><s:property value="Qty" /></th>
	
	<th align="center" style="padding:3px; font-size: 12px">PCS</th>
	<th align="center" style="padding:3px; font-size: 12px"><s:property value="buyRate" /> <br/>
	</th>
	<th align="center" style="padding:3px; font-size: 12px"><s:property value="basetotal" /></th>
	<th align="center" style="padding:3px; font-size: 12px"><s:property value="sdiscount2" />(<s:property value="sdiscountamt" />)</th>
	<th align="center" style="padding:3px; font-size: 12px">
	<s:property value="gstrate" />% (<s:property value="gstamt" />)
	
	</th>
	<th align="center"  style="padding:3px; font-size: 12px"><s:property value="cgstrate" />%</th>
	<th align="center" style="padding:3px; font-size: 12px"  ><s:property value="cgstamt" /></th>
	<th align="center" style="padding:3px; font-size: 12px"><s:property value="sgstrate"/>%</th>
	<th align="center"  style="padding:3px; font-size: 12px"><s:property value="sgstamt" /></th>
	<th align="center" style="padding:3px; font-size: 12px" >0</th>
	<th align="center"  style="padding:3px; font-size: 12px">0</th>
  </tr>
  
				<% k++; %>
							</s:iterator>
							</s:if>
  
  
  
  
    <tr style="border: 1px solid #b3b3b3;text-align:left;">
    <td style="padding:8px;height:140px;" align="center"></td>
    <td align="left" colspan="6" style="padding-top:200px;">
	
<table style="font-family: arial, sans-serif;border-top: 1px solid #666;" width="100%">

 <tr>
    <td style="padding:2px;"><b>Tot QTY</b> : <%=request.getAttribute("totqty") %></td>

  </tr>
  <tr>
    <td style="padding:2px;"><b>Freight</b></td>

  </tr>
  <tr>
    <td style="padding:2px;"><b>Insurance</b></td>

  </tr>
  <tr>
    <td style="padding:2px;"><b>Packing and Forwarding Charges</b></td>

  </tr>


</table>

	</td>
	<td align="center">&nbsp;&nbsp;</td>
	<td align="center">&nbsp;&nbsp;</td>
	<td align="center">&nbsp;&nbsp;</td>
	<td align="center">&nbsp;&nbsp;</td>
	<td align="center">&nbsp;&nbsp;</td>
	<td align="center" >&nbsp;&nbsp;</td>
	<td align="center">&nbsp;&nbsp;</td>
	<td align="center">&nbsp;&nbsp;</td>
	<td align="center">&nbsp;&nbsp;</td>
  </tr>
  
  
    <tr style="border: 1px solid #b3b3b3;text-align:left;">
    <td style="padding:8px;" align="center">&nbsp;&nbsp;</td>
	<td align="center" colspan="6">
	<table style="font-family: arial, sans-serif;" width="100%">
		<tr>
		<td style="padding:5px;"><b>Total</b></td>

		</tr>
	</table>
	
	</td>
		<td align="center"><%=request.getAttribute("totalbaseamount") %></td>
	<td align="center"><%=request.getAttribute("totaldiscountamt") %>  </td>
	<td align="center"><%=request.getAttribute("totagstrate") %>% (<%=request.getAttribute("totagstAmt") %>)</td>
	<td align="center" colspan=2><%=request.getAttribute("cgstrate") %>%(<%=request.getAttribute("totcgstamt") %>)</td>
	<td align="center" colspan=2><%=request.getAttribute("sgstrate") %>%(<%=request.getAttribute("totsgstamt") %>)</td>
	
	<td align="center" colspan=2>0</td>
	
  </tr>
  
      <tr style="border: 1px solid #b3b3b3;text-align:left;">
    <td style="padding:8px;" align="center">&nbsp;&nbsp;</td>
	<td align="left" colspan="8">
	<p><b>Total Invoice Value (In figure)</b></p>
	<p><b>Total Invoice Value (In Words)</b></p>
	<p><b>Amount of Tax subject to Reverse Charges</b></p>
	<p><b>Round </b></p>
	
	</td>
	<td align="center" colspan="8">
	
<table style="font-family: arial, sans-serif;border-collapse: collapse;width:98%;" align="center" border="1">

    <tr>
    <td style="padding:8px;" colspan="4"><%=request.getAttribute("gTot")%></td>
  </tr>
  <tr>
    <td style="padding:8px;"><%=request.getAttribute("gTotRoundValue")%></td>

	

  </tr>

  
   <tr>
    <td style="padding:8px;">0.0</td>

	

  </tr>
  <tr>
    <td style="padding:8px;"><%=request.getAttribute("rval")%></td>

	

  </tr>

</table>	
	

	
	</td>
  </tr>
  

  

</table>

<table style="font-family: arial, sans-serif;border-collapse: collapse;width:1024px;" align="center">


  <tr>
    <td style="padding:3px;" colspan="2" >

<b>Declaration :</b><br/>
<br/>
<b>Signatory :</b><br/><br/>
<b>Electronic Reference Number :</b><br/><br/>
	
	</td>
	
	    <td style="padding:10px;" colspan="2" >

<b>Signature :</b><br/><br/>
<b>Name of the :</b><br/><br/>
<b>Designation / Status</b><br/><br/>
<b>Date -</b><br/><br/>





	
	</td>

  </tr>


</table>
<br/><br/>
</body>
</html>

