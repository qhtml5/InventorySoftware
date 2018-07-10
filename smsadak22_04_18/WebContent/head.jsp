<html>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="dTO.LoginUserCompanyMasterDto"%>
<head>
<!--Start of Zendesk Chat Script-->
<script type="text/javascript">
window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
$.src="https://v2.zopim.com/?554AVRkeOybJCeDBJYALVYsZzTLmXBW0";z.t=+new Date;$.
type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
</script>
<!--End of Zendesk Chat Script-->
</head>
<header class="header">
	<a href="https://www.facebook.com/PR-Inventory-Solutions-307862899674653/"  target="_blank" class="logo">
		<!-- Add the class icon to your logo image or logo icon to add the margining -->
		 <img src="<%=request.getContextPath() %>/img/ssmslogologine.png" width="90px" height="60px" style="margin:5px 7px 34px 26px"/>  
	</a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
		</a>
		<div class="navbar-right">
			<ul class="nav navbar-nav">
				<li>
					<div align="center" id="companyTopHeading">
						${sessionScope['companyName']}
					</div>
				
				<p style="color: #fff; font-size:15px; margin: 0px 0px 0px 0px;"><b>Financial Year: ${sessionScope['fYear']}</b></p> <div style="margin:-22px 46px -4px 222px;color: #fff;"  id="sesreload"></div>
				</li>
				
				<li class="dropdown user user-menu"><i style="margin:23px 32px 36px 14px">
				<a href="#" class="small-box-footer"
				onclick="document.getElementById('aboutus').style.display='block'; document.getElementById('fade1').style.display='block'"> <img src="<%=request.getContextPath() %>/img/aboutus.gif"   height="14px"/>
				</a></i><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="glyphicon glyphicon-user"></i> 
						<span> ${sessionScope['login']}<i class="caret"></i>
					</span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header bg-light-blue"><img
							src="${sessionScope['photoUrl']}" alt="User Image" />
						<!-- Menu Body -->
						<li class="user-body"></li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" class="btn btn-default btn-flat">Profile</a>
							</div>
							<div class="pull-right">
								<a href="logout.action" class="btn btn-default btn-flat">Sign
									out</a>
							</div>
						</li>
					</ul></li>
			</ul>
		</div>
	</nav>
	
	<div class="containertwo">

            <ul id="nav">
               
                <li><a href="#"><span><img src="img/products.png" width="25px" height="25px"/> Item Master</span></a>
                    <div class="subs">
                        <div class="col">
                            <ul>
                               <li><a href='#' onmouseover='called()' onmousemove='called()'  onmouseout='called()' onClick='itemCategoryCall()'><i class='fa fa-angle-double-right'></i>Add/View Category</a></li>
                               <li><a href='#' onmouseover='called()' onmousemove='called()'  onmouseout='called()' onclick='addBrandCall()'><i class='fa fa-angle-double-right'></i> Add/View Brand</a></li>
                               <li><a href='#' onmouseover='called()' onmousemove='called()'  onmouseout='called()' onclick='addSizeCall()'><i class='fa fa-angle-double-right'></i> Add/View Size</a></li> 
                        	   <li><a href='#' onmouseover='called()' onmousemove='called()'  onmouseout='called()' onclick='addItemCall()'><i class='fa fa-angle-double-right'></i> Add/View Item</a></li>
                                
                            </ul>
                        </div>
                       
                    </div>
                </li>
                <li><a href="#"><span><img src="img/purchase.png" width="25px" height="25px" /> Purchase</span></a>
                    <div class="subs">
                        <div class="col">
                            <ul>
                               <li><a href="sTockCall.action" onclick=""><i class="fa fa-angle-double-right"></i> New Purchase</a>
                           <%-- <li><a href="#"  onmouseover="called()" onmousemove="called()"  onmouseout="called()"  onclick="stockListCall('<%=request.getContextPath()%>')"><i class="fa fa-angle-double-right"></i>View Purchased Details By Invoice Nos</a></li> --%>
							
							<s:if test="#session.roleStatus.equalsIgnoreCase('ADMIN')">
                           		<li><a href="#"  onmouseover="called()" onmousemove="called()"  onmouseout="called()"  onclick="editInvoiceCall('<%=request.getContextPath()%>')"><i class="fa fa-angle-double-right"></i>Edit invoice/Bill Nos.</a></li>
							</s:if>
							<li><a href="stockListCall.action"  onmouseover="called()" onmousemove="called()"  onmouseout="called()"  onclick=""><i class="fa fa-angle-double-right"></i>View Purchased Details</a></li>
							<li><a href="#"  onmouseover="called()" onmousemove="called()"  onmouseout="called()"  onclick="stockItemListCall('<%=request.getContextPath()%>')"><i class="fa fa-angle-double-right"></i>View Stocks</a></li>
                            <li><a href="purchaseLedger.action"><i class="fa fa-angle-double-right"></i>Purchase Ledger</a></li>
                            <li><a href="printHoleLedger.action"><i class="fa fa-angle-double-right"></i>Print Whole Ledger</a></li>
                            </ul>
                        </div>
                      
                    </div>
                </li>
                 <li><a href="#"><span><img src="img/sales.png" width="25px" height="25px" /> Sales</span></a>
                    <div class="subs">
                        <div class="col">
                            <ul>
                             <li><a href="salesCall.action"><i class="fa fa-angle-double-right"></i>Sale Bill</a></li>
                            <li><a href="salesListCall.action"  onmouseover="called()" onmousemove="called()"  onmouseout="called()"  onclick=""><i class="fa fa-angle-double-right"></i>View Sales</a></li>
                            <li><a href="gstlistCall.action"  onmouseover="called()" onmousemove="called()"  onmouseout="called()"  onclick=""><i class="fa fa-angle-double-right"></i>Export GST reports</a>
                            <li><a href="printHoleCustLedger.action"><i class="fa fa-angle-double-right"></i>Sale Ledger</a></li>
                            
                            
                            </ul>
                        </div>
                       
                    </div>
                </li>
                
                <li><a href="#"><span><img src="img/payment.png" width="25px" height="25px" /> Payment and due Details</span></a>
                    <div class="subs">
                        <div class="col">
                            <ul>
                                 <li><a href="supplierPay.action"><i class="fa fa-angle-double-right"></i> Vendor payment</a></li>
                            <li><a href="customerPay.action"><i class="fa fa-angle-double-right"></i> Customer payment</a></li>
                               <li><a href="wholeCustomerPayStatus.action"><i class="fa fa-angle-double-right"></i>Whole Customer Payment</a></li>
                            <li><a href="customerPayWithDue.action"><i class="fa fa-angle-double-right"></i>Customer wise Payment</a></li>
                            </ul>
                        </div>
                      
                    </div>
                </li>
              
               <li><a href="#"><span><img src="img/damaged.png" width="25px" height="25px" />C.N / D.N </span></a>
                    <div class="subs">
                        <div class="col">
                            <ul>
                           <li><a href="creditNoteCall.action" onmouseover="called()" onmousemove="called()"  onmouseout="called()" onclick=""><i class="fa fa-angle-double-right"></i> Credit Note Creation</a></li>
                           <li><a href="productReplaceCall.action"><i class="fa fa-angle-double-right"></i> Product Replacement Form </a></li>
                           <li><a href="creditNoteDetailsCall.action"><i class="fa fa-angle-double-right"></i>View C.N details </a></li>
                          
                           <li><a href="debitNoteCall.action" onmouseover="called()" onmousemove="called()"  onmouseout="called()" onclick=""><i class="fa fa-angle-double-right"></i> Debit Note Creation</a>
                           <li><a href="viewDebitNote.action" onmouseover="called()" onmousemove="called()"  onmouseout="called()"><i class="fa fa-angle-double-right"></i>View Debit Note</a>
                           
                            </ul>
                        </div>
                    </div>
                </li>
          
               <li><a href="barcodesearch.action"><img src="img/Barcode.png" width="25px" height="25px" /> Barcode Search</a></li>
               <li><a href="databasebackup.action"><img src="img/dtabaseBackup.png" width="25px" height="25px" /> DB backup</a></li>
            </ul>
        </div>
</header>
<div id="aboutus" class="white_content_login">
		<a href="#"
			onclick="document.getElementById('aboutus').style.display='none';document.getElementById('fade1').style.display='none'">
			<img src="img/Close-button.png" border="0" />
		</a>

		<div id="lDetailsDivee">
		
		<div align="center"><img src="img/ssmslogologine.png" /></div>
		<div>
		<br/><p>  P.R Inventory solution software is Developed by Pradipto Roy (Software Developer and Freelancer) . P.R Inventory solution is a full package of solving your business needs . If you are running a small business example a shoe shop ,garments shop or hotel or grocery shop etc this software is portable easy to use learn in only few hours and start working. What we are providing is a portable solution for your business at your door steps . Our software is GST enable almost loaded with all types of Ledger types from Purchase Ledger To Customer Ledger. If you want to take a taste of our product just email us for the demo or call us .. Thank you have a great day cheers.
	    You can upgrade this software in online so that you can use all functionalities in other device for more queries contact me on following contact details :
	    
	    Email : proy.techworld@gmail.com
	    Contact no : 7903477176
		 </p>
		 <br/>
		<a href="https://www.facebook.com/PR-Inventory-Solutions-307862899674653/" target="_blank">Developed by Pradipto roy (Java Freelancer)</a> 
		 </div>
		
		</div>
	</div>
</html>