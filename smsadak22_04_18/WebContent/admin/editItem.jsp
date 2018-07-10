<%@ taglib uri="/struts-tags" prefix="s"%>

<%@ page import="dTO.ItemCategoryTypeMasterDTO" language="java"%>
<%@ page import="dTO.SupplierMasterDTO" language="java" %>
<section class="content-header">
	<h1>
		Item Master <small> Edit your Items <img src="img/products.png" height="60px" width="60px" style="margin: -14px -22px -21px 0px"/></small>

	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action" >HOME</a></li>
		<li><a href="#" onclick="addItemCall('<%=request.getContextPath()%>')">ADD ITEM/VIEW</a></li>
		<li class="active">ITEM MASTER EDIT</li>
	</ol>
</section>
<section class="content">
<div id="validation"></div>
	<div class="row">
		<s:form action="/editItems.action" method="post" theme="simple">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">Edit Items Details :</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Item Name:</label>
							<s:textfield cssClass="form-control" theme="simple" name="idto.itemName" id="iName" />
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">HSN Code :</label>
							<s:textfield cssClass="form-control" theme="simple" name="idto.hsncode" id="hsncode" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Item type</label>
							<s:textfield id="iType" cssClass="form-control" name="idto.itemType" theme="simple" disabled="true" />
							<select id="itemTypeId" class="form-control" name="idto.itemTypeID">
								<option value="0">Select One</option>
								<s:iterator value="iCateoryList">
									<option value="<s:property value='itemTypeID'/>">
										<s:property value='itemType' />
									</option>
								</s:iterator>
							</select>
						</div>
						<%-- <div class="form-group">
							<label for="exampleInputPassword1">Size:</label>
							<s:textfield cssClass="form-control" theme="simple" name="idto.itemSizeName" disabled="true" />
							<s:select id="supplierId" theme="simple" cssClass="form-control"
								name="idto.itemSizeId" list="sizeList" listKey="itemSizeId"
								listValue="itemSizeName" headerKey="0" headerValue="Select One" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Supplier:</label>
							<s:textfield cssClass="form-control" theme="simple" name="idto.supplierName" disabled="true" /> 
							<select id="supplierId" class="form-control" name="idto.supplierId">
								<option value="0">Select One</option>
								<s:iterator value="sDTOList">
									<option value="<s:property value='SupplierId'/>">
										<s:property value='SUPPLIERNAME'/>
									</option>
								</s:iterator>
							</select>
						</div> --%>
						<div class="form-group">
							<label for="exampleInputPassword1">Brand</label>
							<s:textfield cssClass="form-control" theme="simple" name="idto.itemBrandName" disabled="true" /> 
							<select id="itemBrandId" class="form-control" name="idto.itemBrandId">
								<option value="0">Select One</option>
								<s:iterator value="brandList">
									<option value="<s:property value='itemBrandId'/>">
										<s:property value='itemBrandName' />
									</option>
								</s:iterator>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Units:</label>
							<s:textfield cssClass="form-control" theme="simple" name="idto.itemUnit" disabled="true" />
							<select id="itemUnit" class="form-control" name="idto.itemUnit">
								<option value="0">Select One</option>
								<option value="PCS">PCS</option>
								<option value="DOZZEN">DOZZEN</option>
							</select>
						</div>
						<%-- <div class="form-group">
							<label for="exampleInputEmail1">MRP:</label>
							<s:textfield cssClass="form-control" theme="simple"  name="idto.itemMrp" id="iMrp" />
						</div> --%>
						
						<div class="form-footer">
							<s:hidden id="itemId" name="idto.itemId"  value="%{idto.itemId}" theme="simple" />
							<s:submit value="Edit Item" theme="simple" id="sub" cssClass="btn btn-primary" onclick="return validateItem();" />
						</div>
					</div>
				</div>
			</div>
		</s:form>
	</div>
</section>