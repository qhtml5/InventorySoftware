function getCMCAMC(){
    var installDate=$('#installDate').val();
    if(installDate!=null && installDate.length>0){
        var type=$('#AMC-CMC').val();
        if(type=="CMC"){
            $("#cmcamc").show();
            getExpdDateOFCMCAMC();
        }else if(type=="AMC"){
            $("#cmcamc").show();
            getExpdDateOFCMCAMC();
        }else{
            $("#cmcamc").hide();
        }
    }else{
        alert("pls select the Installation date !");
    }
              
}
function populateProductQty(){
    $('#productQty').children().remove().end().append('<option value="0">Select One</option>') ;
    for ( var i = 1; i <= 10; i++ ){
        $('#productQty').append($("<option></option>").attr("value",i).text(i));
    }

}
function onChangeGoodsQuantity(){
    var nosGoods = parseInt($.trim($('#productQty').val()));

    var rowhtml="";
    if(nosGoods>0){

        for(var i=0; i<nosGoods; i++){

            rowhtml +="<tr class='slNoRow"+(i+1)+"'><td width='29%'>SL No."+(i+1)+"</td><td width='71%'><input type='text' name='slNo"+(i+1)+"' id='slNo"+(i+1)+"'/></td>";
        }
    }
    $('#dynaTable').html(rowhtml);
}
function goodsListPapulate(){
    var date = new Date();
    var reqType="getProductList";
    var url="ProductManagementServlet?refresh=" + date.getMilliseconds();
    $.ajax({
        type:"POST",
        url: url,
        dataType:"json",
        data:{
            reqType: reqType
        },
        success: function(data){
            if(data != null){
                populateProductList(data);
            }
        },
        error:function (jqXHR, textStatus, errorThrown){
            alert(errorThrown);
        }
    });
}
function populateProductList(data){
    $('#productId').children().remove().end().append('<option value="">Select One</option>') ;
    //alert("!!!");
    $.each(data, function(index, item)
    {
        // alert(item.productId);
        $('#productId').append($("<option></option>").attr("value",item.productId).text(item.productId+'-'+item.productName));
    });

}
function getExpdDate(){
    var installDate = $.trim($('#installDate').val());
    if (installDate === null || installDate.length === 0) {
        $('#installDate').val("");
        $('#warrantyExpDateCompany').val("");
    }else{
        var warrantyTermCompany=parseInt($.trim($('#warrantyTermCompany').val()));
        if (warrantyTermCompany === null || warrantyTermCompany.length === 0) {
            alert("Pls Select Company Warranty Period");
            $('#warrantyExpDateCompany').val("");
        }
        else{
            var date = new Date();
            var reqType = "getExpDate";
            var url = "CustomerServlet?refresh=" + date.getMilliseconds();
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: {
                    reqType: reqType,
                    installDate: installDate,
                    warrantyTermCompany : warrantyTermCompany
                },
                success: function(data) {
                    // alert(data.toString());
                    $('#warrantyExpDateCompany').val(data.toString());
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
}
function getExpdDateOFCMCAMC(){
    var warrantyExpDateCompany = $.trim($('#warrantyExpDateCompany').val());
    if (warrantyExpDateCompany === null || warrantyExpDateCompany.length === 0) {
        alert("Exp Date Company Warranty");
        $('#warrantyExpDateAmcCmc').val("");
    }else{
        var warrantyTermCmcAmc=parseInt($.trim($('#warrantyTermCmcAmc').val()));
        // alert(warrantyTermCompany);
        if (warrantyTermCmcAmc === null || warrantyTermCmcAmc.length === 0) {
            alert("Pls Select Warranty Period");
            $('#warrantyExpDateAmcCmc').val("");
        }else{
            var date = new Date();
            var reqType = "getExpDate";
            var url = "CustomerServlet?refresh=" + date.getMilliseconds();
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: {
                    reqType: reqType,
                    installDate: warrantyExpDateCompany,
                    warrantyTermCompany : warrantyTermCmcAmc
                },
                success: function(data) {
                    // alert(data.toString());
                    $('#warrantyExpDateAmcCmc').val(data.toString());
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    }
}
function chkServiceTerm()
{
    var warrantyTermCmcAmc=parseInt($.trim($('#warrantyTermCmcAmc').val()));
    var serviceTerm=parseInt($.trim($('#serviceTerm').val()));
    var mod= warrantyTermCmcAmc%serviceTerm;
    if(mod!=0){
        $('#serviceTerm').val(1);
    }
}
function customerDTO(){
    this.cusName=null;
    this.cusAddress=null;
    this.cusPostalCode=null;
    this.cusState=null;
    this.cusPhoneNo=null;
    this.cusContactPerson=null;
    this.goodsDesc=null;
}

function getCustomerDetails(){
    var cusDetail=new customerDTO();
    cusDetail.cusName=$.trim($('#cusName').val());
    cusDetail.cusAddress=$.trim($('#cusAddress').val());
    cusDetail.cusPostalCode=$.trim($('#cusPostalCode').val());
    cusDetail.cusState=$.trim($('#cusState').val());
    cusDetail.cusPhoneNo=$.trim($('#cusPhoneNo').val());
    cusDetail.cusContactPerson=$.trim($('#cusContactPerson').val());
    cusDetail.goodsDesc=$.trim($('#goodsDesc').val());
    return cusDetail;
}
function ProductSLNoMultiple(){
    this.productId=null;
    this.serialKey=[];
}
function getProductSLNoMultiple(){
    var productSLNoMultiple = new ProductSLNoMultiple();
    productSLNoMultiple.productId=parseInt($.trim($('#productId').val()));
    var productQty = parseInt($.trim($('#productQty').val()));
    for(var i=1;i<=productQty;i++){
        productSLNoMultiple.serialKey.push($.trim($('#slNo'+i).val()));
    }
    return productSLNoMultiple;
}
function MainServiceDetailDTO(){
    this.installDate=null;
    this.cmcWarranty=null;
    this.amcWarranty=null;
    this.warrantyTermCompany=null;
    this.warrantyTermCmcAmc=null;
    this.warrantyExpDateCompany=null;
    this.warrantyExpDateAmcCmc=null;
    this.mendatoryServicePerServiceTerm=null;
    this.serviceTerm=null;
    this.serviceEngineer=null;
    this.invoiceDate=null;
    this.productId=null;
    this.productQty=null;

}
function getMainServiceDetailDTO(){
    var mainServiceDetailDTO =new MainServiceDetailDTO();
    mainServiceDetailDTO.installDate=$.trim($('#installDate').val());

    if($('#AMC-CMC').val()==="AMC"){
        // alert("AMC")
        mainServiceDetailDTO.cmcWarranty=parseInt(0);
        mainServiceDetailDTO.amcWarranty=parseInt(1);
        mainServiceDetailDTO.warrantyTermCmcAmc=parseInt($.trim($('#warrantyTermCmcAmc').val()));
        mainServiceDetailDTO.warrantyExpDateAmcCmc=$.trim($('#warrantyExpDateAmcCmc').val());
        mainServiceDetailDTO.mendatoryServicePerServiceTerm=parseInt($.trim($('#mendatoryServicePerServiceTerm').val()));
        mainServiceDetailDTO.serviceTerm=parseInt($.trim($('#serviceTerm').val()));
    }else if($('#AMC-CMC').val()==="CMC"){
        mainServiceDetailDTO.cmcWarranty=parseInt(1);
        mainServiceDetailDTO.amcWarranty=parseInt(0);
        mainServiceDetailDTO.warrantyTermCmcAmc=parseInt($.trim($('#warrantyTermCmcAmc').val()));
        mainServiceDetailDTO.warrantyExpDateAmcCmc=$.trim($('#warrantyExpDateAmcCmc').val());
        mainServiceDetailDTO.mendatoryServicePerServiceTerm=parseInt($.trim($('#mendatoryServicePerServiceTerm').val()));
        mainServiceDetailDTO.serviceTerm=parseInt($.trim($('#serviceTerm').val()));
    }
    else{
        mainServiceDetailDTO.cmcWarranty=parseInt(0);
        mainServiceDetailDTO.amcWarranty=parseInt(0);
        mainServiceDetailDTO.warrantyTermCmcAmc=parseInt(0);
        mainServiceDetailDTO.warrantyExpDateAmcCmc="0000-00-00";
        mainServiceDetailDTO.mendatoryServicePerServiceTerm=parseInt(0);
        mainServiceDetailDTO.serviceTerm=parseInt(0);
    }
    mainServiceDetailDTO.warrantyTermCompany=parseInt($.trim($('#warrantyTermCompany').val()));
    mainServiceDetailDTO.warrantyExpDateCompany=$.trim($('#warrantyExpDateCompany').val());
    mainServiceDetailDTO.serviceEngineer=$.trim($('#serviceEngineer').val());
    mainServiceDetailDTO.invoiceDate=$.trim($('#invoiceDate').val());
    mainServiceDetailDTO.productId=parseInt($.trim($('#productId').val()));
    mainServiceDetailDTO.productQty=parseInt($.trim($('#productQty').val()));
    return mainServiceDetailDTO;
}
var errorMsg;
function validateCustomerDetails()
{
    errorMsg = '';
    var isValid = false;
    var blankFields = getBlankFieldsOfCustomerDetail();
    var invalidFields = getInvalidFieldsOfCustomerDetail();
    if (blankFields.length !== 0) {
        errorMsg += 'Please enter values for the fields: \n' + blankFields;
    }
    if (invalidFields.length !== 0)
    {
        errorMsg += "\nThe following values are invalid: \n" + invalidFields;
    }
    if (errorMsg.length === 0)
    {
        isValid = true;
    }
    return isValid;
}
function getBlankFieldsOfCustomerDetail()
{
    var blankFields = '';
    var productId = $.trim($('#productId').val());
    if (productId === null || productId.length === 0) {
        blankFields += " Product Code \n";
    }
    var cusName = $.trim($('#cusName').val());
    if (cusName === null || cusName.length === 0) {
        blankFields += " Customer Name \n";
    }
    var cusPhoneNo = $.trim($('#cusPhoneNo').val());
    if (cusPhoneNo === null || cusPhoneNo.length === 0) {
        blankFields += " Customer Phone No \n";
    }
    var cusPostalCode = $.trim($('#cusPostalCode').val());
    if (cusPostalCode === null || cusPostalCode.length === 0) {
        blankFields += " Customer Postal Code \n";
    }
    var cusAddress = $.trim($('#cusAddress').val());
    if (cusAddress === null || cusAddress.length === 0) {
        blankFields += " Customer Address \n";
    }
    var invoiceDate = $.trim($('#invoiceDate').val());
    if (invoiceDate === null || invoiceDate.length === 0) {
        blankFields += " Customer Invoice Date \n";
    }
    var productQty = parseInt($.trim($('#productQty').val()));
    //alert(productQty);
    if (productQty <= 0) {
        blankFields += " Customer Product Qty, \n";
    }
    else{
        //blankFields += " Customer Product Qty \n";
        for(var i=1;i<=productQty;i++){
            if ($.trim($('#slNo'+i).val()) === null || $.trim($('#slNo'+i).val()).length === 0) {
                blankFields += " SL No."+i+" \n";
            }
        }
    }
    return blankFields;
}
function getInvalidFieldsOfCustomerDetail()
{
    var invalidFields = '';
    var cusPhoneNo = $.trim($('#cusPhoneNo').val());
    if (cusPhoneNo.length !== null && cusPhoneNo.length > 0)
    {
        if (isNaN(cusPhoneNo) || cusPhoneNo < 0 || cusPhoneNo.length > 12 || cusPhoneNo.length < 8)
        {
            invalidFields += " Customer Phone Number \n";
        }
    }
    return invalidFields;
}
function regNewCust(){
    if(validateCustomerDetails()){
        var cusDetail=getCustomerDetails();
        var slNo=getProductSLNoMultiple();
        var getMainServiceDetail=getMainServiceDetailDTO();
        if (cusDetail !== null && slNo !== null && getMainServiceDetail !== null) {
            var date = new Date();
            var reqType = "createNewCustomer";
            var url = "CustomerServlet?refresh=" + date.getMilliseconds();
            var customerDetails = JSON.stringify(cusDetail);
            var productSLNo=JSON.stringify(slNo);
            var serviceDetail=JSON.stringify(getMainServiceDetail);
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: {
                    reqType: reqType,
                    customerDetails: customerDetails,
                    productSLNo:productSLNo,
                    serviceDetail:serviceDetail
                },
                success: function(data) {
                    if(data==="Not Done"){
                        alert(data.toString());
                        window.location="index.jsp";
                    }else{
                        if($('#fileName').val().length>0){
                            fileUpload(data);
                        }else{
                            alert(data.toString());
                            window.location="index.jsp";
                        }
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }else{
            alert("Invalid inputs");
        }
    }else{
        alert(errorMsg);
    }
}
function submitProductNewCustomerUI(){
    var productName=$.trim($("#productName").val());
    var productDesc=$.trim($("#productDesc").val());
    if(productName!=null && productName.length>0 && productDesc!=null && productDesc.length>0){
        //$('#newProductBTN').attr("disabled","disabled");
        var date = new Date();
        var reqType="NewProductRegister";
        var url="ProductManagementServlet?refresh=" + date.getMilliseconds();
        $.ajax({
            type:"POST",
            url: url,
            dataType:"json",
            data:{
                reqType: reqType,
                productName : productName,
                productDesc : productDesc
            },
            success: function(data){
                alert(data);
                goodsListPapulate();
                $("#productName").val("");
                $("#productDesc").val("");
            //$("#rowOfNewGoods").hide();
            },
            error:function (jqXHR, textStatus, errorThrown){
                alert(errorThrown);
            }
        });
    }else{
        alert("Sorry! Please Fill all the Field!");
    }
}
function chkFileType(){
    var ext = $('#fileName').val().split('.').pop().toLowerCase();
    if($.inArray(ext, ['pdf']) == -1) {
        alert('invalid File Selection !');
        $('#fileName').val("");
    }
}
function chkFileTypeSubmit(){
    var ext = $('#exampleInputFile').val().split('.').pop().toLowerCase();
    if($.inArray(ext, ['pdf']) == -1) {
        return false;
    }else{
        return true;
    }
}
function fileUpload(id){
    var formElement = $("[name='attachfileform']")[0];
    var fd = new FormData(formElement);
    var fileInput = $("[name='fileName']")[0];
    fd.append('file', fileInput.files[0] );
    console.log(fd);
    $.ajax({
        url: 'dododododdodododododo?id='+id,
        data: fd,
        processData: false,
        contentType: false,
        type: 'POST',
        success: function(data){
            alert("File  "+data);
            window.location="index.jsp";
        }
    });
}