<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ taglib uri="/struts-tags" prefix="s"%>
<%@  taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" import="dTO.SalesMasterDto"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<s:select cssStyle="cursor: pointer;" headerKey="0"
											onchange="getSupplierPayBill(this.value)"
											headerValue="-Select Supplier-" list="sdolist"
											listKey="supplierId" listValue="SUPPLIERNAME"
											name="stockDto.supplierId" id="SupplierId" theme="simple" />