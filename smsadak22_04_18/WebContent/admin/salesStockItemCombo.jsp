
<%@ page import="dTO.SalesMasterDto"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<html>
<head>

<style type="text/css">
table.st {
	width: 100%;
}

table.st tr {
	
}

table.st tr td {
	width: 6%;
}

.bclass {
	width: 60px;
	background-color: rgba(145, 249, 165, 0.47);
}
</style>


</head>
<body>
	
	<input type="hidden" id="listSize" value="<%=request.getAttribute("sListSize")%>">

<marquee scrollamount="2"> <b style="font-style: italic; color:  #839192 ; font-weight: bold;">GST rate for rate per item is calculated according to goverment gst invoice format.  if one sold goods to the consumer in West Bengal worth Rs. 10,000. The GST rate is 18% comprising of CGST rate of 9% and SGST rate of 9%, in such case the dealer collects Rs. 1800 and Rs. 900 will go to the central government and Rs. 900 will go to the State government. </b></marquee>
<br/>
<br/>
	<div style="overflow: auto; height: 210px">
		<table class="st">
		
			<tr>
		<td>
		<b >Item Names</b></td>
		<td><b >HSN code</b></td>
		<td><b >Item Size</b></td>
		<td><b >Available Qty</b></td>
		<td><b >Sale Qty</b></td>
		<td><b >MRP</b></td>
		<td><b >Base total</b></td>
	    <td><b >Discount</b></td>
	     
	    <td><b >Disc AMT</b></td>
		<td style="font-weight: bold; color: blue;"><b >GST Rate</b></td>
		<td style="font-weight: bold; color: blue;"><b >GST Amt</b></td>
		<td><b >Total</b></td>
		<td style="font-weight: bold; color: blue;"><b >CGST RATE</b></td>
		<td style="font-weight: bold; color: blue;"><b >CGST AMT</b></td>
		<td style="font-weight: bold; color: blue;"><b >SGST RATE</b></td>
		<td style="font-weight: bold; color: blue;"><b >SGST AMT</b></td>
		<td style="font-weight: bold; color: blue;"><b >IGST RATE</b></td>
		<td style="font-weight: bold; color: blue;"><b >IGST AMT</b></td>
		
		
		
		</tr>
		
			<%
				int k = 0;
			%>
			<s:iterator value="saleList">
				<tr>
					<td align="center">
						<s:property value="itemName" />
						<input type="hidden" id="itemId<%=k%>" name="itemId[]"
							value="<s:property value='itemId'/>">
						<input type="hidden" id="itemName<%=k%>" name="itemName[]"
							value="<s:property value='itemName'/>">
						<input type="hidden" id="maxQty<%=k%>" name="maxQty[]"
							value="<s:property value='qty'/>">
						<input type="hidden" id="brate<%=k%>" name="brate[]"
							value="<s:property value='buyRate'/>">
						<input type="hidden" id="itemSizeName<%=k%>" name="itemSizeName[]"
							value="<s:property value='itemSizeName'/>">
					</td>
						<td align="center" >
						<s:property value="hsncode" />
						
							<input type="hidden" id="itemId<%=k%>" name="hsncode" value="<s:property value="hsncode" />"/>
							
						
						
					</td>
					<td align="center" >
						<s:property value="itemSizeName" />
					</td>
				
					<td align="center">
						<s:property value="qty" />
						<%-- <select class="bclass">
							<option></option>
							<option>
								<s:property value="buyRate" />
							</option>
						</select>--%>
					</td>
					
					<td align="center">
						<input type="text" id="saleQty<%=k%>" size="3"
						onkeyup="mulSaleqty(document.getElementById('saleRate<%=k%>'),document.getElementById('saleQty<%=k%>'),document.getElementById('maxQty<%=k%>'),document.getElementById('salesTot<%=k%>'),'<%=k %>');"
						name="saleQty[]" cssClass="textboxStockRateQuantityTotal"
						onfocus="clearZero(this)" value="0" />
					</td>
                     <td align="center">
					
						<input type="text" id="saleRate<%=k%>"
						value='0' size="3" name="saleRate[]" onfocus="clearZero(this)"
						onkeyup="mulSaleqty(document.getElementById('saleRate<%=k%>'),document.getElementById('saleQty<%=k%>'),document.getElementById('maxQty<%=k%>'),document.getElementById('salesTot<%=k%>'),'<%=k %>');"
						cssClass="textboxStockRateQuantityTotal"  />
						<br/>(<s:property value="buyRate" />)
					</td>
					
					
						      <td align="center">
					
						<input type="text" name="basetotal" id="basetotal<%=k%>"
						value='0' size="3" onfocus="clearZero(this)"
						onkeyup="mulSaleqty(document.getElementById('saleRate<%=k%>'),document.getElementById('saleQty<%=k%>'),document.getElementById('maxQty<%=k%>'),document.getElementById('salesTot<%=k%>'),'<%=k %>');"
						cssClass="textboxStockRateQuantityTotal"  />
					</td>
					
					
					  <td align="center">
					
							
							<select name="discount2" id="discount2<%=k %>" onchange="mulSaleqty(document.getElementById('saleRate<%=k%>'),document.getElementById('saleQty<%=k%>'),document.getElementById('maxQty<%=k%>'),document.getElementById('salesTot<%=k%>'),'<%=k %>');">
													<option value="0">--Discount--</option>
												    <option value="5">5%</option>
													<option value="10">10%</option>
													<option value="15">15%</option>
													<option value="20">20%</option>
													<option value="25">25%</option>
													<option value="30">30%</option>
													<option value="35">35%</option>
													<option value="40">40%</option>
													<option value="45">45%</option>
													<option value="50">50%</option>
													<option value="55">55%</option>
													<option value="60">60%</option>
													
												</select>
												<input type="text" onkeyup="mulSaleqty(document.getElementById('saleRate<%=k%>'),document.getElementById('saleQty<%=k%>'),document.getElementById('maxQty<%=k%>'),document.getElementById('salesTot<%=k%>'),'<%=k %>');"
						style="color:blue;font-weight: bold; " name="discount1" size="2" onfocus="clearZero(this)"  id="discount1<%=k %>" value="0"/>
					</td>
					
					
					      <td align="center">
					
						<input type="text" id="discamt<%=k%>"
						value='0' size="3" name="discamt" onfocus="clearZero(this)"
						onkeyup="mulSaleqty(document.getElementById('saleRate<%=k%>'),document.getElementById('saleQty<%=k%>'),document.getElementById('maxQty<%=k%>'),document.getElementById('salesTot<%=k%>'),'<%=k %>');"
						cssClass="textboxStockRateQuantityTotal"  />
					</td>
					
					
					
					     <td align="center">
					
<%-- 					<input type="text" onkeyup="mulSaleqty(document.getElementById('saleRate<%=k%>'),document.getElementById('saleQty<%=k%>'),document.getElementById('maxQty<%=k%>'),document.getElementById('salesTot<%=k%>'),'<%=k %>');" --%>
<%-- 						style="color:blue;font-weight: bold; " name="rateperitem" size="2" onfocus="clearZero(this)"  id="rateperitem<%=k %>" value="0"/> --%>
						
						<select name="rateperitem" id="rateperitem<%=k %>" onchange="mulSaleqty(document.getElementById('saleRate<%=k%>'),document.getElementById('saleQty<%=k%>'),document.getElementById('maxQty<%=k%>'),document.getElementById('salesTot<%=k%>'),'<%=k %>');">
													<option value="0">--GST Rate--</option>
												    <option value="5">5%</option>
													<option value="18">18%</option>
													<option value="28">28%</option>
											
													
												</select>
						
						
					</td>
					
					  <td align="center">
					
					<input type="text" onkeyup="mulSaleqty(document.getElementById('saleRate<%=k%>'),document.getElementById('saleQty<%=k%>'),document.getElementById('maxQty<%=k%>'),document.getElementById('salesTot<%=k%>'),'<%=k %>');"
						 style="color:blue;font-weight: bold; " name="rateperitemamt" size="2" onfocus="clearZero(this)"  id="rateperitemamt<%=k %>" value="0"/>
					</td>
					<td align="center">
						<input type="text" id="salesTot<%=k%>"
						size="14" name="salesTot[]" onblur="" onkeydown=""
						cssClass="textboxStockRateQuantityTotal"
						onkeyup="disableFunction()" readonly="readonly"
						disabled="disabled" value="0" />
					</td>
					<td>
					<input type="text" style="color:blue;font-weight: bold; "  name="cgstrate" size="5" readonly="readonly" id="cgstrate<%=k %>" value="0"/>
					</td>
					<td>
					<input type="text" style="color:blue;font-weight: bold; "  name="cgstamt" size="5" readonly="readonly" id="cgstamt<%=k %>" value="0"/>
					</td>
					<td>
					<input type="text" style="color:blue;font-weight: bold; "  name="sgstrate" size="5" readonly="readonly" id="sgstrate<%=k %>" value="0"/>
					</td>
					<td>
					<input type="text" style="color:blue;font-weight: bold; "  name="sgstamt" size="5" readonly="readonly" id="sgstamt<%=k %>" value="0"/>
					</td>
					<td>
					<input type="text" style="color:blue;font-weight: bold; "  name="igstrate" size="5" readonly="readonly" id="igstrate<%=k %>" value="0"/>
					</td>
					<td>
					<input type="text" style="color:blue;font-weight: bold; "  name="igstamt" size="5" readonly="readonly" id="igstamt<%=k %>" value="0"/>
					</td>
					
				</tr>
				<tr>
				<td colspan=20><hr/></td></tr>
				<input type="hidden" value="<%=k++%>" />
			</s:iterator>
			</tbody>
			
				

		
		</table>

	</div>

	<button type="button"
		style="float: right; margin: 14px 446px 6px 4px; background-color: rgba(145, 249, 165, 0.47); border: thin; font: bold; font-size: 19px; cursor: pointer;"
		onclick="addSalesRow(this.form);">Add</button>
</body>
</html>