<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="dTO.SchemeMasterDto" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="../upp.jsp"%>
</head>
<body>
<table class="table table-hover">
											<thead>
												<tr>
													<td><input type="button" id="checked" class="buttonType3" value="Select all" onclick="checkAll(),history.go(0)"/>
													<input type="button" class="buttonType3" id="Unchecked" value="De Select all" onclick="uncheck(),history.go(0)"/> </td>
													<td><b>ITEM NAME</b></td>
												</tr>
											</thead>
											<tbody>
												<s:if test="%{itemList.size>0}">
													<s:iterator value="itemList">
														<tr>
															<td>
																<input type="checkbox"  name="checkedId" id="checkedId" value="<s:property value="itemId"/>" />
															</td>
															<td><s:property value="itemName" /></td>
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