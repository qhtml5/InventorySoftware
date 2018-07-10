function customerListPapulate(){
    var date = new Date();
    var reqType="getCustomerId";
    var url="ServiceLogMasterServlet?refresh=" + date.getMilliseconds();
    $.ajax({
        type:"POST",
        url: url,
        dataType:"json",
        data:{
            reqType: reqType
        },
        success: function(data){
            if(data != null){
                populateCidList(data);
            }
        },
        error:function (jqXHR, textStatus, errorThrown){
            alert(errorThrown);
        }
    });
}
function populateCidList(data){
    $('#cId').children().remove().end().append('<option value="">Select One</option>') ;
    // alert("!!!");
    $.each(data, function(index, item)
    {
        // alert(item.productId);
        $('#cId').append($("<option></option>").attr("value",item.cusId).text(item.cusId));
    });

}
function getCusDetailByCID(cId){
    if(cId!=null && cId.length>0){
        var date = new Date();
        var reqType="getCustomerDetailByCID";
        var url="ServiceLogMasterServlet?refresh=" + date.getMilliseconds();
        $.ajax({
            type:"POST",
            url: url,
            dataType:"json",
            data:{
                reqType: reqType,
                cId : cId
            },
            success: function(data){
                if(data != null){
                    $('#cusName').html(data.cusDTO.cusId+" : : "+data.cusDTO.cusName);
                    $('#ccId').val(data.cusDTO.cusId);
                    $('#imgRow').show();
                    if((data.mainServiceDTO.pathOfInstallReport)!=null && (data.mainServiceDTO.pathOfInstallReport).length>0){
                        $('#fileDload').html("<a href='"+data.mainServiceDTO.pathOfInstallReport+"'><img src='img/Report.png'/></a>");
                    }else{
                        $('#fileDload').html("Installation Report is Not Uploded !");
                    }
                }else{
                    $('#imgRow').hide();
                }
            },
            error:function (jqXHR, textStatus, errorThrown){
                alert(errorThrown);
            }
        });
    }else{
        alert("Pls Select Customer Id Firts !");
        $('#imgRow').hide();
    //        var tdIndex3 = $("#imgRow td").length;
    //        if(tdIndex3>2){
    //            $("#imgRow td:last").remove();
    //        }
    }
}
function getListOfCustServceDetail(){
    var cId=$.trim($("#cId").val());
    // alert(cId);
    if(cId.length > 0){
        var date = new Date();
        var reqType="getAllServiceListByCID";
        var url="ServiceLogMasterServlet?refresh=" + date.getMilliseconds();
        $.ajax({
            type:"POST",
            url: url,
            dataType:"json",
            data:{
                reqType: reqType,
                cId : cId
            },
            success: function(data){
                if(data != null){
                    papulateTableListService(data)
                }else{
                    alert("none");
                }
            },
            error:function (jqXHR, textStatus, errorThrown){
                alert(errorThrown);
            }
        });
    }
}
var totalOrders=0;
function papulateTableListService(data){
    if(data!=null)
    {
        var tableData="";
        var stts="";
        $.each(data.serviceLogMaster, function(index, item){
            stts=(item.serviceStatus==0?"In-Active":item.serviceStatus==1?"Active":"Closed");
            //alert(stts);
            totalOrders+=1;
            tableData+="<tr class='trClass"+(index+1)+"'><td>"+item.mendServiceId+"</td><td>"+item.serviceType+"</td><td>"+item.startDate+"</td><td>"+item.endDate+"</td><td>"+item.cusId+"</td><td>"+stts+"</td><td><input class='btn btn-primary' name='button' type='submit' style='width:100px' value='Call Register' id='callRegister' onClick=populateToggleCallRegister('"+(index+1)+"') /></td>";
            if((item.pathOfServiceReport)!=null && (item.pathOfServiceReport).length>0){
                tableData+="<td><a href='"+item.pathOfServiceReport+"'><img src='img/Report.png'/></a></td>";
            }else{
                tableData+="<td>No Report</td>";
            }
            //tableData+="<td>Report</td>";
            tableData+="</tr>"+
            "<tr class='trId"+(index+1)+"' style='display:none'>\n\
            <td colspan='8'>\n\
            <table border=1>\n\
          <tr><td>Service Id</td><td><input type='text' class='form-control' name='mendServiceId' id='mendServiceId' value="+item.mendServiceId+" readonly  /></td>  <td>Customer Id </td>  <td><input name='cusId' id='cusId' value="+item.cusId+" readonly type='text' class='form-control' /></td>  <td>Start Date </td>  <td ><input type='text' class='form-control' id='startDate' name='startDate' value="+item.startDate+" readonly  /></td>  <td>End Date </td>  <td><input class='form-control' name='endDate' id='endDate' value="+item.endDate+" type='text' readonly  /></td></tr>\n\
          <tr><td>Service Eng. </td>  <td colspan='2'><input type='text' class='form-control' name='serviceEngineer' id='serviceEngineer' value='"+item.serviceEngineer+"' ></td>"+
            "<td>Alt Eng. </td>  <td colspan='2'><input  type='text' class='form-control' name='altEngineer' id='altEngineer' value='"+item.altEngineer+"'></td>  <td>Status</td><td>"+stts+"</td></tr>\n\
          <tr><td rowspan='2'>Remark</td><td colspan='2' rowspan='2'><textarea id='remark' name='remark' class='form-control'>"+item.remark+"</textarea></td>  <td>Product Id </td>  <td><input name='productId' id='productId' value="+item.productId+" readonly type='text'  class='form-control' /></td>"+
            "<td><input type='text' class='form-control' id='serialKeyV' name='serialKeyV'  readonly value='"+item.serialKey+"' /></td> <td><select class='form-control' name='serialKey' id='serialKey'><option value=''>Select One</option>";
            $.each(data.productSLNoDTO, function(index1, item1)
            {
                tableData+="<option value='"+item1.serialKey+"' >"+item1.serialKey+"</option>";
            });
            tableData+="</select></td><td><form enctype='multipart/form-data' method='post' action='' id='attachfileform"+(index+1)+"' name='attachfileform"+(index+1)+"'><input type='file' id='fileNameSer' name='fileNameSer' onChange='chkFileTypeSer("+(index+1)+");'/></form></td></tr><tr><td>Service Open Date </td> <td><input name='dateSysDateOpen' id='dateSysDateOpen' type='text' class='form-control' value='"+item.dateSysDateOpen+"'/></td>  <td>Service  Date </td>  <td><input class='form-control' name='serviceDate' id='serviceDate' type='text'  value='"+item.serviceDate+"' /></td>   <td><input class='btn btn-primary' name='callLockBtnSubmit' type='button' value='Submit' onClick=callLockOfService('"+(index+1)+"') /></td></tr></table>\n\
         </td>\n\
        </tr>";
        });
        $('#rowOfServiceCMCAMC').html(tableData);

        ///////////////////////////////////////////////////////////////////////////////
        var tableData1="";
        $.each(data.serviceLogMasterCall, function(indexCall, itemCall){
            stts=(itemCall.serviceStatus==0?"In-Active":itemCall.serviceStatus==1?"Active":"Closed");
            //alert(stts);
            totalOrders+=1;
            tableData1+="<tr class='trCallClass"+(indexCall+1)+"'><td>"+itemCall.mendServiceId+"</td><td>"+itemCall.serviceType+"</td><td>"+itemCall.startDate+"</td><td>"+itemCall.endDate+"</td><td>"+itemCall.cusId+"</td><td>"+stts+"</td><td><input class='btn btn-primary' name='button' type='submit' style='width:100px' value='Call Register' id='callRegister' onClick=populateToggleCallRegister1('"+(indexCall+1)+"') /></td>";
            if((itemCall.pathOfServiceReport)!=null && (itemCall.pathOfServiceReport).length>0){
                tableData1+="<td><a href='"+itemCall.pathOfServiceReport+"'><img src='img/Report.png'/></a></td>";
            }else{
                tableData1+="<td>No Report</td>";
            }
            tableData1+="</tr>"+
            "<tr class='trIdCall"+(indexCall+1)+"' style='display:none'><td colspan='8'><table border=1> <tr> <td>Service Id </td>  <td><input type='text' class='form-control' name='mendServiceId' id='mendServiceId' value="+itemCall.mendServiceId+" readonly  /></td>  <td>Customer Id </td>  <td><input name='cusId' id='cusId' value="+itemCall.cusId+" readonly type='text' class='form-control' /></td>  <td>Start Date </td>  <td ><input type='text' class='form-control' id='startDate' name='startDate' value='"+itemCall.startDate+"'   onblur=validDate(this.value,'trIdCall"+(indexCall+1)+"','startDate') /></td>  <td>End Date </td>  <td><input name='endDate' id='endDate' value='"+itemCall.endDate+"' type='text' class='form-control' readonly   /></td></tr><tr>  <td>Service Eng. </td><td colspan='2'><input type='text' class='form-control' name='serviceEngineer' id='serviceEngineer' value='"+itemCall.serviceEngineer+"'></td>"+
            "<td>Alt Eng. </td>  <td colspan='2'><input  type='text' class='form-control'  name='altEngineer' id='altEngineer' value='"+itemCall.altEngineer+"'></td>  <td>Status</td><td>"+stts+"</td></tr><tr>  <td rowspan='2'>Remark</td>  <td colspan='2' rowspan='2'><textarea id='remark' name='remark' rows='2' class='form-control'>"+itemCall.remark+"</textarea></td>  <td>Product Id </td>  <td><input name='productId' id='productId' value="+itemCall.productId+" readonly type='text' class='form-control' /></td>"+
            "<td><input type='text' class='form-control' id='serialKeyV' name='serialKeyV'  readonly value='"+itemCall.serialKey+"' /></td> <td><select name='serialKey' id='serialKey'><option value=''>Select One</option>";
            $.each(data.productSLNoDTO, function(index2, item2)
            {
                tableData1+="<option value='"+item2.serialKey+"' >"+item2.serialKey+"</option>";
            });
            tableData1+="</select></td><td><form enctype='multipart/form-data' method='post' action='' id='attachfileformCall"+(indexCall+1)+"' name='attachfileformCall"+(indexCall+1)+"'><input type='file' id='fileNameCall' name='fileNameCall' onChange='chkFileTypeCall("+(indexCall+1)+");'/></form></td></tr><tr><td>Service Open Date</td><td><input name='dateSysDateOpen' id='dateSysDateOpen' type='text' class='form-control' value='"+itemCall.dateSysDateOpen+"'  /></td>  <td>Service  Date </td>  <td><input name='serviceDate' id='serviceDate' type='text' class='form-control' value='"+itemCall.serviceDate+"' /></td>   <td><input name='callLockBtnSubmit' class='btn btn-primary' type='button' value='Submit' onClick=callLockOfServiceCall('"+(indexCall+1)+"') /></td></tr></table></td></tr>";
        });
        $('#dynaTable').html(tableData1);
    }
}

function populateToggleCallRegister(index){
    if($('.trId'+index).is(':visible'))
    {
        $(".trId"+index+"").hide();
    }else{
        hidePurchaseOrderItemDetails(totalOrders);
        $(".trId"+index+"").show();
    }

}

function hidePurchaseOrderItemDetails(totalOrders)
{
    for(var i=1;i<=totalOrders;i++)
    {
        $('.trId'+i).hide();
    }
}

function populateToggleCallRegister1(index){
    if($('.trIdCall'+index).is(':visible'))
    {
        $(".trIdCall"+index+"").hide();
    }else{
        hidePurchaseOrderItemDetails1(totalOrders);
        $(".trIdCall"+index+"").show();
    }

}

function hidePurchaseOrderItemDetails1(totalOrders)
{
    for(var i=1;i<=totalOrders;i++)
    {
        $('.trIdCall'+i).hide();
    }
}
function addCallService(){
    var cId=$.trim($('#cId').val());
    if(cId==null || cId.length==0 ){
        alert("Pls Select The Cus Id !");
    }else{
        var date = new Date();
        var reqType="newCallService";
        var url="ServiceLogMasterServlet?refresh=" + date.getMilliseconds();
        $.ajax({
            type:"POST",
            url: url,
            dataType:"json",
            data:{
                reqType: reqType,
                cId : cId
            },
            success: function(data){
                if(data != null){
                    alert(data);
                    getListOfCustServceDetail();
                }else{
                    alert("none");
                }
            },
            error:function (jqXHR, textStatus, errorThrown){
                alert(errorThrown);
            }
        });
    }
}
function callLockOfService(row){
    var errorsInForm=validateServiceDetailEditForm(row);
    if(errorsInForm.length==0)
    {
        var altEngineer=$('.trId'+row+' #altEngineer').val();
        var mendServiceId=$('.trId'+row+' #mendServiceId').val();
        var serviceEngineer=$('.trId'+row+' #serviceEngineer').val();
        var remark=$('.trId'+row+' #remark').val();
        var serialKeyVT=$('.trId'+row+' #serialKeyV').val();
        var serviceDate=$('.trId'+row+' #serviceDate').val();
        var serialKey;
        if(serialKeyVT==null || serialKeyVT.length==0){
            serialKey=$('.trId'+row+' #serialKey').val();
        }
        else{
            if($('.trId'+row+' #serialKey').val()==null || $('.trId'+row+' #serialKey').val().length==0){
                serialKey=$('.trId'+row+' #serialKeyV').val();
            }else{
                serialKey=$('.trId'+row+' #serialKey').val();
            }
        }
        var date = new Date();
        $.ajax({
            type:"POST",
            url: "ServiceLogMasterServlet?refresh="+date.getMilliseconds(),
            dataType:"json",
            data:{
                reqType: "editServiceLog",
                mendServiceId : mendServiceId,
                serviceEngineer : serviceEngineer,
                altEngineer : altEngineer,
                remark : remark,
                serialKey : serialKey,
                serviceDate : serviceDate
            },
            success: function(data){
                alert(data.toString())
                window.location="call_register.jsp";
            },
            error:function (jqXHR, textStatus, errorThrown){
                alert(errorThrown);
            }
        });
    }
    else
    {
        alert(errorsInForm);
    }
}
function validateServiceDetailEditForm(rowNo)
{
    var editErrors='';
    var errorMsg=getErrorsInServiceEditForm(rowNo);
    if(errorMsg.length!=0)
    {
        editErrors='';
        editErrors+='Following errors occured:\n'
        editErrors+=errorMsg;
    }
    return editErrors;
}
function getErrorsInServiceEditForm(row)
{
    var errorMsg='';
    var altEngineer=$('.trId'+row+' #altEngineer').val();
    var serviceEngineer=$('.trId'+row+' #serviceEngineer').val();
    var serialKeyV=$('.trId'+row+' #serialKeyV').val();
    var serialKey=$('.trId'+row+' #serialKey').val();
    if(altEngineer==null || altEngineer.length==0)
    {
        errorMsg+='Enter Alt Engineer\'s Name\n';
    }
    if(serviceEngineer==null || serviceEngineer.length==0)
    {
        errorMsg+='Enter Service Engineer\'s Name\n';
    }
    if(serialKeyV==null || serialKeyV.length==0){

        if(serialKey==null || serialKey.length==0){
            errorMsg+='Select The Serial Key\n';
        }
    }
    return errorMsg;
}
function chkFileTypeSer(row){
    var ext=$('.trId'+row+' #fileNameSer').val().split('.').pop().toLowerCase();
    if($.inArray(ext, ['pdf']) == -1) {
        alert('invalid File Selection !');
        $('.trId'+row+' #fileNameSer').val("");
    }else{

        var mendServiceId=$('.trId'+row+' #mendServiceId').val()
        var formElement = $("[name='attachfileform"+row+"']")[0];
        var fd = new FormData(formElement);
        var fileInput = $('.trId'+row+' #fileNameSer')[0];
        fd.append('file', fileInput.files[0] );
        console.log(fd);
        $.ajax({
            url: 'fileUploadSer?id='+mendServiceId,
            data: fd,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){
                alert(data);
                getListOfCustServceDetail();
            }
        });
    }
}

function chkFileTypeCall(row){
    var ext=$('.trIdCall'+row+' #fileNameCall').val().split('.').pop().toLowerCase();
    if($.inArray(ext, ['pdf']) == -1) {
        alert('invalid File Selection !');
        $('.trIdCall'+row+' #fileNameCall').val("");
    }else{

        var mendServiceId=$('.trIdCall'+row+' #mendServiceId').val()
        var formElement = $("[name='attachfileformCall"+row+"']")[0];
        var fd = new FormData(formElement);
        var fileInput = $('.trIdCall'+row+' #fileNameCall')[0];
        fd.append('file', fileInput.files[0] );
        console.log(fd);
        $.ajax({
            url: 'fileUploadSer?id='+mendServiceId,
            data: fd,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){
                alert(data);
                getListOfCustServceDetail();
            }
        });
    }
}

function callLockOfServiceCall(row){
    var errorsInForm=validateServiceDetailEditFormCall(row);
    if(errorsInForm.length==0)
    {
        var altEngineer=$('.trIdCall'+row+' #altEngineer').val();
        var mendServiceId=$('.trIdCall'+row+' #mendServiceId').val();
        var serviceEngineer=$('.trIdCall'+row+' #serviceEngineer').val();
        var remark=$('.trIdCall'+row+' #remark').val();
        var serialKeyVT=$('.trIdCall'+row+' #serialKeyV').val();
        var serviceDate=$('.trIdCall'+row+' #serviceDate').val();
        var serialKey;
        if(serialKeyVT==null || serialKeyVT.length==0){
            serialKey=$('.trIdCall'+row+' #serialKey').val();
        }
        else{
            if($('.trIdCall'+row+' #serialKey').val()==null || $('.trIdCall'+row+' #serialKey').val().length==0){
                serialKey=$('.trIdCall'+row+' #serialKeyV').val();
            }else{
                serialKey=$('.trIdCall'+row+' #serialKey').val();
            }
        }
        var date = new Date();
        $.ajax({
            type:"POST",
            url: "ServiceLogMasterServlet?refresh="+date.getMilliseconds(),
            dataType:"json",
            data:{
                reqType: "editServiceLog",
                mendServiceId : mendServiceId,
                serviceEngineer : serviceEngineer,
                altEngineer : altEngineer,
                remark : remark,
                serialKey : serialKey,
                serviceDate : serviceDate
            },
            success: function(data){
                alert(data.toString())
                window.location="call_register.jsp";
            },
            error:function (jqXHR, textStatus, errorThrown){
                alert(errorThrown);
            }
        });
    }
    else
    {
        alert(errorsInForm);
    }
}
function validateServiceDetailEditFormCall(rowNo)
{
    var editErrors='';
    var errorMsg=getErrorsInServiceEditFormCall(rowNo);
    if(errorMsg.length!=0)
    {
        editErrors='';
        editErrors+='Following errors occured:\n'
        editErrors+=errorMsg;
    }
    return editErrors;
}

function getErrorsInServiceEditFormCall(row)
{
    var errorMsg='';
    var altEngineer=$('.trIdCall'+row+' #altEngineer').val();
    var serviceEngineer=$('.trIdCall'+row+' #serviceEngineer').val();
    var serialKeyV=$('.trIdCall'+row+' #serialKeyV').val();
    var serialKey=$('.trIdCall'+row+' #serialKey').val();
    //alert(altEngineer);
    // alert(serviceEngineer);
    if(altEngineer==null || altEngineer.length==0)
    {
        errorMsg+='Enter Alt Engineer\'s Name\n';
    }
    if(serviceEngineer==null || serviceEngineer.length==0)
    {
        errorMsg+='Enter Service Engineer\'s Name\n';
    }
    if(serialKeyV==null || serialKeyV.length==0){

        if(serialKey==null || serialKey.length==0){
            errorMsg+='Select The Serial Key\n';
        }
    }
    return errorMsg;
}