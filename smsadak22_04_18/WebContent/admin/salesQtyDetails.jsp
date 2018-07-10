
<%@ page import="dTO.SalesMasterDto"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<html>
<body>
<div>
	Rate:
	<s:textfield id="1" name="saleDto.buyRate" 
		cssClass="textboxStockRateQuantityTotal" size="4"
		theme="simple" />
	<s:hidden id="maxQty" name="saleDto.qty"/>
	<s:hidden id="stockId" name="saleDto.stockId"/>
	<s:hidden id="itemSizeName" name="saleDto.itemSizeName"/>
	Qty:
	<s:textfield id="3" onkeyup="mulSaleqty(1,3,maxQty,stockId);" name="saleDto.Qty" onfocus="clearZero(this)" value="0"
		cssClass="textboxStockRateQuantityTotal" size="4" /> 
		
	Total:
	<s:textfield id="salesTot" name="saleDto.itemtotal" onblur=""
		cssClass="textboxStockRateQuantityTotal"
		onkeydown=""  onkeyup="disableFunction()"
		readonly="true" disabled="true" value="0" size="4" theme="simple" />
<button type="button" style="float: right; margin: 3px 31px 0px 0px" onclick="addSalesRow(this.form);">Add</button>
</div>
</body>
</html>