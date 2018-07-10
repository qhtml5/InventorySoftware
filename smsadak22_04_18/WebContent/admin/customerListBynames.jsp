<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%@ page language="java" import="dTO.CustomerMasterDTO" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<table id="example1" class="table table-hover">
											<thead>
												<tr>
													<td>
														<input type="button" id="checkedCus" class="buttonType3" value="Select all" onclick="checkAllCustomer(),history.go(0)"/>
														<input type="button" class="buttonType3" id="UncheckedCus" value="De Select all" onclick="uncheckCustomer(),history.go(0)"/>
													</td>
													<td><b>CUSTOMER NAME</b></td>
												</tr>
											</thead>
											<tbody>
												<s:if test="%{customerList.size>0}">
													<s:iterator value="customerList">
														<tr>
															<td> 
															<%-- 	<s:checkbox  name="schemeDto.customerIds" cssClass="buttonType3" theme="simple" value="<s:property value='customerId'/>" /> --%>
																<input type="checkbox"  name="customerIds" id="customerIds" class="buttonType3" value="<s:property value='customerId'/>" />
															</td>
															<td><s:property value="cName" /></td>
														</tr>
													</s:iterator>
												</s:if>
												<s:else>
													<tr>
														<td colspan="3"
															style="text-align: center; color: red; font-size: 20px;">Sorry!
															No Content Available.</td>
													</tr>
												</s:else>
											</tbody>
										</table>


</body>
</html>