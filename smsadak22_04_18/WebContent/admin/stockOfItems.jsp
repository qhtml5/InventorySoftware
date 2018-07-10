<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/struts-tags"  prefix="s"%>
    <%@ page language="java" import="dTO.StockMasterDTO" %>
<section class="content-header">
                    <h1>
                       Purchase Master 
                       <small> View All Purchased Details <img src="img/purchase.png" height="60px" width="60px" style="margin: -20px -21px -18px -6px"/> </small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="adminIndexCall.action"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Purchase Master List</li>
                    </ol>
                </section>
               <section onmouseover="called()" class="content">
              
                 <div class="row">
                        <!-- left column -->
                        <div class="LongTable">
                            <!-- general form elements -->
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title"> Purchased Items List</h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                              
    							<table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                            <th><b>SERIAL NO.</b></th>
                                             <th><b>ITEM NAME</b></th>
                                             <th><b>DETAILS</b></th>
                                              
			                                    
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                               <s:if test="stockDTOList.size>0">
                                               <%int k=1; %>
													 <s:iterator value="stockDTOList">
														<tr>
														 <td><%=k %></td>
														   <td><s:property value="itemname" /></td>

														  <td>
										
											             <img src="<%=request.getContextPath()%>/img/purchase.png" width="45px" height="45px" onclick="getAllItemStock('<s:property value="itemIds" />','<s:property value="itemname" />'); document.getElementById('schDIV').style.display='block'; document.getElementById('fade1').style.display='block'" style="cursor: pointer;"/>
										                </td>
															
														</tr>
														<input type="hidden" value='<%=k++%>' />	
													</s:iterator>
												
												</s:if>
                                        </tbody>
                                    </table>
                            </div>
                        </div>
                    </div>

                </section>
                <div id="schDIV" class="white_content_login">
				<a href="#" onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
				        <img src="img/Close-button.png" border="0" />
				 </a>
				 
				 <div id="iDetailsDiv"></div>
			</div>