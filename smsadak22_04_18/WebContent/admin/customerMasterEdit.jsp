<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>

<section class="content-header">
	<h1>
		EDIT CUSTOMER DETAILS <small> Edit customer details <img src="img/customer.png" height="60px" width="60px" style="margin: -20px -32px -20px 3px"/></small>

	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action">Home</a></li>
		<li><a href='#'
			onclick="editCustomerCall('0','<%=request.getContextPath()%>')"><i
				class="fa fa-angle-double-right"></i> CUSTOMER LIST</a></li>
		<li class="active">CUSTOMER MASTER EDIT</li>
	</ol>
</section>

<section class="content">
<div id="validation"></div>
	<div>
		<s:form action="saveCustomerDetails" method="post" theme="simple">
			<div class="row">
				<!-- left column -->



				<div class="col-md-6">
					<!-- general form elements -->
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Edit Customer details :</h3>
						</div>
						<!-- /.box-header -->
						<!-- form start -->
						<div class="box-body">
							<div class="form-group">

								<label for="cName">Customer Name :</label>
								<s:textfield cssClass="form-control" name="cDTO.cName"
									theme="simple" id="cName" />
								<s:hidden name="cDTO.customerId"></s:hidden>

							</div>
							<div class="form-group">
								<label for="ADDRESS">Address :</label>

								<s:textarea cssClass="form-control" name="cDTO.address"
									theme="simple" id="ADDRESS" cols="7" rows="2"></s:textarea>
							</div>

							<div class="form-group">

								<label for="PHONE">Phone No:</label>
								<s:textfield cssClass="form-control" name="cDTO.phoneno"
									theme="simple" id="PHONE" />
							</div>
							<div class="form-group">
								<label for="PHONE">Mobile :</label>
								<s:textfield cssClass="form-control" name="cDTO.mobile" theme="simple" id="MOB" />
							</div>
							<div class="form-group">
								<label for="PHONE">Email:</label>
								<s:textfield cssClass="form-control" name="cDTO.email" theme="simple" id="EMAIL" />
							</div>
							<div class="form-group">

								<label for="PIN">Pin :</label>
								<s:textfield cssClass="form-control" name="cDTO.pincode"
									theme="simple" id="PIN" />
							</div>

							<div class="form-group">
								<label for="STATE">State :</label>
								<s:textfield cssClass="form-control" name="cDTO.state"
									theme="simple" id="STATE" />
							</div>
						</div>
						<div class="box-footer">
							<s:submit align="center" value="Submit"
								cssClass="btn btn-primary" onclick="return validateCustomer();" />
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<!-- general form elements disabled -->
					<div class="box box-warning">
						<div class="box-header"></div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="form-group">
								<label for="Fax">Fax No:</label>
								<s:textfield cssClass="form-control" name="cDTO.Fax"
									theme="simple" id="Fax" />
							</div>
							<div class="form-group">
								<label for="VATNo">Vat No:</label>
								<s:textfield cssClass="form-control" name="cDTO.Vat"
									theme="simple" id="VATNo" />
							</div>
							<div class="form-group">
								<label for="type">Type:</label>
								<s:textfield cssClass="form-control" name="cDTO.type"
									theme="simple" id="type" />
							</div>
							<div class="form-group">
								<label for="type">Remarks:</label>
								<s:textfield cssClass="form-control" readonly="true"
									name="cDTO.remarks" theme="simple" id="type" />
							</div>
							<div class="form-group">
								<label for="note">Note:</label>
								<s:textarea cssClass="form-control" name="cDTO.note"
									theme="simple" id="note" cols="7" rows="4"></s:textarea>
							</div>
							
							
							
							<div class="form-group">
								<label for="note">State code:</label>
								<s:textarea cssClass="form-control" name="cDTO.stcode"
									theme="simple" id="note" cols="7" rows="4"></s:textarea>
							</div>
							
							
								<div class="form-group">
								<label for="note">Gsttin:</label>
								<s:textarea cssClass="form-control" name="cDTO.gsttin"
									theme="simple" id="note" cols="7" rows="4"></s:textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</s:form>
	</div>
</section>
