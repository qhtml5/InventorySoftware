<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.LocationMasterDto" language="java"%>
<section class="content-header">
	<h1>
		Location Master <small> Create your Warehouse <img
			src="img/location.png" height="60px" width="80px"
			style="margin: -14px -22px -21px 0px" /></small>

	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action">HOME</a></li>
		<li class="active">LOCATION MASTER FORM</li>
	</ol>
</section>
<section class="content">
<div id="validation"></div>
	<div class="row">
		<!-- left column -->

		<s:form action="/addWareHouse.action" method="post">
			<!-- general form elements -->
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">Enter Location Details :</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->

					<div class="box-body">
						<div class="form-group">

							<label for="exampleInputEmail1">Name:</label>
							<s:textfield cssClass="form-control" id="lName"
								name="locDto.locationName" theme="simple" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Description:</label>
							<s:textfield cssClass="form-control"
								name="locDto.locationDescription" id="lDes" theme="simple" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Address:</label>
							<s:textfield cssClass="form-control"
								name="locDto.locationAddress" id="lAddr" theme="simple" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Phone No:</label>
							<s:textfield cssClass="form-control" name="locDto.locationPhone"
								id="lPh" theme="simple" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Mobile:</label>
							<s:textfield cssClass="form-control" name="locDto.locationMobile"
								id="lMob" theme="simple" />
						</div>

						<div class="box-footer">
							<s:hidden name="locDto.locationId" value="%{locDto.locationId}"
								theme="simple" />
							<s:submit cssClass="btn btn-primary" value="Add Location"
								onclick="return validateLocation();" theme="simple" />
						</div>
					</div>
					<!-- /.box-body -->

					<!-- form end -->
				</div>

			</div>
			<div class="col-md-6">
				<div class="box box-warning">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Pin:</label>
							<s:textfield cssClass="form-control" name="locDto.locationPin"
								id="lPin" theme="simple" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">State:</label>
							<s:textfield cssClass="form-control" name="locDto.locationState"
								id="lState" theme="simple" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Fax:</label>
							<s:textfield cssClass="form-control" name="locDto.locationFax"
								id="lFax" theme="simple" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Email:</label>
							<s:textfield cssClass="form-control" name="locDto.locationEmail"
								id="lEmail" theme="simple"
								 />
						</div>
					</div>
				</div>
			</div>
		</s:form>
	</div>
</section>