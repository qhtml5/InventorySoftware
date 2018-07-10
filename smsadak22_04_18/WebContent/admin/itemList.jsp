<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.ItemCategoryTypeMasterDTO"%>

<section class="content-header">
	<h1>
		Item Master <small> Create your Items</small>

	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">ITEM MASTER</a></li>
		<li class="active">ITEM MASTER FORM</li>
	</ol>
</section>
<section class="content">

	<div class="row">
		<div class="col-md-6">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">Create Item Type :</h3>
				</div>
				<table class="CSSTableGenerator">
					<tr>
						<td><b>ITEM NAME</b></td>
						<td><b>DATE OF CREATION</b></td>
						<td><b>VIEW</b></td>
					</tr>

					<s:if test="%{itemList.size>0}">
						<s:iterator value="itemList">
							<tr>
								<td><b><s:property value="itemName" /></b></td>
								<td><b><s:property value="itemDateofcreation" /></b></td>
								<td><button onclick="editItemsCall('<s:property value="itemId" />','<%=request.getContextPath()%>')">View & Edit</button></td>
							</tr>
						</s:iterator>
					</s:if>
					<s:else>
						<tr>
							<td colspan="3" style="text-align: center; color: red; font-size: 20px;">Sorry! No Content Available.</td>
						</tr>
					</s:else>
				</table>
			</div>
		</div>
	</div>
	<br /> <br /> <br />
</section>
