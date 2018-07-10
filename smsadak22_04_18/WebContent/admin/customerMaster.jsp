<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>

<section class="content-header">
	<h1>
		CUSTOMER MASTER <small> Create customer details</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action">HOME</a></li>
		<li class="active">CUSTOMER MASTER</li>
	</ol>
</section>

<section class="content">
<div id="validation"></div>
	<div>
		<s:form action="saveCustomerDetails" method="post" theme="simple">
			<div class="row">
				<div class="col-md-6">
					<!-- general form elements -->
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Add Customer details :</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="form-group">
								<label for="cName">Customer Name :</label>
								<s:textfield cssClass="form-control" name="cDTO.cName" theme="simple" id="cName" onkeyup="convertCapital(document.getElementById('cName'))" />
							</div>
							
							<div class="form-group">
								<label for="ADDRESS">Area:</label>
								<s:textarea cssClass="form-control" name="cDTO.address"  theme="simple" id="ADDRESS" cols="7" rows="2"></s:textarea>
							</div>
							
							<div class="form-group">
								<label for="PHONE">Phone:</label>
								<s:textfield cssClass="form-control" name="cDTO.phoneno" theme="simple" id="PHONE" />
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
						<!-- /.box-body -->
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
								<s:textfield cssClass="form-control" name="cDTO.Fax" theme="simple" id="Fax" />
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
								<label for="note">Note:</label>
								<s:textarea cssClass="form-control" name="cDTO.note"
									theme="simple" id="note" cols="7" rows="4"></s:textarea>
							</div>
							
							
							
									<div class="form-group">
								<label for="note">State code </label>
								<s:textarea cssClass="form-control" name="cDTO.stcode"
									theme="simple" id="note" cols="7" rows="4"></s:textarea>
							</div>
							
								<div class="form-group">
								<label for="note">GSTTIN NO.</label>
								<s:textarea cssClass="form-control" name="cDTO.gsttin"
									theme="simple" id="note" cols="7" rows="4"></s:textarea>
							</div>
							
							
							
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!--/.col (right) -->
			</div>
		</s:form>
	</div>
	<div id="validation2"></div>
	<br /> <br /> <br /> <br /> <br /> <br />

</section>
