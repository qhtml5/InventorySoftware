<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/struts-tags"  prefix="s"%>
    <%@ page language="java" import="dTO.SupplierMasterDTO" %>
    <%@ page language="java" import="dTO.StockMasterDTO" %>
    <%@ page language="java" import="util.EligibleCustomerNames" %>
    <%@ page language="java" import="dTO.SchemeMasterDto" %>
    
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


 <s:select  headerKey="0"  onchange="fetchEligibleProducts(this,document.getElementById('schemeName'),document.getElementById('sdate'),document.getElementById('edate'))"  headerValue="-Select Eligible Customer-" list="eList" listKey="customerNames" listValue="customerNames" name="stockDTO.supplier_id" theme="simple" />
 <s:hidden name="schemeDto.schemeSdate" id="sdate" />
 <s:hidden name="schemeDto.schemeEdate" id="edate" />
 <s:hidden name="schemeDto.schemeName" id="schemeName"/>
 