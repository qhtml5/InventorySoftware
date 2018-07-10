<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.ItemCategoryTypeMasterDTO"%>
<section class="content-header">
	<h1>
		Item Category <small> Create your Item Category <img src="img/products.png" height="60px" width="60px" style="margin: -14px -22px -21px 0px"/></small>

	</h1>
	<ol class="breadcrumb">
		<li><i class="fa fa-dashboard"></i><a href="adminIndexCall.action">HOME</a></li>
		<li class="active">CATEGORY ADD/VIEW</li>
	</ol>
</section>
<section onmouseover="called();" class="content">
<div id="validation"></div>
	<div class="row">
		<!-- left column -->
		<div class="col-md-6">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">Create Item Type :</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				
				<s:form action="saveItemType.action" method="post">
					<div class="box-body">
					
						<div class="form-group">
							<label for="ItemTypeName">Item Type Name:</label>
							<s:textfield cssClass="form-control" name="idto.itemType" theme="simple" id="itemType" onkeyup="ChkDupItemType();" />
						</div>
						<div class="form-group">
							<label for="Description">Description</label>
							<s:textarea cssClass="form-control" name="idto.ItemTypeDescription" theme="simple"  id="Description" cols="7" rows="12"></s:textarea>
						</div>

					</div>
					<!-- /.box-body -->

					<div id="addItemBt">
						<s:submit align="center" value="Add" cssClass="btn btn-primary" id="pbutton" onclick="return validateItemType();" />
					</div>
				</s:form>
			</div>

		</div>
		<div class="col-md-6">
			<div class="RightTable">
				<div class="box-header">
					<h3 class="box-title">View or Edit item category types</h3>
				</div>
				<br/>
				<table id="example1" class="table table-hover">
					<thead>
						<tr>
							<td><b>ITEM TYPE</b></td>
							<td><b>DATE OF CREATION</b></td>
							<td><b>VIEW/EDIT</b></td>
						</tr>
					</thead>
					<tbody>
						<s:if test="iCateoryList.size>0">
							<s:iterator value="iCateoryList">
								<tr>
									<td><s:property value="itemType" /></td>
									<td><s:property value="typeDateofcreation" /></td>
									<td>
										<button class="btnAdd"
											onclick="editItemCategoryCall('<s:property value="itemTypeID"/> ','<%=request.getContextPath()%>');">Show
											Details</button>
									</td>
								</tr>
							</s:iterator>
						</s:if>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br /> <br /> <br />
</section>