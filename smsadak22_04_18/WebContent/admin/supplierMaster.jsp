<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.SupplierMasterDTO"%>

<section class="content-header">
	<h1>
		SUPPLIER MASTER <small> Create supplier details <img src="img/supplier.png" height="60px" width="60px" style="margin: -8px -23px -28px 2px"/></small>

	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action">Home</a></li>

		<li class="active">SUPPLIER MASTER</li>
	</ol>
</section>

<section class="content">
<div id="validation"></div>
	<div>
		<s:form action="saveSupplierDetails" method="post" theme="simple">
			<div class="row">
				<div class="col-md-6">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Add Supplier Details :</h3>
						</div>
						<div class="box-body">
							<div class="form-group">
								<label for="SUPPLIERNAME">Supplier Name :</label>
								<s:textfield cssClass="form-control" name="sDTO.SUPPLIERNAME" theme="simple" id="SUPPLIERNAME" />
							</div>
							<div class="form-group">
								<label for="ADDRESS">Address :</label>
								<s:textarea cssClass="form-control" name="sDTO.ADDRESS" theme="simple" id="ADDRESS" cols="7" rows="2"></s:textarea>
							</div>
							<div class="form-group">
								<label for="ContactPerson">Contact Person :</label>
								<s:textfield cssClass="form-control" name="sDTO.ContactPerson" theme="simple" id="ContactPerson" />
							</div>
							<div class="form-group">
								<label for="PHONE">Phone:</label>
								<s:textfield cssClass="form-control" name="sDTO.PHONE" theme="simple" id="PHONE"  />
							</div>
							<div class="form-group">
								<label for="mobile">Mobile No :</label>
								<s:textfield cssClass="form-control" name="sDTO.MOBILE" theme="simple" id="MOB" />
							</div>
							<div class="form-group">
								<label for="PIN">Pin :</label>
								<s:textfield cssClass="form-control" name="sDTO.PIN" theme="simple" id="PIN" />
							</div>
							<div class="form-group">
								<label for="STATE">State :</label>
								<s:textfield cssClass="form-control" name="sDTO.STATE" theme="simple" id="STATE" />
							</div>
						</div>
						<div class="box-footer">
							<s:submit align="center" value="Submit" cssClass="btn btn-primary" onclick="return validateSupplier()"/>
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
								<s:textfield cssClass="form-control" name="sDTO.Fax" theme="simple" id="Fax" />
							</div>
							<div class="form-group">
								<label for="VATNo">Vat No:</label>
								<s:textfield cssClass=
								"form-control" name="sDTO.VATNo" theme="simple" id="VATNo" />
							</div>
							<div class="form-group">
								<label for="STNo">St. No:</label>
								<s:textfield cssClass="form-control" name="sDTO.STNo" theme="simple" id="STNo" />
							</div>
							<div class="form-group">
								<label for="CSTNo">Cst. No:</label>
								<s:textfield cssClass="form-control" name="sDTO.CSTNo" theme="simple" id="CSTNo" />
							</div>
							<div class="form-group">
								<label for="EMAIL">Email:</label>
								<s:textfield cssClass="form-control" name="sDTO.EMAIL" theme="simple" id="EMAIL" />
							</div>
							<div class="form-group">
								<label for="PAN">Pan:</label>
								<s:textfield cssClass="form-control" name="sDTO.PAN" theme="simple" id="PAN" />
							</div>
							<div class="form-group">
								<label for="NOTE">Note:</label>
								<s:textarea cssClass="form-control" name="sDTO.NOTE" theme="simple" id="NOTE" cols="7" rows="4"></s:textarea>
							</div>
						</div>
				</div>
			</div>
		</s:form>
	</div>
<div id="validation2"></div>
</section>
