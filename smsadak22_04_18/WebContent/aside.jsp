<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.LoginUserCompanyMasterDto"%>
<aside class="left-side sidebar-offcanvas">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
           
                <!-- search form -->
                <!--  <form action="#" method="get" class="sidebar-form">
                    <div class="input-group">
                        <input type="text" name="q" class="form-control" placeholder="Search..."/>
                        <span class="input-group-btn">
                            <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                        </span> </div>
                </form> -->
                <!-- /.search form -->
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <li> <a href="adminIndexCall.action"> <img src="img/Home.png" width="25px" height="25px"/> <span>Dashboard</span> </a> </li>
                    <li class="treeview"> <a href="#"> <img src="img/products.png" width="25px" height="25px"/> <span>Items Master</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li><a href='#' onmouseover='called()' onmousemove='called()'  onmouseout='called()' onClick='itemCategoryCall()'><i class='fa fa-angle-double-right'></i>Add/View Category</a></li>
                            <li><a href='#' onmouseover='called()' onmousemove='called()'  onmouseout='called()' onclick='addBrandCall()'><i class='fa fa-angle-double-right'></i> Add/View Brand</a></li>
                            <li><a href='#' onmouseover='called()' onmousemove='called()'  onmouseout='called()' onclick='addSizeCall()'><i class='fa fa-angle-double-right'></i> Add/View Size</a></li> 
                        	<li><a href='#' onmouseover='called()' onmousemove='called()'  onmouseout='called()' onclick='addItemCall()'><i class='fa fa-angle-double-right'></i> Add/View Item</a></li>
                        </ul>
                    </li>
                    
                     <li class="treeview"> <a href="#"> <img src="img/products.png" width="25px" height="25px"/> <span>Closing/Opening Stock</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li><a href='closingstockcall.action' onmouseover='called()' onmousemove='called()'  onmouseout='called()' ><i class='fa fa-angle-double-right'></i>View Closing Stock</a></li>
                            <li><a href='openingstockcall.action' onmouseover='called()' onmousemove='called()'  onmouseout='called()' ><i class='fa fa-angle-double-right'></i>View Opening Stock</a></li>
                           
                        </ul>
                    </li>
                    
                    
                    <!-- <li class="treeview"> <a href="#"> <i class="fa fa-edit"></i> <span>Scheme Master</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li><a href='addSchemeCall.action' onmouseover="called()" onmousemove="called()"  onmouseout="called()"><i class="fa fa-angle-double-right"></i>Add New Scheme</a></li>
                            <li><a href="viewSchemeCall.action" onmouseover="called()" onmousemove="called()"  onmouseout="called()"><i class="fa fa-angle-double-right"></i>View Schemes</a></li>
                            <li><a href="viewEligibleCustomerCall.action" onmouseover="called()" onmousemove="called()"  onmouseout="called()"><i class="fa fa-angle-double-right"></i>Check Eligible Customer</a></li>
                        </ul>
                    </li> -->
                    
              
                    
                     <li  class="treeview"> <a href="#"> <img src="img/supplier.png" width="25px" height="25px"/> <span>Supplier</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li>
                            	<a href='#'onClick="supplierCall('<%=request.getContextPath()%>');"><i class="fa fa-angle-double-right"></i>Add New Supplier</a>
                            </li>
                            <li><a href='#' onmouseover="called()" onmousemove="called()"  onmouseout="called()" onClick="viewSupplierList('<%=request.getContextPath()%>')"><i class="fa fa-angle-double-right"></i>View Supplier List</a></li>
                        </ul>
                    </li>
                   
                     <li class="treeview"> <a href="#"> <img src="img/customer.png" width="25px" height="25px"/> <span>Customer</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                        
                        
                            <li><a href="#" onclick="addcustCall('<%=request.getContextPath()%>')"><i class="fa fa-angle-double-right"></i> Add New Customer</a></li>
                            <li><a href="#" onmouseover="called()" onmousemove="called()"  onmouseout="called()" onclick="editCustomerCall('0','<%=request.getContextPath()%>')"><i class="fa fa-angle-double-right"></i>View Customer</a></li>
                            <li>><a href="smsPay.action" ><i class="fa fa-angle-double-right"></i> SMS To Customer</a></li>
                        </ul>
                    </li>
                    
                     <li class="treeview"> <a href="#"> <img src="img/purchase.png" width="25px" height="25px"/><span>Purchase</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li><a href="sTockCall.action" onclick=""><i class="fa fa-angle-double-right"></i> New Purchase</a>
                           <%-- <li><a href="#"  onmouseover="called()" onmousemove="called()"  onmouseout="called()"  onclick="stockListCall('<%=request.getContextPath()%>')"><i class="fa fa-angle-double-right"></i>View Purchased Details By Invoice Nos</a></li> --%>
							
							<s:if test="#session.roleStatus.equalsIgnoreCase('ADMIN')">
                           		<li><a href="#"  onmouseover="called()" onmousemove="called()"  onmouseout="called()"  onclick="editInvoiceCall('<%=request.getContextPath()%>')"><i class="fa fa-angle-double-right"></i>Edit invoice/Bill Nos.</a></li>
							</s:if>
                        </ul>
                    </li>
                    <li class="treeview"> <a href="#"> <img src="img/ledger.png" width="25px" height="25px"/> <span>Purchase Ledger/Report</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                        	<li><a href="stockListCall.action"  onmouseover="called()" onmousemove="called()"  onmouseout="called()"  onclick=""><i class="fa fa-angle-double-right"></i>View Purchased Details</a></li>
							<li><a href="#"  onmouseover="called()" onmousemove="called()"  onmouseout="called()"  onclick="stockItemListCall('<%=request.getContextPath()%>')"><i class="fa fa-angle-double-right"></i>View Purchased Item</a></li>
                            <li><a href="purchaseLedger.action"><i class="fa fa-angle-double-right"></i>Purchase Ledger</a></li>
                            <li><a href="printHoleLedger.action"><i class="fa fa-angle-double-right"></i>Print Whole Ledger</a></li>
                        </ul>
                    </li>
                    <li class="treeview"> <a href="#"> <img src="img/damaged.png" width="25px" height="25px"/> <span>Debit Note</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li><a href="debitNoteCall.action" onmouseover="called()" onmousemove="called()"  onmouseout="called()" onclick=""><i class="fa fa-angle-double-right"></i> Debit Note Creation</a>
                           <li><a href="viewDebitNote.action" onmouseover="called()" onmousemove="called()"  onmouseout="called()"><i class="fa fa-angle-double-right"></i>View Debit Note</a>
                        </ul>
                    </li>
                    
                     <li class="treeview"> <a href="#"> <img src="img/sales.png" width="25px" height="25px"/><span>Sales</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li><a href="salesCall.action"><i class="fa fa-angle-double-right"></i>Sale Bill</a></li>
                            <li><a href="salesListCall.action"  onmouseover="called()" onmousemove="called()"  onmouseout="called()"  onclick=""><i class="fa fa-angle-double-right"></i>View Sales</a></li>
                        </ul>
                    </li>
                    
                  <li class="treeview"> <a href="#"><img src="img/damaged.png" width="25px" height="25px"/> <span>Credit Note</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li><a href="creditNoteCall.action" onmouseover="called()" onmousemove="called()"  onmouseout="called()" onclick=""><i class="fa fa-angle-double-right"></i> Credit Note Creation</a>
                           <!-- <li><a href="viewCreditNote.action" onmouseover="called()" onmousemove="called()"  onmouseout="called()"><i class="fa fa-angle-double-right"></i>View Credit Note</a> -->
                        </ul>
                    </li>
                    
                    <li class="treeview"><a href="#"><span>Product Replacement</span> <i class="fa fa-angle-left pull-right"></i> </a>
	                    <ul class="treeview-menu">
	                    	<li><a href="productReplaceCall.action"><i class="fa fa-angle-double-right"></i> Customer </a></li>
	                    </ul>
                    </li>
                    
                      <li class="treeview"> <a href="#"> <img src="img/payment.png" width="25px" height="25px"/> <span>Payment and Details</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li><a href="supplierPay.action"><i class="fa fa-angle-double-right"></i> Vendor </a></li>
                            <li><a href="customerPay.action"><i class="fa fa-angle-double-right"></i>Customer</a></li>
<!--                             <li><a href="wholeCustomerPayStatus.action"><i class="fa fa-angle-double-right"></i>Whole Payment Due Status</a></li>
                            <li><a href="customerPayWithDue.action"><i class="fa fa-angle-double-right"></i>Customers Payment Due Status</a></li>
 -->                        </ul>
                    </li>
                    
                    <li class="treeview"> <a href="#"> <img src="img/payment.png" width="25px" height="25px"/> <span>Payment Due Status</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li><a href="wholeCustomerPayStatus.action"><i class="fa fa-angle-double-right"></i>Whole Customer Payment</a></li>
                            <li><a href="customerPayWithDue.action"><i class="fa fa-angle-double-right"></i>Customer wise Payment</a></li>
                        </ul>
                    </li>
                    
                   
                   
                   
                  <li class="treeview"> <a href="#"> <img src="img/Barcode.png" width="25px" height="25px"/> <span>Barcode</span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                           
                            <li><a href="barcodesearch.action"><i class="fa fa-angle-double-right"></i>Search and print barcode</a></li>
                        </ul>
                   </li> 
                    
                    
                    
                    
                    
                      <!-- <li class="treeview"> <a href="#"> <i class="fa fa-edit"></i> <span>Print Duplicate Bill </span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li><a href="index.jsp"><i class="fa fa-angle-double-right"></i> Duplicate Bill</a></li>
                            
                        </ul>
                    </li>
                    
                      <li class="treeview"> <a href="#"> <i class="fa fa-edit"></i> <span>Report </span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li><a href="index.jsp"><i class="fa fa-angle-double-right"></i> Sales Report</a></li>
                            <li><a href="index.jsp"><i class="fa fa-angle-double-right"></i> Customer Sales Report</a></li>
                            <li><a href="index.jsp"><i class="fa fa-angle-double-right"></i> Purchase Report</a></li>
                        </ul>
                    </li>
                    
                    <li class="treeview"> <a href="#"> <i class="fa fa-edit"></i> <span>Exchange </span> <i class="fa fa-angle-left pull-right"></i> </a>
                        <ul class="treeview-menu">
                            <li><a href="index.jsp"><i class="fa fa-angle-double-right"></i> Customer Product Exchange</a></li>
                            <li><a href="index.jsp"><i class="fa fa-angle-double-right"></i> Vendor Product Exchange</a></li>
                            <li><a href="index.jsp"><i class="fa fa-angle-double-right"></i> Vendor Return View</a></li>
                        </ul>
                    </li>   -->    
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>