<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.ItemCategoryTypeMasterDTO" language="java"%>
<%@ page import="dTO.SupplierMasterDTO" language="java"%>
<section class="content-header">
	<h1>
		Item Master <small> Create your Items <img src="img/products.png" height="60px" width="60px" style="margin: -14px -22px -21px 0px"/></small>

	</h1>
	<ol class="breadcrumb">
		<li><i class="fa fa-dashboard"></i><a href="adminIndexCall.action">Home</a></li>
		<li class="active">ITEM MASTER FORM</li>
	</ol>
</section>
<section class="content" onmouseover="called()">
<div id="validation"></div>
	<div class="row">
		<!-- left column -->
		<div class="col-md-6">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">Enter Items Details :</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<s:form action="/addItem.action" method="post">
					<div class="box-body">
						<%-- <div class="form-group">
							<label for="exampleInputEmail1">Generate Item Code:</label>
							<br/>
								<s:textfield cssClass="textboxStockloc" theme="simple"  
								name="idto.itemId" onkeyup="convertCapitalItemId(document.getElementById('iCode'))" id="iCode" /> MRP <s:textfield cssClass="textboxStockloc" theme="simple" name="idto.itemMrp" id="itemMrp" />
						</div>--%>
						

						<div class="form-group">
							<label for="exampleInputEmail1">Item Name:</label>
							<s:textfield cssClass="form-control" theme="simple"  
								name="idto.itemName" id="iName" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Item type</label>
							<s:select id="itemTypeId" theme="simple" cssClass="form-control"
								name="idto.itemTypeID" list="iCateoryList" listKey="itemTypeID"
								listValue="itemType" headerKey="0" headerValue="Select One" />
						</div>
						<%-- <div class="form-group">
							<label for="exampleInputPassword1">Size:</label>
							<s:select id="supplierId" theme="simple" cssClass="form-control"
								name="idto.itemSizeId" list="sizeList" listKey="itemSizeId"
								listValue="itemSizeName" headerKey="0" headerValue="Select One" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Supplier:</label>
							<s:select id="supplierId" theme="simple" cssClass="form-control"
								name="idto.supplierId" list="sDTOList" listKey="SupplierId"
								listValue="SUPPLIERNAME" headerKey="0" headerValue="Select One" />
						</div> --%>
						<div class="form-group">
							<label for="exampleInputPassword1">Brand</label>
							<s:select id="itemBrandId" theme="simple" cssClass="form-control"
								name="idto.itemBrandId" list="brandList" listKey="itemBrandId"
								listValue="itemBrandName" headerKey="0" headerValue="Select One"  />
							
						</div>
						
						<div class="form-group">
							<label for="exampleInputPassword1">Units:</label>
							<select
								id="itemUnit" class="form-control" name="idto.itemUnit">
								<option value="0">Select One</option>
								<option value="PCS">PCS</option>
								<option value="DOZZEN">DOZZEN</option>
							</select>
						
					</div>
					
						<div class="form-group">
							<label for="exampleInputEmail1">HSN CODE:</label>
							<s:textfield cssClass="form-control" theme="simple"  
								name="idto.hsncode" id="iName" />
						</div>
					
					
					<div style="margin:13px 45px -3px -30px;" ><input type="button" class="btn btn-primary" value="Add ItemCode ...." onclick="addMultipleItems()"  /></div>
					<div
									style="margin:  border: 1px; border-color: black;">
									
									<div style=" margin:-4px 39px 0px 60px;height: 211px; width: 470px;overflow-y: auto;" id="itemRows2"></div>
								</div>
					<!-- /.box-body -->
					<br/>
					
						<div id="addItemBt" style="display:none;">
							<s:submit cssClass="btn btn-primary" id="pbutton" onclick="return validateItem()" cssStyle="display:block;" value="Add Item"    />
<!-- 							<input type= "submit" onclick="return validateItem();" class="display:block" value="ADD Item" /> -->
						</div>
						
						<div id="dupId" >
						
						  <input type="hidden" name="dupchk" id="dupChk" value="0" />
						</div>
						
				</s:form>
			</div>
		</div>
		<div class="col-md-6">
			<div class="RightTable">
				<div class="box-header">
					<h3 class="box-title">Edit Item Details :</h3>
				</div>
				<table class="table table-hover" id="example1">
					<thead>
						<tr>
							<td><b>ITEM CODEE</b></td>
							<td><b>ITEM NAME</b></td>
							<td><b>HSN CODE</b></td>
							<td><b>DATE OF CREATION</b></td>
							<td><b>VIEW AND EDIT</b></td>
						</tr>
					</thead>
					<tbody>
						<s:if test="%{itemList.size>0}">
							<s:iterator value="itemList">
								<tr>
									<td><b><s:property value="itemId" /></b></td>
									<td><b><s:property value="itemName" /></b></td>
									<td><b><s:property value="hsncode" /></b></td>
									<td><b><s:property value="itemDateofcreation" /></b></td>
									<td>
									<img src="img/products.png" height="55px" width="55px" onclick="editItemsCall('<s:property value="itemId" />','<%=request.getContextPath()%>')" style="margin: -8px -23px -9px 1px;cursor: pointer;" />			
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