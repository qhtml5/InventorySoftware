<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dTO.SchemeMasterDto" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<table id="example1" class="table table-hover">
										<thead>
											<tr>
												<td><b>SCHEME NAME</b></td>
												<td><b>DATE OF CREATION</b></td>
												<td><b>START DATE</b></td>
												<td><b>END DATE</b></td>
												<td><b>SCHEME QTY</b></td>

												<td><b>MADE BY</b></td>
												<td><b>VIEW PRODUCTS</b></td>
												<td><b>VIEW CUATOMERS</b></td>
												<td><b>DELETE SCHEME</b></td>
											</tr>
										</thead>
										<tbody>
											<s:if test="%{schemeList.size>0}">
												<s:iterator value="schemeList">
													<tr>
														<td><s:property value="schemeName" /></td>
														<td><s:property value="schemeDoc" /></td>
														<td><s:property value="schemeSdate" /></td>
														<td><s:property value="schemeEdate" /></td>
														<td><s:property value="schemeQty" /></td>

														<td><s:property value="userName" /></td>

														<td>
															
																<img src="<%=request.getContextPath()%>/img/products.png" width="45px" height="45px" onclick="setProduct('<s:property value="schemeName"/>','<%=request.getContextPath()%>'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'" style="cursor: pointer;"/>

														</td>
														
														<td>
															
																<img src="<%=request.getContextPath()%>/img/customers.png" width="45px" height="45px" onclick="setCustomers('<s:property value="schemeName"/>','<%=request.getContextPath()%>'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'" style="cursor: pointer;"/>

														</td>
														
														<td>
															
																<img src="<%=request.getContextPath()%>/img/deleteStock.png" width="45px" height="45px" onclick="delScheme('<s:property value="schemeId"/>','<%=request.getContextPath()%>'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'" style="cursor: pointer;"/>

														</td>
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