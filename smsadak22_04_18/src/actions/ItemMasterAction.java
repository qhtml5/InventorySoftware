package actions;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.net.ftp.parser.ParserInitializationException;
import org.apache.struts2.ServletActionContext;

import util.Messages;

import com.opensymphony.xwork2.ActionSupport;

import dao.CustomerMasterDAO;
import dao.DaoException;
import dao.DaoFactory;
import dao.ItemMasterAndTypeDAO;
import dao.LoginMasterDAO;
import dao.CompanyMasterDAO;
import dao.SchemeMasterDao;
import dao.SupplierMasterDAO;
import dTO.ItemMasterDTO;
import dTO.ItemCategoryTypeMasterDTO;
import dTO.SupplierMasterDTO;

public class ItemMasterAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	protected static final Log log = LogFactory.getLog(ItemMasterAction.class);
	ItemCategoryTypeMasterDTO idto= new ItemCategoryTypeMasterDTO();
	List<ItemCategoryTypeMasterDTO> iCateoryList=new LinkedList<ItemCategoryTypeMasterDTO>();
	List<ItemCategoryTypeMasterDTO> itemList=new LinkedList<ItemCategoryTypeMasterDTO>();
	List<ItemCategoryTypeMasterDTO> brandList=new LinkedList<ItemCategoryTypeMasterDTO>();
	List<ItemCategoryTypeMasterDTO> sizeList=new LinkedList<ItemCategoryTypeMasterDTO>();
	List<SupplierMasterDTO> sDTOList=new ArrayList<SupplierMasterDTO>();
	
	public ItemCategoryTypeMasterDTO getIdto() {
		return idto;
	}

	public void setIdto(ItemCategoryTypeMasterDTO idto) {
		this.idto = idto;
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
	
	public List<ItemCategoryTypeMasterDTO> getSizeList() {
		return sizeList;
	}

	public void setSizeList(List<ItemCategoryTypeMasterDTO> sizeList) {
		this.sizeList = sizeList;
	}
	
	public synchronized List<SupplierMasterDTO> getsDTOList() {
		return sDTOList;
	}
	public synchronized void setsDTOList(List<SupplierMasterDTO> sDTOList) {
		this.sDTOList = sDTOList;
	}
	@Override
	public String execute()
	{
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession hs=request.getSession();
		
		if(hs.getAttribute("login")!=null){
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			SupplierMasterDAO sdao=dfact.CreateSupplierManager();
			
			try {
				iCateoryList=idao.getAllItemType();
				itemList=idao.getAllItemByCompanyId();
				brandList=idao.getAllBrandByCompanyId();
				sizeList=idao.getAllSizeByCompanyId();
				sDTOList=sdao.getAllSupplierDetails();
				if(iCateoryList!=null && itemList!=null && sDTOList !=null && brandList!=null){
				
			}	
			  retrunResult=SUCCESS;
			} catch (Exception e) {
				retrunResult=ERROR;
				e.printStackTrace();
			}
		}else {
			request.setAttribute("loginStatus", "sessionExpired");
			retrunResult="sessionExpired";
		}
		return retrunResult;
	}
	
	public String checkDupItemType(){
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String itemTypeName=request.getParameter("itemTypeName");
		itemTypeName=itemTypeName.trim();
		System.out.println("itemTypeName= "+itemTypeName);
		idto.setItemType(itemTypeName);
		try
		{
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		
		if(idao.checkItemTypeDuplicateORNOT(idto)){
			result=SUCCESS;
			request.setAttribute("Msg", "true");
			
		}else{
			result=ERROR;
			request.setAttribute("Msg", "false");
		}
		
		}catch(Exception e){
			System.out.println("ex= "+e);
		}
		return result;
	}
	
	public String saveItemType()
	{
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		try
		{
			DaoFactory dfact =new DaoFactory();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			if(idao.checkItemTypeDuplicateORNOT(idto)){
				result="duplicate";
				request.setAttribute("Messages", Messages.Duplicate);
			}else{
				Boolean saveresult=idao.SaveItemMasterType(idto);
				if(saveresult)
				{
					result=SUCCESS;
					request.setAttribute("Messages", Messages.ItemTypeSaveSuccesfully);
				}else{
					result=ERROR;
					request.setAttribute("Messages", Messages.Error);
				}
			}
		}
		catch(Exception e)
		{
			System.out.println("An error Occur" + e);
		}
		
		return result;
	}
	
	public String viewcategoryCall()
	{
		String result=SUCCESS;
		try
		{
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		iCateoryList=idao.getAllItemType();
		}
		catch(Exception e)
		{
			System.out.println("An error Occur" + e);
		}
		return result;
	}
	
	public String editItemCategoryCall()
	{
		String result=SUCCESS;
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession hs=request.getSession();
		
		if(hs.getAttribute("login")!=null)
		{
			try
			{
			DaoFactory dfact =new DaoFactory();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			
			String id=request.getParameter("itemTypeID");
	        System.out.println("Id found ..." +id);
	        id=id.trim();
	        idto=idao.getItemTypeById (Integer.parseInt(id));
			}
			catch(Exception e)
			{
				System.out.println("An error Occur" + e);
			}
		}else {
			request.setAttribute("loginStatus", "sessionExpired");
			result="sessionExpired";
		}
		return result;
	}
	
	public String editItemTypeById()
	{
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		System.out.println("item cate="+idto.getItemTypeID());
			try
			{
			DaoFactory dfact =new DaoFactory();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			Boolean saveresult=idao.editItemTypeById(idto);
			if(saveresult)
			{
				result=SUCCESS;
				request.setAttribute("Messages", Messages.UpdateItemTypeSuccessfully);
			}
			else{
				result=ERROR;
				request.setAttribute("Messages", Messages.Error);
			}
			}
			catch(Exception e)
			{
				System.out.println("An error Occur" + e);
			}		
		return result;
	}
	
	public String checkDupBrand(){
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String bName=request.getParameter("bName");
		bName=bName.trim();
		System.out.println("bName= "+bName);
		idto.setItemBrandName(bName);
		try
		{
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		
		if(idao.checkItemBrandDuplicateORNOT(idto)){
			result=SUCCESS;
			request.setAttribute("Msg", "true");
			
		}else{
			result=ERROR;
			request.setAttribute("Msg", "false");
		}
		
		}catch(Exception e){
			System.out.println("ex= "+e);
		}
		return result;
	}
	
	public String addBrand()
	{
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		try
		{
			DaoFactory dfact =new DaoFactory();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			if(idao.checkItemBrandDuplicateORNOT(idto)){
				result="duplicate";
				request.setAttribute("Messages", Messages.Duplicate);
			} else{
				
				Boolean saveresult=idao.saveBrandDetails(idto);
				if(saveresult)
				{
					result=SUCCESS;
					request.setAttribute("Messages", Messages.BrandSaveSuccesfully);
				}
				else{
					result=ERROR;
					request.setAttribute("Messages", Messages.Error);
				}
			}
		}
		catch(Exception e)
		{
			System.out.println("An error Occur" + e);
		}
		
		return result;
	}
	
	public String getBrands()
	{
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
	
		try {
			brandList=idao.getAllBrandByCompanyId();
			if(brandList!=null){
				retrunResult=SUCCESS;
			}
		} catch (Exception e) {
			retrunResult=ERROR;
			e.printStackTrace();
		}
		return retrunResult;
	}

	public String getBrandById()
	{
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		HttpServletRequest request=ServletActionContext.getRequest();
		
		HttpSession hs=request.getSession();
		if(hs.getAttribute("login")!=null){
		
			String ibid=(String)request.getParameter("itemBrandId");
			ibid=ibid.trim();
			try {
				idto=idao.getItemBrandByBrandId(Integer.parseInt(ibid));
				retrunResult=SUCCESS;
			} catch (Exception e) {
				retrunResult=ERROR;
				e.printStackTrace();
			}
		}else {
			request.setAttribute("loginStatus", "sessionExpired");
			retrunResult="sessionExpired";
		}
		return retrunResult;
	}
	
	public String editBrandById()
	{
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		System.out.println("item Id="+idto.getItemId());
		try
		{
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		Boolean saveresult=idao.editBrandDetailsById(idto);
		if(saveresult)
		{
			result=SUCCESS;
			request.setAttribute("Messages", Messages.UpdateBrandSuccessfully);
		}
		else{
			result=ERROR;
			request.setAttribute("Messages", Messages.Error);
		}
		}
		catch(Exception e)
		{
			System.out.println("An error Occur" + e);
		}
		
		return result;
	}
	
	
	//-------------------------------------------- Size ________________________________________________________________
	
	public String checkDupSize(){
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String sizeName=request.getParameter("sizeName");
		sizeName=sizeName.trim();
		System.out.println("sizeName= "+sizeName);
		idto.setItemSizeName(sizeName);
		try
		{
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		if(idao.checkSizeDuplicateORNOT(idto)){
			result=SUCCESS;
			request.setAttribute("Msg", "true");
			
		}else{
			result=ERROR;
			request.setAttribute("Msg", "false");
		}
		
		}catch(Exception e){
			System.out.println("ex= "+e);
		}
		return result;
	}
	
	public String addSize()
	{
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		try
		{
			DaoFactory dfact =new DaoFactory();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			if(idao.checkSizeDuplicateORNOT(idto)){
				result="duplicate";
				request.setAttribute("Messages", Messages.Duplicate);
			} else{
				Boolean saveresult=idao.saveSizeDetails(idto);
				if(saveresult)
				{
					result=SUCCESS;
					request.setAttribute("Messages", Messages.SizeSaveSuccesfully);
				}
				else{
					result=ERROR;
					request.setAttribute("Messages", Messages.Error);
				}
			}
		}
		catch(Exception e)
		{
			System.out.println("An error Occur" + e);
		}
		
		return result;
	}
	
	public String getSize()
	{
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
	
		try {
			sizeList=idao.getAllSizeByCompanyId();
			if(sizeList!=null){
				retrunResult=SUCCESS;
			}
		} catch (Exception e) {
			retrunResult=ERROR;
			e.printStackTrace();
		}
		return retrunResult;
	}

	public String getSizeById()
	{
		String retrunResult=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession hs=request.getSession();
		if(hs.getAttribute("login")!=null){

			DaoFactory dfact =new DaoFactory();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			String sizeId=(String)request.getParameter("sizeId");
			sizeId=sizeId.trim();
			try {
				idto=idao.getItemSizeBySizeId(Integer.parseInt(sizeId));
				retrunResult=SUCCESS;
			} catch (Exception e) {
				retrunResult=ERROR;
				e.printStackTrace();
			}
	}else {
		request.setAttribute("loginStatus", "sessionExpired");
		retrunResult="sessionExpired";
	}
		return retrunResult;
	}
	
	public String editSizeById()
	{
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		System.out.println("item Id="+idto.getItemSizeId());
			try
			{
			DaoFactory dfact =new DaoFactory();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			Boolean saveresult=idao.editSizeDetailsById(idto);
			if(saveresult)
			{
				result=SUCCESS;
				request.setAttribute("Messages", Messages.UpdateSizeSuccessfully);
			}
			else{
				result=ERROR;
				request.setAttribute("Messages", Messages.Error);
			}
			}
			catch(Exception e)
			{
				System.out.println("An error Occur" + e);
			}
		
		return result;
	}
	
	public String delSizeById()
	{
		int sid=0;
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		try
		{
			DaoFactory dfact =new DaoFactory();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			String id=request.getParameter("itemSizeId");
		    System.out.println("Id found ..." +id);
		    sid= Integer.parseInt(id.trim());

		    if(idao.deleteSizeById(sid))
			{   result=SUCCESS;
				request.setAttribute("Messages", "<p style='color:green;'>Item Size Deleted Successfully</p>");
			}
			else
			{
				result=ERROR;
				request.setAttribute("Messages", "<p style='color:red;'>Error Deleteing Item Size!</p>");
			}
	    
		}
		catch(Exception e)
		{
			System.out.println("An error Occur" + e);
			request.setAttribute("Messages", Messages.Error);
		}
		return result;
	}
	//-------------------------------------------- Size ________________________________________________________________
	
	public String checkDupItem(){
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
	
	/*public String checkDupItemCode(){
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String iCode=request.getParameter("itemCode");
		iCode=iCode.trim();
		System.out.println("iCode= "+iCode);
		try
		{
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		idto=idao.getItemDetailsByItemCode(iCode);
		if(idto!=null){
			result=SUCCESS;
			request.setAttribute("Msg", "true");
			
		}else{
			result=ERROR;
			request.setAttribute("Msg", "false");
		}
		
		}catch(Exception e){
			System.out.println("ex= "+e);
		}
		return result;
	}
	*/
	public String addItem()
	{
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		System.out.println("i code= "+idto.getItemId());
		Boolean saveresult=false; 
		String itemid[]=request.getParameterValues("idto.itemId");
		String itemmrp[]=request.getParameterValues("idto.itemMrp");
		String dupITM[]=request.getParameterValues("dupT");
		try
		{
			DaoFactory dfact =new DaoFactory();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			if(idao.checkItemDuplicateORNOT(idto)){
				result="duplicate";
				request.setAttribute("Messages", Messages.Duplicate);
			} else{
				
				for(int i=0;i<itemid.length;i++)
				{
					
					if(dupITM[i]!="1" && itemid[i]!="" && itemmrp[i]!="")
					{
					idto.setItemId(itemid[i]);
					idto.setItemMrp(itemmrp[i]);
				    saveresult=idao.saveItemDetails(idto);	
					}
					
				}

				if(saveresult)
				{
					result=SUCCESS;
					request.setAttribute("Messages", Messages.ItemSaveSuccesfully);
				}
				else{
					result=ERROR;
					request.setAttribute("Messages", "Blank field found try again ..<br/><a href='#' onmouseover='called()' onmousemove='called()'  onmouseout='called()' onclick='addItemCall()'>Try Again</a></p>");
				}
			}
		}
		catch(Exception e)
		{
			request.setAttribute("Messages", "Blank field found try again ..<br/><a href='#' onmouseover='called()' onmousemove='called()'  onmouseout='called()' onclick='addItemCall()'>Try Again</a></p>");
		}
		
		return result;
	}
	
	
	public String addPopupItems()
	{
		
		
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		System.out.println("i code= "+idto.getItemId());
		Boolean saveresult=false; 
		String itemid[]=request.getParameterValues("idto.itemId");
		String itemmrp[]=request.getParameterValues("idto.itemMrp");
		try
		{
			DaoFactory dfact =new DaoFactory();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			if(idao.checkItemDuplicateORNOT(idto)){
				result="duplicate";
				request.setAttribute("Messages", Messages.Duplicate);
			} else{
				
				for(int i=0;i<itemid.length;i++)
				{
					idto.setItemName(request.getParameter("iName"));
					idto.setItemId(itemid[i]);
					idto.setItemMrp(itemmrp[i]);
				    saveresult=idao.saveItemDetails(idto);	
					
				}

				if(saveresult)
				{
					result=SUCCESS;
					request.setAttribute("Msg", "Items save successfully");
				}
				else{
					result=ERROR;
					request.setAttribute("Msg", "Blank field found try again ..<br/><a href='#' onmouseover='called()' onmousemove='called()'  onmouseout='called()' onclick='addItemCall()'>Try Again</a></p>");
				}
			}
		}
		catch(Exception e)
		{
			request.setAttribute("Msg", "Blank field found try again ..<br/><a href='#' onmouseover='called()' onmousemove='called()'  onmouseout='called()' onclick='addItemCall()'>Try Again</a></p>");
		}
		
		return result;
		
		
	}
	
	
	
	
	
	public String getItems()
	{
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
	
		try {
			itemList=idao.getAllItemByCompanyId();
			if(itemList!=null){
				retrunResult=SUCCESS;
			}
		} catch (Exception e) {
			retrunResult=ERROR;
			e.printStackTrace();
		}
		return retrunResult;
	}
	
	
	public String getItemById()
	{
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		SupplierMasterDAO sdao=dfact.CreateSupplierManager();
		HttpServletRequest request=ServletActionContext.getRequest();
		String itemid=(String)request.getParameter("itemId");
		itemid=itemid.trim();
		try {
			idto=idao.getItemByCompanyIdItemId(itemid);
			iCateoryList=idao.getAllItemType();
			brandList=idao.getAllBrandByCompanyId();
			//sizeList=idao.getAllSizeByCompanyId();
			//sDTOList=sdao.getAllSupplierDetails();
			if(idto!=null && iCateoryList!=null && brandList!=null && sDTOList!=null){
				retrunResult=SUCCESS;
			}
			
		} catch (Exception e) {
			retrunResult=ERROR;
			e.printStackTrace();
		}
		return retrunResult;
	}
	
	public String editItemsById()
	{
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		System.out.println("item Id="+idto.getItemId());
		System.out.println("item cate="+idto.getItemTypeID());
		System.out.println("supplier id="+idto.getSupplierId());
		System.out.println("item brand id="+idto.getItemBrandId());
		System.out.println("mrp="+idto.getItemMrp());
		try
		{
			DaoFactory dfact =new DaoFactory();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			Boolean saveresult=idao.editItemDetailsById(idto);
			if(saveresult)
			{
				result=SUCCESS;
				request.setAttribute("Messages", Messages.UpdateItemSuccessfully);
			}
			else{
				result=ERROR;
				request.setAttribute("Messages", Messages.Error);
			}
		}
		catch(Exception e)
		{
			System.out.println("An error Occur" + e);
		}
		
		return result;
	}
	
	public String barcodesearch()
	{
		
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		try {
			itemList=idao.getBarcodeList("", "");
			idto.setItemsLength(itemList.size()+"");
			
			return SUCCESS;
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	public String barcodeList()
	{
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		HttpServletRequest request=ServletActionContext.getRequest();
		String fromdate=request.getParameter("fromdate");
		String todate=request.getParameter("todate");
	
		try {
			itemList=idao.getBarcodeList(fromdate, todate);
			return SUCCESS;
			
		} catch (Exception e) {
			retrunResult=ERROR;
			e.printStackTrace();
		}
		return retrunResult;
	}
	
	public String  checkDuplicateItemID()
	{
		
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		HttpServletRequest request=ServletActionContext.getRequest();
		String id=request.getParameter("id");
	
		try {
			boolean checkDup=false;
			checkDup=idao.checkItemIDDuplicate(id);
			if(checkDup)
			{
			request.setAttribute("dupRes", 1)	;
			}
			else
			{
			request.setAttribute("dupRes", 0)	;	
			}
			return SUCCESS;
			
		} catch (Exception e) {
			retrunResult=ERROR;
			e.printStackTrace();
		}
		return retrunResult;
		
		
		
		
	}
	
	
}
