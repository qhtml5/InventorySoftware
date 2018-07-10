<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="dTO.LocationMasterDto" language="java"%>
<section class="content-header">
	<h1>
		Location Master <small> Create your Warehouse <img src="img/location.png" height="60px" width="80px" style="margin: -14px -22px -21px 0px"/></small>

	</h1>
	<ol class="breadcrumb">
		<li><a href="adminIndexCall.action">HOME</a></li>
		<li class="active">LOCATION MASTER LIST</li>
	</ol>
</section>
<section onmouseover="called()" class="content">

	<div class="row">
		<div class="longTable">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">View and Edit Location Details :</h3>
				</div>
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th><b>LOCATION NAME</b></th>
							<th><b>LOCATION ADDRESS</b></th>
							<th><b>LOCATION STATE</b></th>
							<th><b>VIEW AND EDIT</b></th>
						</tr>
					</thead>
					<tbody>
						<s:if test="%{locList.size>0}">
							<s:iterator value="locList">
								<tr>
									<td><b><s:property value="locationName" /></b></td>
									<td><b><s:property value="locationAddress" /></b></td>
									<td><b><s:property value="locationState" /></b></td>
									<td>
											
										<img src="img/location.png" height="50px" width="100px" onclick="editLocationCall('<s:property value="locationId" />','<%=request.getContextPath()%>')" style="margin: -8px -23px -9px 1px;cursor: pointer;" />			
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