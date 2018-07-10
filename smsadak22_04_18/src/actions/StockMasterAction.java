package actions;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import util.CurrentDate;
import util.ExcelExport;
import util.Messages;
import com.opensymphony.xwork2.ActionSupport;
import dTO.ItemCategoryTypeMasterDTO;
import dTO.OpenigAndClosingStockDTO;
import dTO.PurchaseLedgerDto;
import dTO.StockMasterDTO;
import dTO.SupplierMasterDTO;
import dao.ConnectCore;
import dao.DaoFactory;
import dao.ItemMasterAndTypeDAO;
import dao.SchemeMasterDao;
import dao.StockMasterDAO;
import dao.SupplierMasterDAO;

public class StockMasterAction extends ActionSupport {
    

private static final long serialVersionUID = 1L;
StockMasterDTO stockDTO=new StockMasterDTO();
List<StockMasterDTO> stockDTOList=new ArrayList<StockMasterDTO>();
List<SupplierMasterDTO> supList =new ArrayList<SupplierMasterDTO>();
List<ItemCategoryTypeMasterDTO> iCateoryList=new LinkedList<ItemCategoryTypeMasterDTO>();
List<ItemCategoryTypeMasterDTO> itemList=new LinkedList<ItemCategoryTypeMasterDTO>();
List<ItemCategoryTypeMasterDTO> itemSizeList=new ArrayList<ItemCategoryTypeMasterDTO>();
List<ItemCategoryTypeMasterDTO> brandList=new LinkedList<ItemCategoryTypeMasterDTO>();
ItemCategoryTypeMasterDTO idto= new ItemCategoryTypeMasterDTO();
List<PurchaseLedgerDto> purchaselist=new ArrayList<PurchaseLedgerDto>();
List<OpenigAndClosingStockDTO> closingStockList=new ArrayList<OpenigAndClosingStockDTO>();

public synchronized List<OpenigAndClosingStockDTO> getClosingStockList() {
	return closingStockList;
}
public synchronized void setClosingStockList(
		List<OpenigAndClosingStockDTO> closingStockList) {
	this.closingStockList = closingStockList;
}
public synchronized List<ItemCategoryTypeMasterDTO> getItemSizeList() {
	return itemSizeList;
}
public synchronized void setItemSizeList(
		List<ItemCategoryTypeMasterDTO> itemSizeList) {
	this.itemSizeList = itemSizeList;
}
public synchronized List<SupplierMasterDTO> getSupList() {
	return supList;
}
public synchronized void setSupList(List<SupplierMasterDTO> supList) {
	this.supList = supList;
}
public static synchronized long getSerialversionuid() {
	return serialVersionUID;
}
public synchronized StockMasterDTO getStockDTO() {
	return stockDTO;
}
public synchronized void setStockDTO(StockMasterDTO stockDTO) {
	this.stockDTO = stockDTO;
}
public synchronized List<StockMasterDTO> getStockDTOList() {
	return stockDTOList;
}
public synchronized void setStockDTOList(List<StockMasterDTO> stockDTOList) {
	this.stockDTOList = stockDTOList;
}
public List<ItemCategoryTypeMasterDTO> getiCateoryList() {
	return iCateoryList;
}

public void setiCateoryList(List<ItemCategoryTypeMasterDTO> iCateoryList) {
	this.iCateoryList = iCateoryList;
}

public List<ItemCategoryTypeMasterDTO> getItemList() {
	return itemList;
}

public void setItemList(List<ItemCategoryTypeMasterDTO> itemList) {
	this.itemList = itemList;
}

public List<ItemCategoryTypeMasterDTO> getBrandList() {
	return brandList;
}

public void setBrandList(List<ItemCategoryTypeMasterDTO> brandList) {
	this.brandList = brandList;
}
public ItemCategoryTypeMasterDTO getIdto() {
	return idto;
}

public void setIdto(ItemCategoryTypeMasterDTO idto) {
	this.idto = idto;
}

public List<PurchaseLedgerDto> getPurchaselist() {
	return purchaselist;
}
public void setPurchaselist(List<PurchaseLedgerDto> purchaselist) {
	this.purchaselist = purchaselist;
}
@Override
public String execute() throws SQLException
{
    java.sql.Connection con=null;
	try
	{
		con=ConnectCore.getConnection();
		HttpServletRequest request=ServletActionContext.getRequest();
		DaoFactory dfact=new DaoFactory();
		SupplierMasterDAO sdao=dfact.CreateSupplierManager();
		supList=sdao.getAllSupplierDetails();
		System.out.println("list found---"+supList.size());
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		
		iCateoryList=idao.getAllItemType();
		itemList=idao.getAllItemByCompanyId();
		
		brandList=idao.getAllBrandByCompanyId();
		itemSizeList=idao.getAllSizeByCompanyId();
		request.setAttribute("listSize",itemSizeList.size() );
	}
	catch(Exception e)
	{
		System.out.println("An exception found.."+e);
	}
	finally
	{   if(con!=null)
	{
		con.close();
		System.out.println("connection closed");
	}
	}
	return SUCCESS;
}
//________________________________________________ Stock Calculation Function: Start	_______________________________________________________________	
	public String stockCall()
	{
		
		stockDTO.setPurchaseDate(CurrentDate.getOnlyDateWithMySQLFORMAT());
		System.out.println("Date found"+stockDTO.getPurchaseDate());
		try
		{
			DaoFactory dfact=new DaoFactory();
			SupplierMasterDAO sdao=dfact.CreateSupplierManager();
			supList=sdao.getAllSupplierDetails();
			System.out.println("list found---"+supList.size());
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
	}
	
	public String checkDupBill(){
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String bill=request.getParameter("bill");
//		String supplierId=request.getParameter("supplierId");
		try
		{
		DaoFactory dfact =new DaoFactory();
		StockMasterDAO sdao=dfact.createStockManager();
		stockDTOList=sdao.getAllStockDetailsByBillNoANDSupplierID(bill, "");
		System.out.println("size"+stockDTOList.size());
		if(stockDTOList.size()!=0){
			result=SUCCESS;
			request.setAttribute("Msg", "true");
			
		}else{
			result=SUCCESS;
			request.setAttribute("Msg", "false");
		}
		
		}catch(Exception e){
			System.out.println("ex= "+e);
		}
		
		
		
		return result;
		
	}
	
	public String addStockDetails() throws SQLException
	{
		Connection con=null;
		String returnS=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String itemname[]=request.getParameterValues("article[]");
		String qty[]=request.getParameterValues("qty[]");
		String brate[]=request.getParameterValues("brate[]");
		String tot[]=request.getParameterValues("tot[]");
		String itemSize[]=request.getParameterValues("itemSize[]");
		int itemsLength=itemname.length;
		System.out.println(itemname.length);
		DaoFactory dfact=new DaoFactory();
		try
		{
			StockMasterDAO sdao=dfact.createStockManager();
			con=ConnectCore.getConnection();
			for(int i=0;i<itemsLength;i++)
			{
				
				StockMasterDTO stockDTOs=new StockMasterDTO();
				stockDTOs.setItemIds(itemname[i]);
				stockDTOs.setQty(qty[i]);
				stockDTOs.setBuyRate(brate[i]);
				stockDTOs.setItemTotal(tot[i]);
				stockDTOs.setItemSize(itemSize[i]);
				stockDTOs.setPurchaseDate(stockDTO.getPurchaseDate());
				String supid=request.getParameter("stockDTO.supplierId");
				supid=supid.trim();
				stockDTOs.setSupplierId(Integer.parseInt(supid));
				String billNo=request.getParameter("stockDTO.billNo");
				if(billNo=="" || billNo==null)
				{
					stockDTOs.setBillNo("NA");	
				}
				else
				{
					stockDTOs.setBillNo(billNo);	
				}
				
				String challanNo=request.getParameter("stockDTO.challanNo");
				if(challanNo=="" || challanNo==null)
				{
					stockDTOs.setChallanNo("NA");	
				}
				else
				{
					stockDTOs.setChallanNo(request.getParameter("stockDTO.challanNo"));	
				}
				stockDTOs.setSubTot(request.getParameter("stockDTO.subTot"));
				stockDTOs.setLessUnitScheme(request.getParameter("stockDTO.lessUnitScheme"));
				stockDTOs.setDiscounts(request.getParameter("stockDTO.discounts"));
				stockDTOs.setVat(request.getParameter("stockDTO.vat"));
				stockDTOs.setCst(request.getParameter("stockDTO.cst"));
				stockDTOs.setWaybill(request.getParameter("stockDTO.waybill"));
				stockDTOs.setLorryFreight(request.getParameter("stockDTO.lorryFreight"));
				stockDTOs.setGrandTot(request.getParameter("stockDTO.grandTot"));
				System.out.println("vat= "+stockDTOs.getVat());
				System.out.println("cst= "+stockDTOs.getCst());
				System.out.println("wb= "+stockDTOs.getWaybill());
				
				stockDTOs.setGstrate(request.getParameter("stockDTO.vat"));
				stockDTOs.setGstamt(request.getParameter("gstamt"));
				stockDTOs.setCgstrate(request.getParameter("cgstrate"));
				stockDTOs.setCgstamt(request.getParameter("cgstamt"));
				
				stockDTOs.setSgstrate(request.getParameter("sgstrate"));
				stockDTOs.setSgstamt(request.getParameter("sgstamt"));
				
				stockDTOs.setIgstrate(request.getParameter("stockDTO.igstrate"));
				stockDTOs.setIgstamt(request.getParameter("igstamt"));
				
				if(Double.parseDouble(request.getParameter("stockDTO.lessUnitScheme"))>0)
				{
					stockDTOs.setDiscountamt(request.getParameter("stockDTO.lessUnitScheme"));
				}
				
				stockDTOList.add(stockDTOs);
			}
			
			boolean result=sdao.saveStockDetails(stockDTOList);
			if(result)
			{   
			
			StockMasterDTO stockDto= new StockMasterDTO();
			stockDto.setBillNo("NA");
			stockDto.setsPaidAmt("0");
			stockDto.setChequeNo("NA");
			stockDto.setChequeBank("NA");
			stockDto.setsPayMode("NA");
			stockDto.setPurchaseDate(request.getParameter("stockDTO.purchaseDate"));
			stockDto.setGrandTot( request.getParameter("stockDTO.grandTot"));
			
			stockDto.setSupplierId(Integer.parseInt(request.getParameter("stockDTO.supplierId")));
			stockDto.setDueAmt(request.getParameter("stockDTO.grandTot"));
			boolean paymentresult=dfact.createSupplierPayManager().saveSupplierPaymentfromStockSave(stockDto);
			
			
			if(paymentresult)
			{
				request.setAttribute("Messages", Messages.stockSaveSuccesfully);	
				returnS=SUCCESS;
			}
			else
			{
				
			}
			
	
				
			}
			else
			{request.setAttribute("Messages", Messages.errorSavingSupply);}
		}
		catch(Exception e)
		{
			request.setAttribute("Messages", Messages.displayError(e.toString()));
			System.out.println("An exception found.."+e);
			e.printStackTrace();
		}
		finally
		{
			if(con!=null)
			{
				con.close();
			}
		}
		
		return returnS;
	}
	
	public String supplierComboCall()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		
		String supname=(String)request.getParameter("supname");
		supname=supname.trim();
		System.out.println("suppliername found"+supname);
		try
		{
			DaoFactory dfact=new DaoFactory();
			SupplierMasterDAO sdao=dfact.CreateSupplierManager();
			supList=sdao.getAllSupplierDetailsBySUPNAME(supname);
			System.out.println("list found---"+supList.size());
			
			int size=supList.size();
			if(size==0)
			{
		     supList=new ArrayList<SupplierMasterDTO>();
		     supList=sdao.getAllSupplierDetails();
			}
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		
		return SUCCESS;
	}
	
	public String getArticleName() throws SQLException{
		HttpServletRequest request=ServletActionContext.getRequest();
		String articleCode=(String)request.getParameter("articleCode");
		articleCode=articleCode.trim();
		System.out.println("articleCode= "+articleCode);
		java.sql.Connection con=null;
		try
		{
			con=ConnectCore.getConnection();
			DaoFactory dfact=new DaoFactory();
			ItemMasterAndTypeDAO sdao=dfact.createItemMasterManager();
			idto=sdao.getItemByCompanyIdItemId(articleCode);
			System.out.println("item Name= "+idto.getItemName());
			if(idto.getItemName() == null){
				request.setAttribute("Msg", "No Data Found");
			} else{
				request.setAttribute("Msg", idto.getItemName());				
			}

		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		finally
		{
			if(con!=null)
			{
			con.close();
			}
		}
		
		return SUCCESS;
	}
	
	public String addItemFromStock()
	{
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		/*System.out.println("iName"+request.getParameter("iName"));
		System.out.println("itemTypeId"+request.getParameter("itemTypeId"));
		System.out.println("supplierId"+request.getParameter("supplierId"));
		System.out.println("itemBrandId"+request.getParameter("itemBrandId"));
		System.out.println("itemUnit"+request.getParameter("itemUnit"));
		System.out.println("iMrp"+request.getParameter("iMrp"));*/
		
		Boolean saveresult=false;
		
		try
		{
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		//idto.setItemMrp(request.getParameter("iMrp"));
		String itemid[]=request.getParameterValues("itemCode");
		String itemmrp[]=request.getParameterValues("itemMrp");
		
		
		
		for(int i=0;i<itemid.length;i++)
		{
			idto.setItemName(request.getParameter("iName"));
			idto.setItemTypeID(Integer.parseInt(request.getParameter("itemTypeId")));
			idto.setItemBrandId(Integer.parseInt(request.getParameter("itemBrandId")));
			idto.setItemUnit(request.getParameter("itemUnit"));
			idto.setItemId(itemid[i]);
			idto.setItemMrp(itemmrp[i]);
			saveresult=idao.saveItemDetails(idto);
			
			
			
		}
		
		
		
		
	
		if(saveresult)
		{
			String lastItemCode=idao.getLastItemCode();
			result=SUCCESS;
			request.setAttribute("Msg", "<p style='color:green;'>Item Details Saved Succcessfully!<br/>Last Article Code Generated: "+lastItemCode+"</p>");
		}
		else{
			result=ERROR;
			request.setAttribute("Msg", Messages.Error);
		}
		}
		catch(Exception e)
		{
			System.out.println("An error Occur" + e);
		}
		
		return result;
	}
	
	public String addItemFromStock2()
	{
		/*String result=ERROR;
		System.out.println("Item code values check caled");
		HttpServletRequest request=ServletActionContext.getRequest();
		String itemcode=request.getParameter("itemCode");
		itemcode=itemcode.trim();
		System.out.println("Item code found" +itemcode);
	    try
		{
			DaoFactory dfact =new DaoFactory();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
	//		idto=idao.getItemDetailsByItemCode(itemcode);
			if(idao.getItemDetailsByItemCode(itemcode)){
				result=SUCCESS;
				System.out.println("value found..."+idto.getItemName());
				request.setAttribute("Msg", "true");
			}else{
				result=ERROR;
				request.setAttribute("Msg", "false");
			}
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
			result=ERROR;
			request.setAttribute("Msg", "false");
		}
		return result;*/
		HttpServletRequest request=ServletActionContext.getRequest();
		String result=SUCCESS;
		request.setAttribute("Msg", "true");
		
		String itemName=request.getParameter("itemName");
		itemName=itemName.trim();
		String bId=request.getParameter("bId");
		bId=bId.trim();
		String iCode=request.getParameter("itemCode");
		iCode=iCode.trim();
		
		System.out.println("name= "+itemName);
		System.out.println("bid= "+bId);
		System.out.println("code= "+iCode);
		if(iCode!="" && itemName != "" && !bId.equalsIgnoreCase("0")){
			try
			{
				DaoFactory dfact =new DaoFactory();
				ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
				boolean b=idao.getItemDetailsByItemNameBrandId(itemName,bId);
				boolean b1=idao.getItemDetailsByItemCode(iCode);
				if(b==true && b1==true){
					result="both";
					request.setAttribute("Msg", "Duplicate for Both Code And Item Name Found!");
				}else if(b==false && b1==true){
					result="code";
					request.setAttribute("Msg", "Duplicate Item Code Found");
				}else if(b==true && b1==false){
					result="name";
					request.setAttribute("Msg", "Duplicate Item Name Found");
				}else{
					result=SUCCESS;
					request.setAttribute("Msg", "true");
				}
				
				/*if(idto!=null){
					result=SUCCESS;
					request.setAttribute("Msg", "true");
					
				}else{
					result=ERROR;
					request.setAttribute("Msg", "false");
				}*/
			}catch(Exception e){
				System.out.println("ex= "+e);
			}
		}
		
		return result;
	}
	
	public String getALLStockList(){
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try
		{
			DaoFactory dfact=new DaoFactory();
			StockMasterDAO sdao=dfact.createStockManager();
			stockDTOList=sdao.getAllStockDetails();
			supList=sdao.getAllSupplierFromStock();
			session.setAttribute("totalstock", stockDTOList.size());
			System.out.println("stock size=================== "+session.getAttribute("totalstock"));
			System.out.println(stockDTOList.get(0).getItemname());
			
			
			
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
	}
	
	
	public String getStockDetailsbyBillNo()
	{
		System.out.println("Method called");
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try
		{
			float subtot=0;
			DaoFactory dfact=new DaoFactory();
			StockMasterDAO sdao=dfact.createStockManager();
			String billno=request.getParameter("billNo");
			String supplierId=request.getParameter("supplierId");
			stockDTOList=sdao.getAllStockDetailsByBillNoANDSupplierID(billno, supplierId);
			for(int i=0;i<stockDTOList.size();i++)
			{
				subtot=subtot+Float.parseFloat(stockDTOList.get(i).getItemTotal());
				System.out.println(subtot);
			}
			request.setAttribute("subtotal", subtot);
			request.setAttribute("billNo", billno);
			session.setAttribute("totalstock", stockDTOList.size());
			System.out.println("stock size=================== "+session.getAttribute("totalstock"));
			System.out.println(stockDTOList.get(0).getItemname());
			
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		
		return SUCCESS;
		
	}
	
	public String getStockDetailsbyItemName()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try
		{
			DaoFactory dfact=new DaoFactory();
			StockMasterDAO sdao=dfact.createStockManager();
			stockDTOList=sdao.getAllItemValuesGroupByItemIds();
			
			session.setAttribute("totalstock", stockDTOList.size());
			System.out.println("stock size=================== "+session.getAttribute("totalstock"));
			
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		
		return SUCCESS;
		
	}
	
	public String getItemStock()
	{
		HttpServletRequest request=ServletActionContext.getRequest();

		String itemId=request.getParameter("itemId");
		String itemName=request.getParameter("itemName");
		
		try
		{
			DaoFactory dfact=new DaoFactory();
			StockMasterDAO sdao=dfact.createStockManager();
			stockDTOList=sdao.getTotalItemStock(itemId);
			System.out.println("sz= "+stockDTOList.size());
			float itemTotals=0;
			
			for (int i = 0; i < stockDTOList.size(); i++) {
				System.out.println("id-"+stockDTOList.get(i).getItemIds());
				System.out.println("size="+stockDTOList.get(i).getItemSize());
				System.out.println("qty="+stockDTOList.get(i).getQty());
				itemTotals=itemTotals+Float.parseFloat(stockDTOList.get(i).getItemTotal());
				
			}
			request.setAttribute("itemTotals", itemTotals);
			request.setAttribute("itemName", itemName);			
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		
		return SUCCESS;
		
	}
	
	public String stockDetailsByDateorSup()
	{
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		StockMasterDAO sdao=dfact.createStockManager();
		HttpServletRequest request=ServletActionContext.getRequest();
		String supplierId=request.getParameter("sId");
		String fromdate=request.getParameter("fromdate");
		String todate=request.getParameter("todate");
		String vatcst=request.getParameter("vatcst");
		try {
				if(!supplierId.equalsIgnoreCase("0") && (fromdate.equalsIgnoreCase("")) && (fromdate.equalsIgnoreCase("")) ){
					stockDTOList=sdao.stockDetailsBySupId(supplierId,vatcst);
					retrunResult=SUCCESS;
				} else if (supplierId.equalsIgnoreCase("0") && (!fromdate.equalsIgnoreCase("")) && (!fromdate.equalsIgnoreCase(""))) {
					stockDTOList=sdao.stockDetailsByDate(fromdate, todate,vatcst);
					retrunResult=SUCCESS;
				}
				else{
					stockDTOList=sdao.stockDetailsByDateAndSupId(supplierId,fromdate, todate,vatcst);
					retrunResult=SUCCESS;
				}
					
			
		} catch (Exception e) {
			retrunResult=ERROR;
			e.printStackTrace();
		}
		return retrunResult;
	}
	
	public String editInvoiceCall()
	{
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		StockMasterDAO sdao=dfact.createStockManager();
		HttpServletRequest request=ServletActionContext.getRequest();
		try {
				stockDTOList=sdao.getAllBillDetails();
				retrunResult=SUCCESS;
			
		} catch (Exception e) {
			retrunResult=ERROR;
			e.printStackTrace();
		}
		return retrunResult;
	}
	
	
	public String checkDupBillForEdit(){
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String bill=request.getParameter("billNo");
		try
		{
		DaoFactory dfact =new DaoFactory();
		StockMasterDAO sdao=dfact.createStockManager();
		stockDTOList=sdao.getAllStockDetailsByBillNo(bill);
		System.out.println("size"+stockDTOList.size());
		if(stockDTOList.size()!=0){
			result=SUCCESS;
			request.setAttribute("Msg", "true");
			
		}else{
			result=SUCCESS;
			request.setAttribute("Msg", "false");
		}
		
		}catch(Exception e){
			System.out.println("ex= "+e);
		}
		return result;
	}
	
	public String editBillNo(){
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String Oldinvoiceno=request.getParameter("oldBill");
		String NewInvoiceNo=request.getParameter("newBill");
		System.out.println("new= "+NewInvoiceNo+"old= "+Oldinvoiceno);
		try
		{
			DaoFactory dao=new DaoFactory();
			StockMasterDAO sdao=dao.createStockManager();
			boolean updateresult=sdao.editInvoiceNo(Oldinvoiceno, NewInvoiceNo);
			if(updateresult)
			{
				System.out.println("All tables upadted successfully");
				request.setAttribute("Messages", Messages.UpdatealltablesSuccessfully);
				result=SUCCESS;
			}
			else
			{
				request.setAttribute("messages", "<p style='color:red;'>Sorry Invoice details Updated  Un Successfully. Please retry. !</p>");	
			}
		}
		catch(Exception e)
		{
			System.out.println("Exception occur "+ e)	;
			request.setAttribute("messages", Messages.displayError(e+""));	
		}
		return 	result;
	}
	
	//####################################################################################### Excel export for purchase list start here #####################################################################################	
    public String exportingStockDetails()
    {
    	String currentdate=  CurrentDate.getOnlyDateWithMySQLFORMAT();
    	String result=SUCCESS;
    	HttpServletResponse response=ServletActionContext.getResponse();
    	String[] header2 = new String[]{"INVOICE/BILL NO", "SUPPLIER NAME","SUPPLIER GST NO", "PURCHASE DATE", 
    			"ITEM TOTAL (BEFORE GST)" ,"DISCOUNT % (BEFORE GST)","DISCOUNT AMT (BEFORE GST)","TAXABLE AMOUNT", "GST RATE", "GST AMT", 
    			"CGST RATE", "CGST AMT" ,"SGST RATE", "SGST AMT", "IGST RATE", "IGST AMT" ,"GRANDTOTAL"};  
    	HttpServletRequest request=ServletActionContext.getRequest();
    	String sId=request.getParameter("sId");
		sId=sId.trim();
		String fromdate=request.getParameter("fromdate");
		String todate=request.getParameter("todate");
		String vatcst="";
		try
		{
			DaoFactory dfact=new DaoFactory();
			StockMasterDAO sdao=dfact.createStockManager();
			purchaselist=sdao.exportToexcelPurchaseDetails(fromdate, todate, sId,vatcst );
			SupplierMasterDAO supDao=dfact.CreateSupplierManager();
			supList=supDao.getAllSupplierDetails();
			ExcelExport ee=new ExcelExport();
			List<String> columnNames = new ArrayList<String>();
			List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
			String title=purchaselist.get(0).getTitleforExcel();
			int k=1;
			for (PurchaseLedgerDto il : purchaselist) {
               Integer i = 0;
               Map<String, Object> m = new HashMap<String, Object>();
               m.put((++i).toString(),il.getBillNo() );
              
               m.put((++i).toString(),il.getSupplierName() );
               m.put((++i).toString(),il.getSuppliergsttinno()) ;
               m.put((++i).toString(),il.getPurchaseDate());
               m.put((++i).toString(),il.getSubTot());
               m.put((++i).toString(),il.getDiscounts());
               m.put((++i).toString(),il.getDiscamt());
               m.put((++i).toString(),il.getSubtotalbegoregst());
               m.put((++i).toString(),il.getGstrate());
               m.put((++i).toString(),il.getGstamt());
               m.put((++i).toString(),il.getCgstrate());
               m.put((++i).toString(),il.getCgstamt());
               m.put((++i).toString(),il.getSgstrate());
               m.put((++i).toString(),il.getSgstamt());
               m.put((++i).toString(),il.getIgstrate());
               m.put((++i).toString(),il.getIgstamt());
               m.put((++i).toString(),il.getTotalamount());
       
               data.add(m);
               k++;
			}
			for(int i=0;i<header2.length;i++)
			{
				columnNames.add(header2[i]);
				System.out.println(columnNames);
			}
			HSSFWorkbook wb = null;
			wb= ee.createWorkbook(data, columnNames,title);
			response.setHeader("Content-Disposition", "attachment; filename=PurchaseReport_"+currentdate+".xls");
			ServletOutputStream out = response.getOutputStream();
			wb.write(out);
			out.flush();
			out.close();
			response.getOutputStream().flush();
			response.getOutputStream().close();
			result=SUCCESS;
		}
		catch(IllegalStateException t)
		{
			System.out.println("IlligelstateExceptionoccur");	
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return result; 
}
//####################################################################################### Excel export for purchase list End here #####################################################################################	
//________________________________________________ Stock Calculation Function: End _______________________________________________________________

//________________________________________________ Debit Note Calculation Function: Start	______________________________________________________
	
	public String getALLStockListOfPerticularSupplier()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String billno=request.getParameter("billNo");
		String supplierId=request.getParameter("supplierId");
		System.out.println("billno= "+billno);
		try
		{
			DaoFactory dfact=new DaoFactory();
			StockMasterDAO sdao=dfact.createStockManager();
			stockDTOList=sdao.getStockDetailsBySuppplierId(billno,supplierId);
			System.out.println(stockDTOList.get(0).getItemname());
			stockDTO.setSubTot(stockDTOList.get(0).getSubTot());
			stockDTO.setLessUnitScheme(stockDTOList.get(0).getLessUnitScheme());
			stockDTO.setDiscounts(stockDTOList.get(0).getDiscounts());
			stockDTO.setVat(stockDTOList.get(0).getVat());
			stockDTO.setCst(stockDTOList.get(0).getCst());
			if (stockDTOList.get(0).getWaybill()==null) {
				stockDTO.setWaybill("NA");
			}else{
				stockDTO.setWaybill(stockDTOList.get(0).getWaybill());			
			}
			stockDTO.setLorryFreight(stockDTOList.get(0).getLorryFreight());
			stockDTO.setGrandTot(stockDTOList.get(0).getGrandTot());
			System.out.println("Subtot found.."+stockDTO.getSubTot());
			stockDTO.setListSize(stockDTOList.size());
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
	}
	
	public String callBillDetails()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String sId=request.getParameter("supplierId");
		sId=sId.trim();
		System.out.println("supID= "+sId);
		try
		{
			DaoFactory dfact=new DaoFactory();
			StockMasterDAO sdao=dfact.createStockManager();
			stockDTOList=sdao.getBillNoBySuppplierId(Integer.parseInt(sId));
			System.out.println(stockDTOList.get(0).getItemname());
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
	}
		
	public String submitDebitNoteDetails()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String result=ERROR;
		try
		{
			String[] itemids=request.getParameterValues("itemids");
			String[] uqty=request.getParameterValues("uqty");
			String[] buyRate=request.getParameterValues("buyRate");
			String[] returnQuantityValue=request.getParameterValues("rqty");
			String[] updateItemTotal=request.getParameterValues("updItemtot");
			String[] newReturnTotal=request.getParameterValues("returnItemtotal");
			String[] itemSize=request.getParameterValues("itemSize");
			String returnSubtotal=request.getParameter("stockDTO.subTot");	
			String returnGrandTot=request.getParameter("stockDTO.grandTot");
			String[] stockid=request.getParameterValues("stockid");
			DaoFactory dfact=new DaoFactory();
			StockMasterDAO sdao=dfact.createStockManager();
			
			boolean updateResult=sdao.insertDebitNoteTableAndUpdateStockMaster(uqty, returnQuantityValue, updateItemTotal, itemids,itemSize, returnSubtotal, returnGrandTot, stockid, newReturnTotal, stockDTO, buyRate);
			
			if(updateResult)
			{
				System.out.println("updated Sucessfully!!");
				HttpSession session=request.getSession();
				String cid=(String)session.getAttribute("companyId");
				String uid=(String)session.getAttribute("userId");
				String dnNo=sdao.lastDebitNoSaved(cid,uid);
				String msg="<p style='color:green;'>Debit details Saved Successfully! Debit Note No. is: "+dnNo+"</p>";
				request.setAttribute("Messages", msg);
				result=SUCCESS;
			}else
			{
				result=ERROR;
				request.setAttribute("Messages", Messages.Error);}
		}
		catch(Exception e)
		{
			System.out.println("An exception found"+e);
			request.setAttribute("Messages", Messages.Error);
			result=ERROR;
		}
		return result;
	}

	public String getALLDNListOfPerticularSupplier(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String sId=request.getParameter("supplierId");
		sId=sId.trim();
		System.out.println("supID= "+sId);
		try
		{
			DaoFactory dfact=new DaoFactory();
			StockMasterDAO sdao=dfact.createStockManager();
			stockDTOList=sdao.getDNListBySuppplierId(Integer.parseInt(sId));
			System.out.println(stockDTOList.get(0).getItemname());
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
	}
	
    public String getDNDetails()
    {
		HttpServletRequest request=ServletActionContext.getRequest();
		String sId=request.getParameter("supplierId");
		sId=sId.trim();
		String dn=request.getParameter("dn");
		dn=dn.trim();
		System.out.println("supID= "+sId);
		try
		{
			DaoFactory dfact=new DaoFactory();
			StockMasterDAO sdao=dfact.createStockManager();
			stockDTOList=sdao.getDNDetailsBySuppplierId(Integer.parseInt(sId), dn);
			System.out.println(stockDTOList.get(0).getItemname());
			request.setAttribute("gtot", stockDTOList.get(0).getDnGrandTot());
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		request.setAttribute("dn", dn);
		return SUCCESS;
	}
//________________________________________________ Debit Note Calculation Function: End	_______________________________________________________________
	
	 public String conReCall() throws SQLException
	{
		String Result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = request.getSession(true);
		java.sql.Connection con=null;
		try
		{
			con=ConnectCore.getConnection();
			DaoFactory dfact=new DaoFactory();
			SupplierMasterDAO sdao=dfact.CreateSupplierManager();
			supList=sdao.getAllSupplierDetails();
			System.out.println("list found---"+supList.size());
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			iCateoryList=idao.getAllItemType();
			itemList=idao.getAllItemByCompanyId();
			itemList=idao.getAllItemByItemSize();
			brandList=idao.getAllBrandByCompanyId();
			itemSizeList=idao.getAllSizeByCompanyId();
			request.setAttribute("listSize",itemSizeList.size() );
			if(supList.size()>0 && iCateoryList.size()>0 && itemList.size()>0 && brandList.size()>0 && itemSizeList.size()>0)
			{
				System.out.println("Connection successfully Re- Initialized.");
				request.setAttribute("messages", "<b> Connection Reset.</b> ");
				session.setMaxInactiveInterval(-1);
				Result=SUCCESS;
			}
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
			System.out.println("Connection lost.");
			request.setAttribute("messages", "<b> Connection lost.</b> ");
			Result=SUCCESS;
		}
		finally
		{   if(con!=null)
			{
				con.close();
				System.out.println("connection closed");
			}
		}
		return Result;
	}
	 
	//############################################################### OpeningClosing Stock Calculation #############################################
	 
	 public String closingStockCall()
	 {
		  
		    HttpServletRequest request=ServletActionContext.getRequest();
		    HttpSession session=request.getSession();
		    String lastFinancialYear=(String) session.getAttribute("lastfinancialyears");
			try
			{
				DaoFactory dfact=new DaoFactory();
				StockMasterDAO sdao=dfact.createStockManager();
				
				closingStockList=sdao.getAllOpeningStock(lastFinancialYear);
				System.out.println("Size found..."+closingStockList.size());
				
			}
			catch(Exception e)
			{
				System.out.println("An exception found.."+e);
			}
			
			return SUCCESS;
	 }
	 

	 
	 public String openingStockCall()
	 {
		  
		    HttpServletRequest request=ServletActionContext.getRequest();
		    HttpSession session=request.getSession();
		    String lastFinancialYear=(String) session.getAttribute("lastfinancialyears");
			try
			{
				DaoFactory dfact=new DaoFactory();
				StockMasterDAO sdao=dfact.createStockManager();
				
				closingStockList=sdao.getAllCurrentYearOpeningStock(lastFinancialYear);
				System.out.println("Size found..."+closingStockList.size());
				
			}
			catch(Exception e)
			{
				System.out.println("An exception found.."+e);
			}
			
			return SUCCESS;
	 }
	 
	 public String saveUpdateClosingDetails()
	 {
		 String returnResult=ERROR;
		 HttpServletRequest request=ServletActionContext.getRequest();
		 String[] financialYear=request.getParameterValues("financialYear");
		 String[] id=request.getParameterValues("id");
		 String[] stockId=request.getParameterValues("stockid");
		 String[] itemIds=request.getParameterValues("itemIds");
		 String[] qty=request.getParameterValues("qty");
		 String[] alterQty=request.getParameterValues("alterQty");
		 String[] remarks=request.getParameterValues("remarks");
		 
		 try
		 {
			DaoFactory dfact=new DaoFactory();
		    StockMasterDAO sdao=dfact.createStockManager(); 
			boolean updateStock=sdao.updateClosingOpeningAndStockMaster(financialYear, id, stockId, itemIds, qty, alterQty, remarks);
			if(updateStock)
			{
				String msg="<p style='color:green;'>Update sucessfully !!</p>";
				request.setAttribute("Messages", msg);	
				returnResult=SUCCESS;
			}
			else
			{
				String msg="<p style='color:red;'>Error occur Try again !!</p>";
				request.setAttribute("Messages", msg);		
				
			}
		 }
		 catch(Exception e)
		 {
			 String msg="<p style='color:red;'>Error occur Try again !!</p>";
			 request.setAttribute("Messages", msg);	
			System.out.println("Error occur  "+e) ;
			 
		 }
		 
		 return returnResult;
		 
	 }
	 
}
