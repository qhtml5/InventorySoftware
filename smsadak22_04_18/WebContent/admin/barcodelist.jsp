<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/struts-tags"  prefix="s"%>
    <%@ page language="java" import="dTO.ItemCategoryTypeMasterDTO" %>

               <section onmouseover="called()" class="content">
              
                
                        <!-- left column -->
                        
								<div class="LongTable">
								
								<s:hidden name="idto.itemsLength" id="itemsLength" />  
    							<table id="example1" class="table table-bordered table-striped">
                                <thead style="background-color: #4B5156;color: white; ">
                                <tr>
                                <th><b>Serial</b></th>
                                <th><b>Product Name</b></th>
                                <th><b>Barcodes</b></th>
                                <th><b>Number of print</b><img src="<%=request.getContextPath()%>/img/printing.png"  width="45px" height="45px" style="margin: -21px 32px -14px 19px" onclick="printDetails()" /></th>
                                </tr>
                                </thead>
                                <tbody >
                                <s:if test="itemList.size>0">
                                <%int k=1; %>
								<s:iterator value="itemList">
								<tr>
								<td><%=k %></td>
								<td><s:property value="itemName" /></td>
								<td>
								
								
								<img src="<%=request.getContextPath()%><s:property value="barcode" />" width="190" height="70"/>
								
								
								
								</td>
								<td>
								
								 <input type="text" name="cloneImage" id="clone<%=k %>" onchange="cloneImagebySelect('<%=request.getContextPath()%><s:property value="barcode" />','<%=k %>',this);" value="0" size="6" onfocus="clearZero(this)"/>
								
								  
								<!--  <select name="cloneImage" onchange="cloneImagebySelect('<s:property value="barcode" />','<%=k %>');" id="clone<%=k %>" >
                                 <option value="0">-copies-</option>
                                 <option value="1">1</option>
                                 <option value="2">2</option>
                                 <option value="3">3</option>
                                 <option value="4">4</option>
                                 <option value="5">5</option>
                                 <option value="6">6</option>
                                 <option value="7">7</option>
                                 <option value="8">8</option>
                                 <option value="9">9</option>
                                 <option value="10">10</option>
                                 <option value="11">11</option>
                                 <option value="12">12</option>
                                 <option value="13">13</option>
                                 <option value="14">14</option>
                                 <option value="15">15</option>
                                 <option value="16">16</option>
                                 <option value="17">17</option>
                                 <option value="18">18</option>
                                 <option value="19">19</option>
                                 <option value="20">20</option>
                                 <option value="21">21</option>
                                 <option value="22">22</option>
                                 </select> -->
                                 
                                 
								</td>
								</tr><input type="hidden" value='<%=k++%>' />	
								</s:iterator>
								</s:if>
                                </tbody>
                                <tfoot style="background-color: #4B5156;color: white; ">
                                <tr>
                                <th><b>Serial</b></th>
                                <th><b>Product Name</b></th>
                                <th><b>Barcodes</b></th>
                                <th><b>Number of print</b><img src="<%=request.getContextPath()%>/img/printing.png"  width="45px" height="45px" style="margin: -21px 32px -14px 19px;cursor: pointer;" onclick="printDetails()" /></th>
                                </tr>
                                </tfoot>
                                </table>
                                </div>
                   
                

                </section>
                <div id="schDIV" class="white_content_login">
				<a href="#" onclick="document.getElementById('schDIV').style.display='none';document.getElementById('fade1').style.display='none'">
				        <img src="img/Close-button.png" border="0" />
				 </a>
				 
				 <div id="lDetailsDiv"></div>
			</div>