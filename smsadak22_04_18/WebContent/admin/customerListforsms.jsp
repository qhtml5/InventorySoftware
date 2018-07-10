<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
    <%@ page import="dTO.CustomerMasterDTO" language="java"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<s:form action="custsmssend.action" method="post">
<table id="example1" class="table table-hover">
					<thead>
						<tr>
						<th><b>Select</b></th>
							<th><b>NAME</b></th>
							<th><b>MOBILE NO</b></th>
							<th><b>ADDRESS</b></th>
						
						</tr>
					</thead>
					<tbody>
						<%
							int k = 0;
						%>
						<s:if test="clist.size>0">
							<s:iterator value="clist" id="c">
								<tr>
								     <td><input type="checkbox" name="mobile" value="<s:property value="mobile" />"/></td>
									<td><s:property value="cName" /></td>
									<td><s:property value="mobile" /></td>
									<td><s:property value="address" /></td>
								
								</tr>
							</s:iterator>
						</s:if>
					</tbody>
				</table>
				
				<br/>
				
				<div style="margin:12px 56px 67px 191px">
				
				<textarea name="message" rows="5" cols="90"></textarea>
				<br/>
				<br/>
				
				<input type="hidden" id="remainsms" name="remainsms" value="<%=request.getAttribute("smsremain") %>" readonly="readonly" />
				<input cssClass="btn btn-primary" type="submit" value="Send SMS"/>
				
				</div>
				</s:form>