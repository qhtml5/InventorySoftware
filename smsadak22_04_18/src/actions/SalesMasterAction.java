package actions;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import util.CurrentCompAndUser;
import util.CurrentDate;
import util.CurrrentPreviousYear;
import util.ExcelExport;
import util.Messages;
import util.NumberToWordCalculation;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.html.simpleparser.HTMLWorker;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.opensymphony.xwork2.ActionSupport;

import dTO.CreditNoteDto;
import dTO.CustomerMasterDTO;
import dTO.ItemCategoryTypeMasterDTO;
import dTO.PurchaseLedgerDto;
import dTO.SalesMasterDto;
import dTO.StockMasterDTO;
import dTO.SupplierMasterDTO;
import dao.CustomerMasterDAO;
import dao.DaoException;
import dao.DaoFactory;
import dao.ItemMasterAndTypeDAO;
import dao.LedgerDao;
import dao.SalesMasterDao;
import dao.StockMasterDAO;
import dao.SupplierMasterDAO;
import daoImpl.CustomerMasterDaoIMPL;

public class SalesMasterAction extends ActionSupport{

	protected static final Log log = LogFactory.getLog(SalesMasterAction.class);	
	private static final long serialVersionUID = 1L;
	SalesMasterDto saleDto=new SalesMasterDto();
	CreditNoteDto crDto=new CreditNoteDto();
	CustomerMasterDTO cDTo=new CustomerMasterDTO();
	List<CustomerMasterDTO> cList=new ArrayList<CustomerMasterDTO>();
	List<SalesMasterDto> saleList=new ArrayList<SalesMasterDto>();
	List<CreditNoteDto> crList=new ArrayList<CreditNoteDto>();
	StockMasterDTO stockDTO=new StockMasterDTO();
	List<StockMasterDTO> stockDTOList=new ArrayList<StockMasterDTO>();
	String flagcheck="";
	List<ItemCategoryTypeMasterDTO> itemList=new LinkedList<ItemCategoryTypeMasterDTO>();
	List<CustomerMasterDTO> cListSales=new ArrayList<CustomerMasterDTO>();

	public synchronized List<CustomerMasterDTO> getcListSales() {
		return cListSales;
	}

	public synchronized void setcListSales(List<CustomerMasterDTO> cListSales) {
		this.cListSales = cListSales;
	}

	public synchronized List<ItemCategoryTypeMasterDTO> getItemList() {
		return itemList;
	}

	public synchronized void setItemList(List<ItemCategoryTypeMasterDTO> itemList) {
		this.itemList = itemList;
	}

	public synchronized String getFlagcheck() {
		return flagcheck;
	}

	public synchronized void setFlagcheck(String flagcheck) {
		this.flagcheck = flagcheck;
	}

	public synchronized SalesMasterDto getSaleDto() {
		return saleDto;
	}
	
	public synchronized void setSaleDto(SalesMasterDto saleDto) {
		this.saleDto = saleDto;
	}
	
	public synchronized List<SalesMasterDto> getSaleList() {
		return saleList;
	}
	
	public synchronized void setSaleList(List<SalesMasterDto> saleList) {
		this.saleList = saleList;
	}
	
	public StockMasterDTO getStockDTO() {
		return stockDTO;
	}
	
	public void setStockDTO(StockMasterDTO stockDTO) {
		this.stockDTO = stockDTO;
	}
	
	public List<StockMasterDTO> getStockDTOList() {
		return stockDTOList;
	}
	
	public void setStockDTOList(List<StockMasterDTO> stockDTOList) {
		this.stockDTOList = stockDTOList;
	}
	
	public static synchronized long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public CustomerMasterDTO getcDTo() {
		return cDTo;
	}
	
	public void setcDTo(CustomerMasterDTO cDTo) {
		this.cDTo = cDTo;
	}
	
	public List<CustomerMasterDTO> getcList() {
		return cList;
	}
	
	public void setcList(List<CustomerMasterDTO> cList) {
		this.cList = cList;
	}

	public CreditNoteDto getCrDto() {
		return crDto;
	}

	public void setCrDto(CreditNoteDto crDto) {
		this.crDto = crDto;
	}

	public List<CreditNoteDto> getCrList() {
		return crList;
	}

	public void setCrList(List<CreditNoteDto> crList) {
		this.crList = crList;
	}

	@Override
	public String execute()
	{
	    
		//saleDto.setDoc(CurrentDate.getOnlyDateWithMySQLFORMAT());
		
		try {
				DaoFactory dfact=new DaoFactory();
				SalesMasterDao sdao=dfact.createSalesMasterManager();
				cList=sdao.searchCustomerList("");
				
				//################ Customer from sales table ###############
				cListSales=sdao.getAllCustomerFromSales();
				//################ Customer from sales table ###############
				
				ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
				itemList=idao.getAllItemByCompanyId();
				int maxid=sdao.getMaxSaleID();
				int maxbillNo=sdao.getMaxSaleBillNo();				
	         
						
                if(maxid>0)
				{
                	int inc=maxbillNo+1;
                	 saleDto.setIncnum(inc);
                		String billno="ADK-"+CurrentDate.getOnlyDateWithMySQLFORMAT()+"-00"+inc;
    					saleDto.setBillno(billno+"");	
					
				}
				else
				{int inc=1;
				 	 saleDto.setIncnum(inc);
					String billno="ADK-"+CurrentDate.getOnlyDateWithMySQLFORMAT()+"-00"+1;
					saleDto.setBillno(billno+"");
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	
	public String searchCustNames()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String customerName=request.getParameter("customerName");
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			cList=sdao.searchCustomerList(customerName);
			System.out.println("size= "+cList.size());
			log.info("Successfully Created");
		}
		catch(Exception e)
		{
			log.error("An exception occur type is ...." + e);
		}
		return SUCCESS;
	}
	
	public String getItemFromStock()
	{
		String result=ERROR;


		HttpServletRequest request=ServletActionContext.getRequest();
		String articlesCode=request.getParameter("articlesCode");
		articlesCode=articlesCode.trim();
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			saleList=sdao.getStockItemDetailsByItemCode(articlesCode);         // modify this function When Barcode Available
			System.out.println("size= "+saleList.size());
			if(saleList.size()>0){
				result=SUCCESS;
				request.setAttribute("sListSize", saleList.size());
			}else{
				result=ERROR;
				request.setAttribute("Msg", "<p style='color:red;'>No Data Found!</p>");
			}
			log.info("Successfully Created");
		}
		catch(Exception e)
		{
			log.error("An exception occur type is ...." + e);
		}
		return result;
	}
	
	public String getSalesStockDetails()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String stockId=request.getParameter("stockId");
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			saleDto=sdao.getStockItemDetailsByStockId(stockId);
			
			log.info("Successfully Created");
		}
		catch(Exception e)
		{
			log.error("An exception occur type is ...." + e);
		}
		return SUCCESS;
	}
	
	public String checkDupSalesBill(){
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String bill=request.getParameter("bill");
		try
		{
		DaoFactory dfact =new DaoFactory();
		SalesMasterDao sdao=dfact.createSalesMasterManager();
		String doc=request.getParameter("doc");
		saleList=sdao.getAllSalesDetailsByBillNo(bill,doc);
		System.out.println("size"+stockDTOList.size());
		if(saleList.size()!=0){
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
	
	
	public String addSaleDetails()
	{
		String returnS=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String[] size=request.getParameterValues("size[]");
		String[] qty=request.getParameterValues("qty[]");
		String[] brate=request.getParameterValues("brate[]");
		String[] srate=request.getParameterValues("srateA[]");
		String[] tot=request.getParameterValues("tot[]");
		String[] itemId=request.getParameterValues("article[]");
		String discount1[]=request.getParameterValues("discount1");
		String discount2[]=request.getParameterValues("discount2");
		String discountamt[]=request.getParameterValues("discountamt");
		String gstrate[]=request.getParameterValues("rateperitem");
		String gstamt[]=request.getParameterValues("rateperitemamt");
		String cgstrate[]=request.getParameterValues("cgstrate");
		String cgstamt[]=request.getParameterValues("cgstamt");
		
		String sgstrate[]=request.getParameterValues("sgstrate");
		String sgstamt[]=request.getParameterValues("sgstamt");
		
		String igstrate[]=request.getParameterValues("igstrate");
		String igstamt[]=request.getParameterValues("igstamt");
		
		String hsncode[]=request.getParameterValues("hsncode");
		String basetotal[]=request.getParameterValues("basetotal");
//	    String afterdiscount="";
//	    String amountreceived=request.getParameter("amountreceived");
//	    String amountreturn=request.getParameter("amountreturn");
		
		String doc=saleDto.getDoc();
		try{
		
		String dueStatus=request.getParameter("DueStatus");
		if(dueStatus.equals(null))
		{	
		 saleDto.setDueStatus("");
		}
		else if(!dueStatus.equals(null))
		{
		saleDto.setDueStatus(request.getParameter("DueStatus"));	
		}
		}
		catch(NullPointerException h)
		{
		saleDto.setDueStatus("");
		}
		
		
		String billno=saleDto.getBillno();
		System.out.println(billno);
		DaoFactory dfact=new DaoFactory();
		try
		{
			
			CustomerMasterDAO cdao=dfact.createCustomerManager();
			int customerID=Integer.parseInt(request.getParameter("customerId"));
			if(customerID!=0)
			{
				
				cList=cdao.ViewANDEditCALLCustomerDetails(customerID);
				System.out.println("Customer id not found null");
				saleDto.setRegcustomerId(request.getParameter("customerId"));
				saleDto.setCustomerType("REGULAR");
			}
			else
			{	
			    try{
				cList=cdao.ViewANDEditCALLCustomerDetails(Integer.parseInt(saleDto.getRegcustomerId()));
				System.out.println("Customer id found null");
				System.out.println("cstomrid="+saleDto.getRegcustomerId());
				saleDto.setCustomerType(cList.get(0).getCustomerType());
			    }
			    
			    catch(NumberFormatException j)
			    {
			    	cDTo.setcName(saleDto.getTempCustName());
			    	cDTo.setMobile(saleDto.getTemCustMobileNo());
			    	cDTo.setAddress(saleDto.getTempCustAddress());
					cDTo.setPhoneno("");
					cDTo.setEmail("");
					cDTo.setState("");
					cDTo.setPincode("");
					cDTo.setFax("");
					cDTo.setVat("");
					cDTo.setType("ONETIME");
					cDTo.setNote("");
					cDTo.setCustomerType("TEMP");
			        boolean savecustomerecords  = cdao.saveCustomerDetails(cDTo);
			    	if(savecustomerecords )
			    	{
			    		int reCustomerId=cdao.getCustomerId();
			    		saleDto.setTempCustBarcode("NA");
						saleDto.setTempCustBarcodeUrl("NA");
						saleDto.setCustomerType("TEMP");
						saleDto.setRegcustomerId(reCustomerId+"");
			    	}
			    	
			    }
			    catch(NullPointerException n )
			    {
			    	cDTo.setcName(saleDto.getTempCustName());
			    	cDTo.setMobile(saleDto.getTemCustMobileNo());
			    	cDTo.setAddress(saleDto.getTempCustAddress());
			        boolean savecustomerecords  = cdao.saveCustomerDetails(cDTo);
			    	if(savecustomerecords )
			    	{
			    		int reCustomerId=cdao.getCustomerId();
			    		saleDto.setTempCustBarcode("NA");
						saleDto.setTempCustBarcodeUrl("NA");
						saleDto.setCustomerType("TEMP");
						saleDto.setRegcustomerId(reCustomerId+"");
			    	}
			    }
			}
			
			if(cList.size()>0)
			{	
			saleDto.setTempCustName(cList.get(0).getcName());
			saleDto.setTempCustAddress(cList.get(0).getAddress());
			saleDto.setTempCustBarcode(cList.get(0).getCustomerBarcode());
			saleDto.setTempCustBarcodeUrl(cList.get(0).getCustomerBarcodeUrl());
			}
		
			
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			
			
					
			boolean result=	sdao.saveSaleDetails(saleDto, size, qty, srate, tot, itemId, brate, "0", "0", "0",
							hsncode, discount1, discount2, gstrate, gstamt, cgstrate, cgstamt, sgstrate, sgstamt, igstrate, igstamt,discountamt,basetotal);

			if(result)
			{   returnS=SUCCESS;
			    request.setAttribute("billno", billno);
			    request.setAttribute("doc",doc);
				request.setAttribute("Messages", Messages.salesSaveSuccesfully);
			}
			else
			{request.setAttribute("Messages", Messages.errorSavingSupply);}
		    }
		    catch(Exception e)
		    {
			request.setAttribute("Messages", Messages.displayError(e.toString()));
			System.out.println("An exception found.."+e);
		    }
		
		return returnS;
	}
	
	public String getALLSalesList(){
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
//			saleList=sdao.getAllSalesDetails();
			cList=sdao.getAllRegisterCustomerNames();
//			session.setAttribute("totalsales", saleList.size());
//			System.out.println("stock size=================== "+session.getAttribute("totalsales"));
//			System.out.println(saleList.get(0).getItemName());
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
	}
	
	public String getSaleskDetailsbyBillNo()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		try
		{
			float subtot=0;
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			String billno=request.getParameter("billNo");
			String doc=request.getParameter("doc");
			saleList=sdao.getAllSalesDetailsByBillNo(billno,doc);
			for(int i=0;i<saleList.size();i++)
			{
				subtot=subtot+Float.parseFloat(saleList.get(i).getItemtotal());
				System.out.println(subtot);
			}
			request.setAttribute("billNo",billno);
			request.setAttribute("subtotal", subtot);
			
			System.out.println("Decimal found.."+saleList.get(0).getBuyrate2());
			request.setAttribute("rCid", saleList.get(0).getRegcustomerId());
			if(saleList.get(0).getRegcustomerId().equalsIgnoreCase("0"))
			{
				request.setAttribute("tcName", saleList.get(0).getTempCustName());
				request.setAttribute("tcMob", saleList.get(0).getTemCustMobileNo());
				request.setAttribute("tcAdd", saleList.get(0).getTempCustAddress());
			}
			else
			{
				request.setAttribute("customerName", saleList.get(0).getCustomerName());
				request.setAttribute("customerAddress", saleList.get(0).getCustaddress());
				request.setAttribute("customerState", saleList.get(0).getCustState());
				request.setAttribute("customerpincode", saleList.get(0).getCustpincode());
				request.setAttribute("customeremail", saleList.get(0).getCustemail());
			}
			
		
			
			request.setAttribute("pamount", saleList.get(0).grandTotRoundvalueinDouble);
			request.setAttribute("vat", saleList.get(0).getVat());
			request.setAttribute("dis", saleList.get(0).getLessDiscount());
			request.setAttribute("lFreight", saleList.get(0).getLessloryFreight());
			request.setAttribute("uScheme", saleList.get(0).getLessUnit());
			request.setAttribute("comVat", saleList.get(0).getCompanyVatNo());
			
			
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		
		return SUCCESS;
		
	}
	
	public String salesDetailsByDateorCus()
	{
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		SalesMasterDao sdao=dfact.createSalesMasterManager();
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String customerId=request.getParameter("cId");
		String fromdate=request.getParameter("fromdate");
		String todate=request.getParameter("todate");
		String cnstatus=request.getParameter("checkuncheckstatus");

		try {
				if(!customerId.equalsIgnoreCase("0") && (fromdate.equalsIgnoreCase("")) && (fromdate.equalsIgnoreCase(""))){
					saleList=sdao.salesDetailsByCusId(customerId,cnstatus);
					retrunResult=SUCCESS;
				} else if (customerId.equalsIgnoreCase("0") && (!fromdate.equalsIgnoreCase("")) && (!fromdate.equalsIgnoreCase(""))) {
					saleList=sdao.salesDetailsByDate(fromdate, todate,cnstatus);
					retrunResult=SUCCESS;
				} else{
					saleList=sdao.salesDetailsByDateAndCusId(customerId,fromdate, todate);
					retrunResult=SUCCESS;
				}
					
		} catch (Exception e) {
			retrunResult=ERROR;
			e.printStackTrace();
		}
		return retrunResult;
	}
	
//####################################################### Sales Print Action  ##################################################

	public String  printSalesDetailsByBillno()
	{
		String returnResult="";
		System.out.println("called function");
		HttpServletRequest request=ServletActionContext.getRequest();
		String bill=request.getParameter("billno");
		String date=request.getParameter("doc");
		System.out.println("bill no found:" +bill);
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			saleList=sdao.getAllSalesDetailsByBillNo(bill,date);
			
			double gstrate=0.0;
			double gstAmt=0.0;
			double cgstamt=0.0;
			double cgstrate=0.0;
			double sgstrate=0.0;
			double sgstamt=0.0;
			double totbaseamount=0.0;
			double totaldiscount=0.0;
			int totalQTY=0;
			
			for(int i=0;i<saleList.size();i++)
			{
				
				gstrate=gstrate+Double.parseDouble(saleList.get(i).getGstrate());
				gstAmt=gstAmt+Double.parseDouble(saleList.get(i).getGstamt());
				
				cgstrate=cgstrate+Double.parseDouble(saleList.get(i).getCgstrate());
				cgstamt=cgstamt+Double.parseDouble(saleList.get(i).getCgstamt());
				
				sgstrate=sgstrate+Double.parseDouble(saleList.get(i).getSgstrate());
				sgstamt=sgstamt+Double.parseDouble(saleList.get(i).getSgstamt());
				totbaseamount=totbaseamount+Double.parseDouble(saleList.get(i).getBasetotal());
				totaldiscount=totaldiscount+Double.parseDouble(saleList.get(i).getSdiscountamt());
				totalQTY=totalQTY+Integer.parseInt(saleList.get(i).getQty());
				
			}
			
			
			
			int totalpair=0;
			for(SalesMasterDto s: saleList)
			{
				totalpair=totalpair+Integer.parseInt(s.getQty());
			}
			
			System.out.println("Decimal found.."+saleList.get(0).getBuyrate2());
			request.setAttribute("rCid", saleList.get(0).getRegcustomerId());
			if(saleList.get(0).getRegcustomerId().equalsIgnoreCase("0"))
			{
				request.setAttribute("tcName", saleList.get(0).getTempCustName());
				request.setAttribute("tcMob", saleList.get(0).getTemCustMobileNo());
				request.setAttribute("tcAdd", saleList.get(0).getTempCustAddress());
			}
			else
			{
				request.setAttribute("customerName", saleList.get(0).getCustomerName());
				request.setAttribute("customerAddress", saleList.get(0).getCustaddress());
			
				request.setAttribute("customerpincode", saleList.get(0).getCustpincode());
				request.setAttribute("customeremail", saleList.get(0).getCustemail());
				request.setAttribute("phoneno", saleList.get(0).getCustomerPhoneno());
				
			}
			
			request.setAttribute("customerState", saleList.get(0).getCustState());
			request.setAttribute("customergsttin", saleList.get(0).getCustgsttin());
			request.setAttribute("stcode", saleList.get(0).getStcode());
			
			
			
			
		
			
			
			request.setAttribute("Doc", saleList.get(0).getDoc());
			request.setAttribute("companyName", saleList.get(0).getCompanyName());
			request.setAttribute("companyAddress", saleList.get(0).getCompanyAddress());
			request.setAttribute("companyPhone", saleList.get(0).getCompanyPhonenumber());
			request.setAttribute("companyEmail", saleList.get(0).getCompanyemail());
			request.setAttribute("discount", saleList.get(0).getLessDiscount());
			request.setAttribute("lFreight", saleList.get(0).getLessloryFreight());
			request.setAttribute("lUnit", saleList.get(0).getLessUnit());
			request.setAttribute("vat", saleList.get(0).getVat());
			request.setAttribute("gTot", saleList.get(0).getGrandTotal());
			request.setAttribute("taxamount", saleList.get(0).getTaxamount());
			request.setAttribute("subtotal",saleList.get(0).getSubtotal());
			request.setAttribute("vatamt",saleList.get(0).getTaxamount());
			request.setAttribute("afterdiscount", saleList.get(0).getAfterdiscount());
			request.setAttribute("amountreceived", saleList.get(0).getAmountreceived());
			request.setAttribute("amountreturn", saleList.get(0).getAmountreturn());
			request.setAttribute("gsttin", saleList.get(0).getGsttin());
			request.setAttribute("totalpair", totalpair);
			request.setAttribute("totqty", totalQTY);
			
			
			request.setAttribute("cgstrate", saleList.get(0).getCgstrate());
			request.setAttribute("sgstrate", saleList.get(0).getSgstrate());
			
			request.setAttribute("totagstrate", saleList.get(0).getGstrate());
			request.setAttribute("totagstAmt", new DecimalFormat("##.##").format(gstAmt));
			
			request.setAttribute("totcgstamt",  new DecimalFormat("##.##").format(cgstamt));
			request.setAttribute("totcgstrate", cgstrate);
			
			request.setAttribute("totsgstrate", sgstrate);
			request.setAttribute("totsgstamt",  new DecimalFormat("##.##").format(sgstamt));
			request.setAttribute("totalbaseamount",  new DecimalFormat("##.##").format(totbaseamount)); 
			request.setAttribute("totaldiscountamt",  new DecimalFormat("##.##").format(totaldiscount));
			
			request.setAttribute("comVat", saleList.get(0).getCompanyVatNo());
			double gtot=round(saleList.get(0).getGrandTotRoundvalueinDouble(),2);
			System.out.println("gtot found..."+gtot);
			int roundValue=Math.round(saleList.get(0).getGrandTotRoundvalue());
			System.out.println(roundValue);
			String rval=roundValue+".00";
		
			
			
			if(saleList.get(0).getCustomerType().equals("REGULAR"))
			{
				returnResult="regularPrint";
			}
			else if(saleList.get(0).getCustomerType().equals("TEMP"))
			{
				returnResult="rollPrint";
			}
			
			
			
			double value =  Double.parseDouble(saleList.get(0).getGrandTotal());
			
			
			 int val=(int)Math.ceil(value);
			
			
			double rounded = (double) Math.round(value * 100) / 100;
			System.out.println(value +" rounded is "+ rounded);
			request.setAttribute("rval", val);
			String grandtotinWords="*** "+NumberToWordCalculation.convert(val)+" ONLY.***";
			request.setAttribute("gTotRoundValueIntger", saleList.get(0).getGrandTotal());
			request.setAttribute("gTotRoundValue", grandtotinWords);
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		request.setAttribute("bill", bill);
		return returnResult;
	}
	
	
	
	public static double round(double value, int decimalPlace)
    {
      double power_of_ten = 1;
      // floating point arithmetic can be very tricky.
      // that's why I introduce a "fudge factor"
      double fudge_factor = 0.05;
      while (decimalPlace-- > 0) {
         power_of_ten *= 10.0d;
         fudge_factor /= 10.0d;
      }
      return Math.round((value + fudge_factor)* power_of_ten)  / power_of_ten;
    }
	
	
	
//	public static double round(double value, int places) {
//	    if (places < 0) throw new IllegalArgumentException();
//
//	    long factor = (long) Math.pow(10, places);
//	    value = value * factor;
//	    long tmp = Math.round(value);
//	    return (double) tmp / factor;
//	}
	
	
//####################################################### Sales Print Action  ##################################################
	
//____________________________________----- Credit Note Calculation : Start _______________________________________________________
	
	public String creditNoteCall(){
		HttpServletRequest request=ServletActionContext.getRequest();
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			cList=sdao.getTempCustomerListFromSales();
		
//			itemList=sdao.getSoldItemList();
			itemList=idao.getAllItemByCompanyId();
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
	}
	
	public String getCNRefundableDetByBillno()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String bId=request.getParameter("billno");
		bId=bId.trim();
	
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			crList=sdao.getcreditNoteDetailsBybillNo(bId);
			request.setAttribute("billno", bId);
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
		
	}
	
	
	public String creditNoteDetailsCall()
	{
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
			cList=sdao.getTempCustomerListFromSales();
		
//			itemList=sdao.getSoldItemList();
			itemList=idao.getAllItemByCompanyId();
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
	}
	
	public String getCustBuyDetails()
    { 
    	String returnresult=ERROR;
    	HttpServletRequest request=ServletActionContext.getRequest();
		String custBarcode=request.getParameter("customerBarcode");
		String billNo=request.getParameter("billno");
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			saleList=sdao.getCusBuyDetailsByBarcode(custBarcode,billNo);
			System.out.println("size= "+saleList.size());
			request.setAttribute("Doc", saleList.get(0).getDoc());
			request.setAttribute("discount", saleList.get(0).getLessDiscount());
			request.setAttribute("lFreight", saleList.get(0).getLessloryFreight());
			request.setAttribute("lUnit", saleList.get(0).getLessUnit());
			request.setAttribute("vat", saleList.get(0).getVat());
			request.setAttribute("gTot", saleList.get(0).getGrandTotal());
			request.setAttribute("taxamount", saleList.get(0).getTaxamount());
			returnresult=SUCCESS;
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
    	return returnresult;
    }
	
	public String addCreditNote() {
		String result=ERROR;
		DaoFactory dfact=new DaoFactory();
		SalesMasterDao sdao=dfact.createSalesMasterManager();
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String[] crBillNo=request.getParameterValues("crBillNO[]");
		String[] crItemId=request.getParameterValues("crItemId[]");
		String[] crRtQty=request.getParameterValues("crRtQty[]");
		String[] critemSize=request.getParameterValues("critemSize[]");
		String[] crsaleRt=request.getParameterValues("crsaleRt[]");
		String crVat=request.getParameter("crVat");
		String[] critemtot=request.getParameterValues("critemtot[]");
		String crSubTot=request.getParameter("crSubTot");
		String crGTot=request.getParameter("crGTot");
		String customerID=request.getParameter("customerID");
		
		String customerBarcode=request.getParameter("customerBarcode");
		
		String creditNoteNumber=new String();
		int creditNoteIdentityNumber=0;
		try {
			creditNoteNumber=sdao.creditNoGenerateEngine(CurrentCompAndUser.getCurrentCompany());
			creditNoteIdentityNumber=sdao.creditNoteIdentityGenerateEngine(CurrentCompAndUser.getCurrentCompany());
			log.info("credit Note number generated is : "+creditNoteNumber );

			crDto.setCnNo(creditNoteNumber);
			crDto.setCnIdentityCode(creditNoteIdentityNumber+"");
			crDto.setCustomerId(customerBarcode);
			crDto.setRefundSubTot(crSubTot);
			crDto.setCreditAmount(crGTot);
			crDto.setSaleVat(crVat);
			
			for(int i=0; i<crRtQty.length; i++)
			{
				if(!crRtQty[i].equalsIgnoreCase("0") && !crRtQty[i].equalsIgnoreCase("")){
					crDto.setRefundItemQty(crRtQty[i]);
					crDto.setSaleBillNo(crBillNo[i]);
					crDto.setRefundItemId(crItemId[i]);
					crDto.setRefundItemSize(critemSize[i]);
					crDto.setSaleRate(crsaleRt[i]);
					crDto.setRefundItemTot(critemtot[i]);
					crDto.setCustomerId(customerID);
					crList.add(crDto);
					
					}
				}

		if(sdao.addCreditNotes(crList)){
			request.setAttribute("Messages","Credit Note Saved Successfully");	
			result=SUCCESS;
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public String getCreditNoteListByCustBarcode()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String cId=request.getParameter("custBarcode");
		cId=cId.trim();
		System.out.println("cusID= "+cId);
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			crList=sdao.getcreditNoteDetailsByCustomerID(cId);
			
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
		
	}
	
	
	
	public String callSaleBillDetails(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String cId=request.getParameter("customerBarcode");
		
		cId=cId.trim();
		System.out.println("cusID= "+cId);
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			
			saleList=sdao.getBillNoByCustomerId(cId);
		
			
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
	}
	
	
	
	public String callSaleBillDetailsByCustID() 
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String cId=request.getParameter("custID");
		
		cId=cId.trim();
		System.out.println("cusID= "+cId);
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			
			saleList=sdao.getBillNoByCustomerIdsOnly(cId);
		
			
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;	
		
	}
	
	public String getCnListofCus() {
		HttpServletRequest request=ServletActionContext.getRequest();
		String cId=request.getParameter("customerBarcode");
		cId=cId.trim();
		System.out.println("cusID= "+cId);
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			crList=sdao.getAllCreditNoteNoByCustomerCode(cId);
			System.out.println(crList.get(0).getCnNo());
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
	}
	
	public String replaceProduct() {
		String returnS=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String[] size=request.getParameterValues("size[]");
		String[] qty=request.getParameterValues("qty[]");
		String[] brate=request.getParameterValues("brate[]");
		String[] srate=request.getParameterValues("srateA[]");
		String[] tot=request.getParameterValues("tot[]");
		String[] itemId=request.getParameterValues("article[]");
		
		
		String cusBarcode=request.getParameter("customerBarcode");
		String billno=saleDto.getBillno();
		System.out.println(billno);
		
		try{
			
			String dueStatus=request.getParameter("DueStatus");
			if(dueStatus.equals(null))
			{	
			 saleDto.setDueStatus("");
			}
			else if(!dueStatus.equals(null))
			{
			saleDto.setDueStatus(request.getParameter("DueStatus"));	
			}
			}
			catch(NullPointerException h)
			{
			saleDto.setDueStatus("");
			}
		
		
		
		DaoFactory dfact=new DaoFactory();
			
		SalesMasterDao sdao=dfact.createSalesMasterManager();
		
		String abPath=request.getServletContext().getRealPath("/img");
		System.out.println("abPath= "+abPath);
		System.out.println("abPath= "+request.getSession().getServletContext().getRealPath("/img"));
		
		boolean result;
		try {
			CustomerMasterDAO cdao=dfact.createCustomerManager();
			cList=cdao.getCustomerDetailsByCustBarcode(cusBarcode);
			saleDto.setRegcustomerId(cList.get(0).getCustomerId());
			saleDto.setTempCustName(cList.get(0).getcName());
			saleDto.setTemCustMobileNo(cList.get(0).getMobile());
			saleDto.setTempCustAddress(cList.get(0).getAddress());
			saleDto.setTempCustBarcode(cList.get(0).getCustomerBarcode());
			saleDto.setTempCustBarcodeUrl(cList.get(0).getCustomerBarcodeUrl());
			saleDto.setCustomerType("TEMP");
			
			result = sdao.saveReplaceProduct(saleDto, size,qty, srate, tot,itemId,brate,cusBarcode);
			if(result)
			{   returnS=SUCCESS;
			    request.setAttribute("billno", billno);
				request.setAttribute("Messages", Messages.salesSaveSuccesfully);
			}
			else
			{
				request.setAttribute("Messages", Messages.errorSavingSupply);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return returnS;
	}
	
	
	
	
	
	public String searchProductCode()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String pCode=request.getParameter("productCode");
	
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			saleList=sdao.getSaleDetailsByProductCode(pCode);
			System.out.println(saleList.get(0).getBillno());
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;	
	}
	
//____________________________________----- Credit Note Calculation : End _______________________________________________________

	//####################################################################################### Excel export for purchase list start here #####################################################################################	
	public String exportingSaleDetails()
    {
    	String currentdate=  CurrentDate.getOnlyDateWithMySQLFORMAT();
    	String result=SUCCESS;
    	HttpServletResponse response=ServletActionContext.getResponse();
    	String[] header2 = new String[]{"INVOICE/BILL NO", "CUSTOMER NAME","CUSTOMER GST-TIN NO.", "SALE DATE" , "ITEM TOTAL (BEFORE GST)", "GST RATE", "GST AMT", 
    			"CGST RATE", "CGST AMT" ,"SGST RATE", "SGST AMT", "IGST RATE", "IGST AMT" ,"GRANDTOTAL"};  
    	HttpServletRequest request=ServletActionContext.getRequest();
    	String customerId=request.getParameter("cId");
    	customerId=customerId.trim();
		String fromdate=request.getParameter("fromdate");
		String todate=request.getParameter("todate");
		String vatcst="";
		
		String CNorNoCn=request.getParameter("cnstatus");
		
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao saldao=dfact.createSalesMasterManager();
			saleList=saldao.exportToexcelSaleDetails(fromdate, todate, customerId, vatcst,CNorNoCn);
			
	
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			cList=sdao.getAllCustomerFromSales();
			ExcelExport ee=new ExcelExport();
			List<String> columnNames = new ArrayList<String>();
			List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
			String title=saleList.get(0).getTitleforExcel();
			int k=1;
			int inc=0;
			Map<String, Object>h = new HashMap<String, Object>();
			for (SalesMasterDto il : saleList) {
               Integer i = 0;
               Map<String, Object> m = new HashMap<String, Object>();
               m.put((++i).toString(),il.getBillno() );
               m.put((++i).toString(),il.getCustomerName() );
               m.put((++i).toString(),il.getVat() );
               m.put((++i).toString(),il.getDoc());
               m.put((++i).toString(),il.getBasetotal());
               m.put((++i).toString(),il.getGstrate());
               m.put((++i).toString(),il.getGstamt());
               m.put((++i).toString(),il.getCgstrate());
               m.put((++i).toString(),il.getCgstamt());
               m.put((++i).toString(),il.getSgstrate());
               m.put((++i).toString(),il.getSgstamt());
               m.put((++i).toString(),"0");
               m.put((++i).toString(),"0");
               m.put((++i).toString(),il.getGrandTotal());
               h=m;
               inc=i;
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
			response.setHeader("Content-Disposition", "attachment; filename=SaleReport_"+currentdate+".xls");
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
 
	
	public String exportingSaleDetailsgstr()
    {
    	String currentdate=  CurrentDate.getOnlyDateWithMySQLFORMAT();
    	String result=SUCCESS;
    	HttpServletResponse response=ServletActionContext.getResponse();
    	String[] header2 = new String[]{"INVOICE/BILL NO", "CUSTOMER NAME","GST-TIN NO.", "SALE DATE" , "ITEM TOTAL (BEFORE GST)", "GST RATE", "GST AMT", 
    			"CGST RATE", "CGST AMT" ,"SGST RATE", "SGST AMT", "IGST RATE", "IGST AMT" ,"GRANDTOTAL"};  
    	HttpServletRequest request=ServletActionContext.getRequest();
    	String customerId=request.getParameter("cId");
    	customerId=customerId.trim();
		String fromdate=request.getParameter("fromdate");
		String todate=request.getParameter("todate");
		String vatcst="";
		
		String CNorNoCn=request.getParameter("cnstatus");
		
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao saldao=dfact.createSalesMasterManager();
			saleList=saldao.exportToexcelSaleDetailsgstr(fromdate, todate, customerId, vatcst,CNorNoCn);
		
			
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			cList=sdao.getAllRegisterCustomerNames();
			ExcelExport ee=new ExcelExport();
			List<String> columnNames = new ArrayList<String>();
			List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
			String title=saleList.get(0).getTitleforExcel();
			int k=1;
			int inc=0;
			Map<String, Object>h = new HashMap<String, Object>();
			for (SalesMasterDto il : saleList) {
               Integer i = 0;
               Map<String, Object> m = new HashMap<String, Object>();
               m.put((++i).toString(),il.getBillno() );
               m.put((++i).toString(),il.getCustomerName() );
               m.put((++i).toString(),il.getVat() );
               m.put((++i).toString(),il.getDoc());
               m.put((++i).toString(),il.getBasetotal());
               m.put((++i).toString(),il.getGstrate());
               m.put((++i).toString(),il.getGstamt());
               m.put((++i).toString(),il.getCgstrate());
               m.put((++i).toString(),il.getCgstamt());
               m.put((++i).toString(),il.getSgstrate());
               m.put((++i).toString(),il.getSgstamt());
               m.put((++i).toString(),"0");
               m.put((++i).toString(),"0");
               m.put((++i).toString(),il.getGrandTotal());
               h=m;
               inc=i;
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
			response.setHeader("Content-Disposition", "attachment; filename=SaleReport_"+currentdate+".xls");
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
	
	public String exportingSaleDetailsgstrjson()
    {
    	String currentdate=  CurrentDate.getOnlyDateWithMySQLFORMAT();
    	String result=SUCCESS;
    	HttpServletResponse response=ServletActionContext.getResponse();
    	String[] header2 = new String[]{"INVOICE/BILL NO", "CUSTOMER NAME","GST-TIN NO.", "SALE DATE" , "ITEM TOTAL (BEFORE GST)", "GST RATE", "GST AMT", 
    			"CGST RATE", "CGST AMT" ,"SGST RATE", "SGST AMT", "IGST RATE", "IGST AMT" ,"GRANDTOTAL"};  
    	HttpServletRequest request=ServletActionContext.getRequest();
    	String customerId=request.getParameter("cId");
    	customerId=customerId.trim();
		String fromdate=request.getParameter("fromdate");
		String todate=request.getParameter("todate");
		String vatcst="";
		
		String CNorNoCn=request.getParameter("cnstatus");
		
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao saldao=dfact.createSalesMasterManager();
			saleList=saldao.exportToexcelSaleDetailsgstr(fromdate, todate, customerId, vatcst,CNorNoCn);
		
			
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			cList=sdao.getAllCustomerFromSales();
			ExcelExport ee=new ExcelExport();
			List<String> columnNames = new ArrayList<String>();
			List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
			String title=saleList.get(0).getTitleforExcel();
			int k=1;
			int inc=0;
			Map<String, Object>h = new HashMap<String, Object>();
			for (SalesMasterDto il : saleList) {
               Integer i = 0;
               Map<String, Object> m = new HashMap<String, Object>();
               m.put((++i).toString(),il.getBillno() );
               m.put((++i).toString(),il.getCustomerName() );
               m.put((++i).toString(),il.getVat() );
               m.put((++i).toString(),il.getDoc());
               m.put((++i).toString(),il.getBasetotal());
               m.put((++i).toString(),il.getGstrate());
               m.put((++i).toString(),il.getGstamt());
               m.put((++i).toString(),il.getCgstrate());
               m.put((++i).toString(),il.getCgstamt());
               m.put((++i).toString(),il.getSgstrate());
               m.put((++i).toString(),il.getSgstamt());
               m.put((++i).toString(),"0");
               m.put((++i).toString(),"0");
               m.put((++i).toString(),il.getGrandTotal());
               h=m;
               inc=i;
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
			response.setHeader("Content-Disposition", "attachment; filename=SaleReport_"+currentdate+".xls");
			ServletOutputStream out = response.getOutputStream();
			 String filename = request.getServletContext().getRealPath("/gstr/Exceljson.xls");
			 System.out.println(filename);
		    FileOutputStream fileOut = new FileOutputStream(filename);
			
			
			wb.write(fileOut);
			fileOut.flush();
			fileOut.close();
//			response.getOutputStream().flush();
//			response.getOutputStream().close();
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
   public String searchCustBarcode()
   {
	    String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String cId=request.getParameter("customerBarcode");
		cId=cId.trim();
		System.out.println("cusID= "+cId);
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			cList=sdao.getTempCustomerListFromSalesByCustBarcode(cId);
			result=SUCCESS;
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return result;
   }
    
   public String SerchCustDetailsByProductCode()
   {
	    String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		String productCode=request.getParameter("productCode");
		
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			cList=sdao.getTempCustomerListFromSalesByProductcode(productCode);
			result=SUCCESS;
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return result; 
   }
//####################################################################################### Excel export for purchase list End here #####################################################################################	
	
	
    public String getTempCustDetails()
    { 
    	String returnresult=ERROR;
    	HttpServletRequest request=ServletActionContext.getRequest();
		String tempCustBarcode=request.getParameter("tCustBarcode");
		try
		{
			DaoFactory dfact=new DaoFactory();
			CustomerMasterDAO cDao=dfact.createCustomerManager();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			cList=cDao.getCustomerDetailsByCustBarcode(tempCustBarcode);
			double getTotalSaleAmountToCustomer=sdao.getTotalSellDetailsOfPerticularCustomer(tempCustBarcode);
			
			if(cList.size()>0)
			{
			saleDto.setTempCustName(cList.get(0).getcName());
			saleDto.setTemCustMobileNo(cList.get(0).getMobile());
			saleDto.setTempCustAddress(cList.get(0).getAddress());
			saleDto.setTempCustBarcode(cList.get(0).getCustomerBarcode());
			saleDto.setTempCustBarcodeUrl(cList.get(0).getCustomerBarcodeUrl());
			saleDto.setRegcustomerId(cList.get(0).getCustomerId());
			request.setAttribute("totalSellAmount", getTotalSaleAmountToCustomer+"");
			returnresult=SUCCESS;
			
			}
			else
			{
				request.setAttribute("Msg", "Sorry No details found try agian !!");	
			}
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
    	return returnresult;
    }
	
    public String getTempCustBuyDetails()
    { 
    	String returnresult=ERROR;
    	HttpServletRequest request=ServletActionContext.getRequest();
		String tempCustBarcode=request.getParameter("tCustBarcode");
		try
		{
			DaoFactory dfact=new DaoFactory();
			SalesMasterDao sdao=dfact.createSalesMasterManager();
			
			saleList=sdao.gettmpCusBuyDetailsByBarcode(tempCustBarcode);
			System.out.println("size= "+saleList.size());
			double getTotalSaleAmountToCustomer=sdao.getTotalSellDetailsOfPerticularCustomer(tempCustBarcode);
			request.setAttribute("tcName", saleList.get(0).getTempCustName());
			request.setAttribute("tcMob", saleList.get(0).getTemCustMobileNo());
			request.setAttribute("tcAdd", saleList.get(0).getTempCustAddress());
			
			request.setAttribute("Doc", saleList.get(0).getDoc());
			
			request.setAttribute("discount", saleList.get(0).getLessDiscount());
			request.setAttribute("lFreight", saleList.get(0).getLessloryFreight());
			request.setAttribute("lUnit", saleList.get(0).getLessUnit());
			request.setAttribute("vat", saleList.get(0).getVat());
			request.setAttribute("gTot", saleList.get(0).getGrandTotal());
			request.setAttribute("taxamount", saleList.get(0).getTaxamount());
			request.setAttribute("totalSellAmount", getTotalSaleAmountToCustomer+"");
			returnresult=SUCCESS;
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
    	return returnresult;
    }
	
    public String addTempCustCall()
    {
    	System.out.println("called");
    	return SUCCESS;
    }
    
    public String addoneTimeTempCustCall()
    {
    	System.out.println("called");
    	return SUCCESS;
    }
    
    public String addTempCustDetails()
    {
    	String result=ERROR;
    	HttpServletRequest request=ServletActionContext.getRequest();
		String custName=request.getParameter("custName");
		String custMobile=request.getParameter("custMobile");
		String custAddress=request.getParameter("custAddress");
		cDTo.setcName(custName);
		cDTo.setMobile(custMobile);
		cDTo.setAddress(custAddress);
		cDTo.setPhoneno(custMobile);
		cDTo.setPhoneno(custMobile);
		cDTo.setEmail("");
		cDTo.setState("");
		cDTo.setPincode("");
		cDTo.setFax("");
		cDTo.setVat("");
		cDTo.setType("");
		cDTo.setNote("");
		cDTo.setCustomerType("TEMP");
		cDTo.setDateofcreate(CurrentDate.getDate());
		try
		{
			DaoFactory dfact=new DaoFactory();
			CustomerMasterDAO cdao=dfact.createCustomerManager();
			boolean saveresult=cdao.saveCustomerDetails(cDTo);
			if(saveresult)
			{
			request.setAttribute("Msg", "Customer Added Successfully !!!");	
			result=SUCCESS;
			}
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return result;
    }
  
    
 //*********************************************************************************************************************************   
 ////////////////////////GST REPORT CALCULATION CODE BY PRADIPTO ROY ////////////////////////////////////////////////////////////////
 //*********************************************************************************************************************************    
    private static final String COMMA_DELIMITER = ",";
    private static final String NEW_LINE_SEPARATOR = "\n";
 
    private static final String VFILE_HEADER = "GSTIN/UIN of Recipient ,Invoice Number,"
    		+ "Invoice date,Invoice Value,Place Of Supply,Reverse Charge,Invoice Type,E-Commerce GSTIN,Rate,Taxable Value,Cess Amount";
    
    private static final String B2C_HEADER = "Invoice Number,"
    		+ "Invoice date,Invoice Value,Place Of Supply,Rate,Taxable Value,Cess Amount,E-Commerce GSTIN";
    
    
    
    private static final String HSNWISE_HEADER = "HSN,"
    		+ "Description,UQC,Total Quantity,Total Value,Taxable Value,Integrated Tax Amount,Central Tax Amount,State/UT Tax Amount,Cess Amount";
    
    
//    private static final String B2C_HEADER = "GSTIN/UIN of Recipient ,Invoice Number,"
//    		+ "Invoice date,Invoice Value,Place Of Supply,Rate,Taxable Value,Cess Amount,E-Commerce GSTIN";
    
   public String salegstexport()
    {
    	
    	String result=ERROR;
    	String filename="";
    	HttpServletRequest request=ServletActionContext.getRequest();
    	FileWriter fileWriter = null;
    	String fromdate=request.getParameter("fromdate");	
    	String todate=request.getParameter("todate");	
    	
        String vatcst="";
		
		String CNorNoCn="No C.N";
		String fileheader="";
    	String gstreporttype=request.getParameter("gstreporttype");
    	DaoFactory dfact=new DaoFactory();
		SalesMasterDao saldao=dfact.createSalesMasterManager();
    	try
    	{

    	filename="B2B_From_"+fromdate+"_To_"+todate;	
    	String fileName=ServletActionContext.getServletContext().getRealPath("/gstr/"+filename+".csv");
    	
    		
    	System.out.println(fromdate+" "+todate);
    	
    	if(gstreporttype.equalsIgnoreCase("B2B"))
    	{
    	saleList=saldao.exportToexcelSaleDetailsgstrexpnopan(fromdate, todate, "0", vatcst,CNorNoCn);
        fileheader="ADAK SHOE B2B Report from "+fromdate+" To "+todate;
        
        fileWriter = new FileWriter(fileName);

    	fileWriter.append(fileheader.toString());
    	fileWriter.append(NEW_LINE_SEPARATOR);
    	fileWriter.append("");
    	fileWriter.append(NEW_LINE_SEPARATOR);
     	fileWriter.append(VFILE_HEADER.toString());
		fileWriter.append(NEW_LINE_SEPARATOR);	
    		
		for (SalesMasterDto csdto :saleList) 
		{
			fileWriter.append(csdto.getVat());
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append(csdto.getBillno());
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append(csdto.getDoc());
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append(csdto.getGrandTotal());
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append("19-West Bengal");
			
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append("N");
			
			
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append("Regular");
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append("");
		
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append(csdto.getGstrate());
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append(csdto.getBasetotal());
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append("0");
			
			fileWriter.append(NEW_LINE_SEPARATOR);
		}
		
    	}
    	else if(gstreporttype.equalsIgnoreCase("B2C"))
    	{
    		saleList=saldao.exportToexcelSaleDetailsgstrexpwithpan(fromdate, todate, "0", vatcst,CNorNoCn);
            fileheader="ADAK SHOE B2Cl Report from "+fromdate+" To "+todate;
            
            fileWriter = new FileWriter(fileName);

        	fileWriter.append(fileheader.toString());
        	fileWriter.append(NEW_LINE_SEPARATOR);
        	fileWriter.append("");
        	fileWriter.append(NEW_LINE_SEPARATOR);
         	fileWriter.append(B2C_HEADER.toString());
    		fileWriter.append(NEW_LINE_SEPARATOR);	
        		
    		for (SalesMasterDto csdto :saleList) 
    		{
    	
    			fileWriter.append(csdto.getBillno());
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append(csdto.getDoc());
    			fileWriter.append(COMMA_DELIMITER);
    			
    			fileWriter.append(csdto.getBasetotal());
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append("19-West Bengal");
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append(csdto.getGstrate());
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append(csdto.getGrandTotal());
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append("0");
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append("NA");
    			fileWriter.append(NEW_LINE_SEPARATOR);
    	}
    
    	}
    	
    	
    	else if(gstreporttype.equalsIgnoreCase("hsncodewise"))
    	{
    		saleList=saldao.exportHSNWISEREPORT(fromdate, todate, "0", vatcst,CNorNoCn);
            fileheader="ADAK SHOE HSNCODEWISE Report from "+fromdate+" To "+todate;
            
            fileWriter = new FileWriter(fileName);

        	fileWriter.append(fileheader.toString());
        	fileWriter.append(NEW_LINE_SEPARATOR);
        	fileWriter.append("");
        	fileWriter.append(NEW_LINE_SEPARATOR);
         	fileWriter.append(HSNWISE_HEADER.toString());
    		fileWriter.append(NEW_LINE_SEPARATOR);	
        	
    		double gtotalqty=0;
    		double gitmtotal=0;
    		double gbasetotal=0;
    		double grandgstamt=0;
    		
    		
    		
    		for (SalesMasterDto csdto :saleList) 
    		{
    	
    			fileWriter.append(csdto.getHsncode());
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append("Not Available");
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append("PCS-PIECES");
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append(csdto.getQty());
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append(csdto.getItemtotal());
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append(csdto.getBasetotal());
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append("0");
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append(csdto.getCgstamt());
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append(csdto.getSgstamt());
    			fileWriter.append(COMMA_DELIMITER);
    			fileWriter.append("0");
    			fileWriter.append(NEW_LINE_SEPARATOR);
    			
    			gtotalqty= gtotalqty+Double.parseDouble(csdto.getQty());
    			gbasetotal= gbasetotal+Double.parseDouble(csdto.getBasetotal());
	
    	}
    		grandgstamt=gbasetotal*5/100;
    		gitmtotal=gbasetotal+grandgstamt;
    		
    		fileWriter.append(NEW_LINE_SEPARATOR);	
    		fileWriter.append("Total");
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append("");
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append("");
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append(gtotalqty+"");
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append(gitmtotal+"");
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append(gbasetotal+"");
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append("");
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append(grandgstamt/2+"");
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append(grandgstamt/2+"");
			fileWriter.append(COMMA_DELIMITER);
			fileWriter.append("");
			fileWriter.append(NEW_LINE_SEPARATOR);
    		
    	}
    	

		System.out.println(fileName);	
		System.out.println("CSV file was created successfully !!!");
		request.setAttribute("filename", filename);
		
		if(saleList.size()>0)
		{
			result=SUCCESS;
		}
		
		
		
		     
	} catch (Exception e) {
		System.out.println("Error in CsvFileWriter !!!");
		result=ERROR;
		e.printStackTrace();
	} finally {
		
		try {
			fileWriter.flush();
			fileWriter.close();
		} catch (IOException e) {
			System.out.println("Error while flushing/closing fileWriter !!!");
           e.printStackTrace();
		}
	
		
	}
	   
	  return result; 
    	
    }
    
   //*********************************************************************************************************************************   
   ////////////////////////GST REPORT CALCULATION CODE BY PRADIPTO ROY ////////////////////////////////////////////////////////////////
   //*********************************************************************************************************************************    
}
