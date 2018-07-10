function customerListPapulateListPage(){
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
          populateCidListListPage(data);
         }

        },
        error:function (jqXHR, textStatus, errorThrown){
            alert(errorThrown);
        }
    });
}
function populateCidListListPage(data){
    var oTable = $('#example1').dataTable();
    console.log(data);
    oTable.fnClearTable();
    $.each(data, function(index, item)
    {
        oTable.fnAddData([
            item.cusId,
            item.cusName,
            item.cusPhoneNo,
            item.cusAddress,
            "<button type='button' class='btn btn-primary' onclick='getCustDetail("+item.cusId+")'>View/Edit</button>"
            ]);
    });
}

function getCustDetail(cusId){
    window.location="cusEdit.jsp?cusId="+cusId;
}