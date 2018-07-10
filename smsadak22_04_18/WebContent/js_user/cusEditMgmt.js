function updateCusInfo(){
    if(validateCustomerDetails()){
        var goodsDesc=$.trim($('#goodsDesc').val());
        var cusName=$.trim($('#cusName').val());
        var cusAddress=$.trim($('#cusAddress').val());
        var cusContactPerson=$.trim($('#cusContactPerson').val());
        var cusPhoneNo=$.trim($('#cusPhoneNo').val());
        var cusPostalCode=$.trim($('#cusPostalCode').val());
        var serviceEngineer =$.trim($('#serviceEngineer').val());
        var customerId=$.trim($('#customerId').val());
        var date = new Date();
        var reqType = "editCustomerInformation";
        var url = "CustomerServlet?refresh=" + date.getMilliseconds();
        $.ajax({
            type: "POST",
            url: url,
            dataType: "json",
            data: {
                reqType: reqType,
                goodsDesc : goodsDesc,
                cusName : cusName,
                cusAddress : cusAddress,
                cusContactPerson : cusContactPerson,
                cusPhoneNo : cusPhoneNo,
                cusPostalCode : cusPostalCode,
                serviceEngineer : serviceEngineer,
                customerId : customerId
            },
            success: function(data) {
                alert(data);
                window.location="listCust.jsp";
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            }
        });
    }else{
        alert(errorMsg);
    }
}
function getBlankFieldInEditPage(){
    var blankFields = '';
    var goodsDesc=$.trim($('#goodsDesc').val());
    if (goodsDesc === null || goodsDesc.length === 0) {
        blankFields += " Goods Description  \n";
    }
    var cusName=$.trim($('#cusName').val());
    if (cusName === null || cusName.length === 0) {
        blankFields += " Customer Name  \n";
    }
    var cusAddress=$.trim($('#cusAddress').val());
    if (cusAddress === null || cusAddress.length === 0) {
        blankFields += " Customer Address  \n";
    }
    var cusContactPerson=$.trim($('#cusContactPerson').val());
    if (cusContactPerson === null || cusContactPerson.length === 0) {
        blankFields += " Contact Person  \n";
    }
    var cusPhoneNo=$.trim($('#cusPhoneNo').val());
    if (cusPhoneNo === null || cusPhoneNo.length === 0) {
        blankFields += " Contact Number \n";
    }
    var cusPostalCode=$.trim($('#cusPostalCode').val());
    if (cusPostalCode === null || cusPostalCode.length === 0) {
        blankFields += " Postal Code \n";
    }
    var serviceEngineer =$.trim($('#serviceEngineer').val());
    if (serviceEngineer === null || serviceEngineer.length === 0) {
        blankFields += " Service Engineer \n";
    }
    return blankFields;
}
var errorMsg;
function validateCustomerDetails()
{
    errorMsg = '';
    var isValid = false;
    var blankFields = getBlankFieldInEditPage();
    if (blankFields.length !== 0) {
        errorMsg += 'Please enter values for the fields: \n' + blankFields;
    }
    if (errorMsg.length === 0)
    {
        isValid = true;
    }
    return isValid;
}