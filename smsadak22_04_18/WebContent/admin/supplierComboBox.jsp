<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/struts-tags"  prefix="s"%>
    <%@ page language="java" import="dTO.SupplierMasterDTO" %>
    <%@ page language="java" import="dTO.StockMasterDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


 <s:select  headerKey="0"  onchange="callSuppChange('<%=request.getContextPath()%>')"  headerValue="-Select Supplier-" list="supList" listKey="SupplierId" listValue="SUPPLIERNAME" cssStyle="margin:-15px 35px 1px 355px" name="stockDTO.supplierId" theme="simple" />