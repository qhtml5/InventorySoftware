function login(){
    var uId=$.trim($("#uId").val());
    var pass=$.trim($("#pass").val());
    if(uId!=null && uId.length>0 && pass!=null && pass.length>0){
        var date = new Date();
        var reqType="LoginChk";
        var url="LoginManagementServlet?refresh=" + date.getMilliseconds();
        $.ajax({
            type:"POST",
            url: url,
            dataType:"json",
            data:{
                reqType: reqType,
                uId : uId,
                pass : pass
            },
            success: function(data){
                    //alert(data);
                  window.location=data;
            },
            error:function (jqXHR, textStatus, errorThrown){
                alert(errorThrown);
            }
        });
    }else{
        alert("Sorry! Please Fill all the Field!");
    }
}


