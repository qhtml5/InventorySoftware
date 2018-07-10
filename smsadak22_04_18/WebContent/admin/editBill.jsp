<%@ taglib uri="/struts-tags" prefix="s"%>

<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.StockMasterDTO"%>
<section class="content-header">
	<h1>
		Stock Master <small> Edit Your Bill</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action">Home</a></li>
		<li class="active">Purchase Bill Edit</li>
	</ol>
</section>
<section class="content">
<div id="validation"></div>
	<div class="row">
		<s:form action="editBillNo.action" method="post" theme="simple">
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">Purchase Bill Edit :</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Invoice/ Bill No:</label>
							<input type="text" id="newBill" name="newBill" class="form-control" value="${param['billNo']}" onkeyup="chkDupBillForEdit()">
							<input type="hidden" id="oldBill" name="oldBill" class="form-control" value="${param['billNo']}">
						</div>
						
						<div class="form-footer">
							<div id="editBillBtn">
							<s:submit value="Edit BIll No" theme="simple" id="sub" cssClass="btn btn-primary" onclick="return validateBill()" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</s:form>
	</div>
</section>