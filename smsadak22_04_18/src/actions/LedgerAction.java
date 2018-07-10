package actions;

import java.awt.Color;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import util.CurrentDate;
import util.ExcelExport;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.html.simpleparser.HTMLWorker;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.opensymphony.xwork2.ActionSupport;

import dTO.CustomerLedgerDto;
import dTO.CustomerMasterDTO;
import dTO.PurchaseLedgerDto;
import dTO.SalesMasterDto;
import dTO.SchemeMasterDto;
import dTO.StockMasterDTO;
import dTO.SupplierMasterDTO;
import dao.CustomerMasterDAO;
import dao.DaoException;
import dao.DaoFactory;
import dao.LedgerDao;
import dao.SalesMasterDao;
import dao.StockMasterDAO;
import dao.SupplierMasterDAO;
import dao.SupplierPaymentDao;
;

public class LedgerAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	List<SupplierMasterDTO> supList =new ArrayList<SupplierMasterDTO>();
	List<PurchaseLedgerDto> pLedgerList =new ArrayList<PurchaseLedgerDto>();
	List<PurchaseLedgerDto> pLedgerList2 =new ArrayList<PurchaseLedgerDto>();
	List<PurchaseLedgerDto> pLedgerList3 =new ArrayList<PurchaseLedgerDto>();
	List<StockMasterDTO> paymentList=new ArrayList<StockMasterDTO>();
	PurchaseLedgerDto pdto=new PurchaseLedgerDto();
	StockMasterDTO sdto=new StockMasterDTO();
	List<CustomerMasterDTO> clist=new ArrayList<CustomerMasterDTO>();
	List<CustomerLedgerDto> saleLedger=new ArrayList<CustomerLedgerDto>();
	List<CustomerLedgerDto> ledgerCNList=new ArrayList<CustomerLedgerDto>();
	
	public List<CustomerMasterDTO> getClist() {
		return clist;
	}
	public void setClist(List<CustomerMasterDTO> clist) {
		this.clist = clist;
	}
	public List<CustomerLedgerDto> getSaleLedger() {
		return saleLedger;
	}
	public void setSaleLedger(List<CustomerLedgerDto> saleLedger) {
		this.saleLedger = saleLedger;
	}
	public synchronized List<PurchaseLedgerDto> getpLedgerList2() {
		return pLedgerList2;
	}
	public synchronized void setpLedgerList2(List<PurchaseLedgerDto> pLedgerList2) {
		this.pLedgerList2 = pLedgerList2;
	}
	
	public synchronized List<PurchaseLedgerDto> getpLedgerList3() {
		return pLedgerList3;
	}
	public synchronized void setpLedgerList3(List<PurchaseLedgerDto> pLedgerList3) {
		this.pLedgerList3 = pLedgerList3;
	}
	
	public synchronized List<SupplierMasterDTO> getSupList() {
		return supList;
	}
	public synchronized void setSupList(List<SupplierMasterDTO> supList) {
		this.supList = supList;
	}
	
	public List<PurchaseLedgerDto> getpLedgerList() {
		return pLedgerList;
	}
	public void setpLedgerList(List<PurchaseLedgerDto> pLedgerList) {
		this.pLedgerList = pLedgerList;
	}
	public synchronized PurchaseLedgerDto getPdto() {
		return pdto;
	}
	public synchronized void setPdto(PurchaseLedgerDto pdto) {
		this.pdto = pdto;
	}
	public synchronized StockMasterDTO getSdto() {
		return sdto;
	}
	public synchronized void setSdto(StockMasterDTO sdto) {
		this.sdto = sdto;
	}
	public synchronized List<StockMasterDTO> getPaymentList() {
		return paymentList;
	}
	public synchronized void setPaymentList(List<StockMasterDTO> paymentList) {
		this.paymentList = paymentList;
	}
	@Override
	public String execute() throws Exception {

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
	
	public String getALLPLedgerListOfPerticularSupplier(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String sId=request.getParameter("supplierId");
		String mode=request.getParameter("mode");
		String fromdate=request.getParameter("fromdate");
		String todate=request.getParameter("todate");
		sId=sId.trim();
		System.out.println("supID= "+sId);
		float totalpurchaseAmount=0;
		float totalDebitAmount=0;
		float outStandingAmount=0;
		try
		{
			DaoFactory dfact=new DaoFactory();
			LedgerDao ldao=dfact.createLedgerManager();
			pLedgerList=ldao.getPLedgerDetailsBySuppplierId(Integer.parseInt(sId),mode,fromdate,todate);
			for(int i=0;i<pLedgerList.size();i++)
			{
				totalpurchaseAmount=totalpurchaseAmount+ Float.parseFloat(pLedgerList.get(i).getPurchaseAmount());
				totalDebitAmount=totalDebitAmount+Float.parseFloat(pLedgerList.get(i).getDebitAmount());
			}
			System.out.println("Total Purchase amount found ... "+totalpurchaseAmount);
			System.out.println("Total Debit amount found ... "+totalDebitAmount);
			outStandingAmount=totalpurchaseAmount-totalDebitAmount;
			System.out.println("Total Out Standing amount found ... "+outStandingAmount);
			
			pdto.setTotPurchaseAmount(totalpurchaseAmount+"");
			pdto.setTotDebitAmount( totalDebitAmount+"");
			pdto.setTotOutStandingAmount(outStandingAmount+"");
	
			System.out.println(pLedgerList.size());
			
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
	}
	
	public String getpLedgerByModeAndSup(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String sId=request.getParameter("supplierId");
		String mode=request.getParameter("mode");
		sId=sId.trim();
		System.out.println("supID= "+sId);
		float totalpurchaseAmount=0;
		float totalDebitAmount=0;
		float outStandingAmount=0;
		try
		{
			DaoFactory dfact=new DaoFactory();
			LedgerDao ldao=dfact.createLedgerManager();
			pLedgerList=ldao.getpLedgerByModeAndSup(Integer.parseInt(sId),mode);
			for(int i=0;i<pLedgerList.size();i++)
			{
				totalpurchaseAmount=totalpurchaseAmount+ Float.parseFloat(pLedgerList.get(i).getPurchaseAmount());
				totalDebitAmount=totalDebitAmount+Float.parseFloat(pLedgerList.get(i).getDebitAmount());
			}
			System.out.println("Total Purchase amount found ... "+totalpurchaseAmount);
			System.out.println("Total Debit amount found ... "+totalDebitAmount);
			outStandingAmount=totalpurchaseAmount-totalDebitAmount;
			System.out.println("Total Out Standing amount found ... "+outStandingAmount);
			
			pdto.setTotPurchaseAmount(totalpurchaseAmount+"");
			pdto.setTotDebitAmount( totalDebitAmount+"");
			pdto.setTotOutStandingAmount(outStandingAmount+"");
	
			System.out.println(pLedgerList.size());
			
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		return SUCCESS;
	}
	
	
	
	public String getLedgerByBillNoDnNo(){
		HttpServletRequest request=ServletActionContext.getRequest();
		String bill=request.getParameter("billNo");
		String dn=request.getParameter("dn");
		String sId=request.getParameter("supplierId");
		sId=sId.trim();
		System.out.println("supID= "+sId);
		System.out.println("bill= "+bill);
		System.out.println("dn "+dn);
		try
		{
			float subtot=0;
			DaoFactory dfact=new DaoFactory();
			LedgerDao ldao=dfact.createLedgerManager();
			pLedgerList=ldao.getLedgerByBillNoDnNo(bill, dn, Integer.parseInt(sId));
			System.out.println(pLedgerList.size());
			/*for(int i=0;i<pLedgerList.size();i++)
			{
				String it=pLedgerList.get(i).getItemTot()+"";
				subtot=subtot+Float.parseFloat(it);
				System.out.println(subtot);
			}*/
			request.setAttribute("subtot", pLedgerList.get(0).getSubTot());
			request.setAttribute("pamount", pLedgerList.get(0).getPurchaseAmount());
			request.setAttribute("vat", pLedgerList.get(0).getVat());
			request.setAttribute("cst", pLedgerList.get(0).getCst());
			request.setAttribute("waybill", pLedgerList.get(0).getWaybill());
			request.setAttribute("dis", pLedgerList.get(0).getDiscounts());
			request.setAttribute("lFreight", pLedgerList.get(0).getLorryFreight());
			request.setAttribute("uScheme", pLedgerList.get(0).getLessUnitScheme());
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		request.setAttribute("bill", bill);
		request.setAttribute("dn", dn);
		return SUCCESS;
	}
//################################################################################### Printing method for generating PDF file for perticular DN Number ##################################################################################################	
	public String printledgerByBillAndDnNo() 
	{
		
		HttpServletRequest request=ServletActionContext.getRequest();
		String bill=request.getParameter("billNo");
		String dn=request.getParameter("dn");
		System.out.println("bill= "+bill);
		System.out.println("dn "+dn);
		boolean flag = false;
		File stockFile = new File("C://SMS//Tomcat7//webapps//sms//ledgerReports//printCoverLetter.pdf");
		try {
		    flag = stockFile.createNewFile();
		    if(flag)
		    {
		    	System.out.println("Pdf file created in your local machine... C://SMS//Tomcat7//webapps//sms//ledgerReports//printCoverLetter.pdf");
		    }
		} catch (IOException ioe) {
		     System.out.println("Error while Creating File in Java" + ioe);}
		System.out.println("stock file" + stockFile.getPath() + " created ");
		try
		{
			DaoFactory dfact=new DaoFactory();
			LedgerDao ldao=dfact.createLedgerManager();
		    /*pLedgerList=ldao.printLedgerByBillNoDnNo(bill, dn);*/
			pLedgerList=ldao.printDNLedgerByBillNoDnNo(bill, dn);
            String path=getLedgerListPath();
		    OutputStream file = new FileOutputStream(new File(path));
            Document document = new Document();
            PdfWriter.getInstance(document, file);
            document.open();
            BaseFont bf = BaseFont.createFont(
            BaseFont.TIMES_ROMAN,
            BaseFont.CP1252,
            BaseFont.EMBEDDED);
            Font font = new Font(bf, 10);
            String headerP="Supplier Name : "+pLedgerList.get(0).getSupplierName()+"       "+"D.N Number : "+dn+"       "+"D.N date : "+pLedgerList.get(0).getDnDoc(); 
            Paragraph paragraph = new Paragraph(headerP,new Font(Font.FontFamily.TIMES_ROMAN, 11));
            paragraph.setAlignment(Element.ALIGN_CENTER);
            
            paragraph.add(new Paragraph(" "));
                      
            document.add(paragraph);
            PdfPTable pdfTable = new PdfPTable(7);
            
            PdfPCell cell1 = new PdfPCell(new Phrase("ITEM NAME",font));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfTable.addCell(cell1);
            
            cell1 = new PdfPCell(new Phrase("SiZE",font));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfTable.addCell(cell1);

            cell1 = new PdfPCell(new Phrase("PURCHASE QUANTITY",font));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfTable.addCell(cell1);

            cell1 = new PdfPCell(new Phrase("RATE",font));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfTable.addCell(cell1);
            
            cell1 = new PdfPCell(new Phrase("VALUE",font));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfTable.addCell(cell1);
            
            cell1 = new PdfPCell(new Phrase("RETURN PCS",font));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfTable.addCell(cell1);
            
            cell1 = new PdfPCell(new Phrase("RETURN VALUE",font));
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            pdfTable.addCell(cell1);
            
            pdfTable.setHeaderRows(-1);

            	for(int i=0; i<pLedgerList.size();i++)
            	{
            		  PdfPCell cell2 = new PdfPCell(new Phrase(pLedgerList.get(i).getItemName(),font));
                      cell1.setHorizontalAlignment(Element.ALIGN_CENTER);		
                      pdfTable.addCell(cell2);
                      
                      PdfPCell cell8 = new PdfPCell(new Phrase(pLedgerList.get(i).getItemSize(),font));
                      cell8.setHorizontalAlignment(Element.ALIGN_CENTER);		
                      pdfTable.addCell(cell8);
                      
                      PdfPCell cell3 = new PdfPCell(new Phrase(pLedgerList.get(i).getTotalItemQty()+"",font));
                      cell3.setHorizontalAlignment(Element.ALIGN_CENTER);		
                      pdfTable.addCell(cell3);
                      
                      PdfPCell cell4 = new PdfPCell(new Phrase(pLedgerList.get(i).getBuyRate(),font));
                      cell4.setHorizontalAlignment(Element.ALIGN_CENTER);		
                      pdfTable.addCell(cell4);
                     
                      PdfPCell cell5 = new PdfPCell(new Phrase(pLedgerList.get(i).getItemTot()+"",font));
                      cell5.setHorizontalAlignment(Element.ALIGN_CENTER);		
                      pdfTable.addCell(cell5);
                      
                      PdfPCell cell6 = new PdfPCell(new Phrase(pLedgerList.get(i).getReturnquantity(),font));
                      cell6.setHorizontalAlignment(Element.ALIGN_CENTER);		
                      pdfTable.addCell(cell6);
                      
                      PdfPCell cell7 = new PdfPCell(new Phrase(pLedgerList.get(i).getReturnTotal(),font));
                      cell7.setHorizontalAlignment(Element.ALIGN_CENTER);		
                      pdfTable.addCell(cell7);
              
            	}
            	  document.add(pdfTable);
            	  paragraph.add(new Paragraph(" "));
            	  paragraph.add(new Paragraph(" "));
            	  String footerP="Tax amount ("+pLedgerList.get(0).getVat()+"%): "+pLedgerList.get(0).getTaxamount()+"       "+"Sub Total : "+pLedgerList.get(0).getSubTot()+"       "+"Grand Total : "+pLedgerList.get(0).getDebitAmount(); 
                  Paragraph footer = new Paragraph(footerP,new Font(Font.FontFamily.TIMES_ROMAN, 11));
                  footer.setAlignment(Element.ALIGN_CENTER);
                  footer.add(new Paragraph(" "));
                  document.add(footer);
            document.close();
            file.close();
            
           /* boolean resultUpload=ldao.uploadFileToWebServer(path);
            if(resultUpload)
            {
            	System.out.println("PDf uploaded.");
            } */
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		request.setAttribute("bill", bill);
		request.setAttribute("dn", dn);
		return SUCCESS;
	}
		
	public String getLedgerListPath()throws DaoException,IOException
	{
		String filepath="C://SMS//Tomcat7//webapps//sms//ledgerReports//printCoverLetter.pdf";
		  File f = null;
	      try{      
	         f = new File(filepath);
	         if(!f.exists())
	         {
	        	 f.mkdirs(); 
	        	 System.out.println("Directory created sucessfully at" +filepath);
	         }
	         else
	         {
	        	 System.out.println("Directory already created");
	         }  
	      }catch(Exception e){
	         // if any error occurs
	    	  System.out.println("Error occur while creating Directory "+ e);
	         e.printStackTrace();
	      }
	      return filepath;
	}
	//################################################################################### Printing method for generating PDF file for perticular DN Number ...Printing method for generating PDF file for particular DN Number .. Start here ##################################################################################################
	//#########################################################################################################################################################################################################################################################################################################################################
	public String printCoverLatterbyDnNo()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String bill=request.getParameter("billNo");
		String dn=request.getParameter("dn");
		System.out.println("bill= "+bill);
		System.out.println("dn "+dn);
		boolean flag = false;
		File stockFile = new File("C://SMS//Tomcat7//webapps//sms//ledgerReports//printCoverLetter.pdf");
		try {
		    flag = stockFile.createNewFile();
		    if(flag)
		    {
		    	System.out.println("Pdf file created in your local machine... C://SMS//Tomcat7//webapps//sms//ledgerReports//printCoverLetter.pdf");
		    }
		} catch (IOException ioe) {
		     System.out.println("Error while Creating File in Java" + ioe);}
		System.out.println("stock file" + stockFile.getPath() + " created ");
		try
		{
			DaoFactory dfact=new DaoFactory();
			LedgerDao ldao=dfact.createLedgerManager();
		    pLedgerList=ldao.printLedgerByBillNoDnNo(bill, dn);
            String path=getLedgerListPath();
		    Document document = new Document(PageSize.LETTER);
  	        PdfWriter.getInstance(document, new FileOutputStream("C://SMS//Tomcat7//webapps//sms//ledgerReports//printCoverLetter.pdf"));
  	        document.open();
  	        document.addCreationDate();
  	        document.addTitle("Cover Latter");
            String date=CurrentDate.getOnlyDateWithMySQLFORMAT();
            String dnno=dn;
            String dnDate=pLedgerList.get(0).getDnDoc();
            String grandTotal=pLedgerList.get(0).getDebitAmount();
            String supplierName=pLedgerList.get(0).getSupplierName();
            String supplieraddress=pLedgerList.get(0).getSupplieraddress();
            String location="Howrah";
            String State="West Bengal";
            String currentCompanyName=pLedgerList.get(0).getCurrentCompanyName();
  	        HTMLWorker htmlWorker = new HTMLWorker(document);
  	        //------------------------------------------------------------- Cover Letter Design -->>>>  Start here--------------------------------------------------------//
  	        String str = "<html><head></head><body><br/>" +
  	        		"<br/>" +
  	        		"<br/>"+
  	        		"<br/>"+
  	        "<p>"+ date+
  	        "</p><br/>" +
            "<p> M/S &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>"+ supplierName+"</b>,"+
  	        "</p> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +supplieraddress+","+
  	        "<p> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +location+","+
  	        "</p>"+
  	        "<p> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +State+"," +
  	        "</p>"+
  	        "<div style='width: 100px'></div>" +
  	        "<br/><br/><p>Dear Sir, " +
  	        "<br/> <br/><center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
  	        "<b style='text-decoration: underline;'>Sub: Enclosure of Debit Note against rate & quality difference -reg</b> </center>" +
  	        "<br/><br/>" +
  	        "<p >Please find enclosed here with Debit note for rate & quality difference (rejected pieces).</p>" +
              "<p ><b ><font size='2'>DN Number:&nbsp;" +dnno+
              "</font></b>"+
              "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size='2'>DN Date:&nbsp;" +dnDate+
              "</font></b>"+
              "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size='2'>Grand Total:&nbsp;" +grandTotal+
              "</font></b></p>"+
              "<br/><p >Kindly acknowledge on receipt of the same.</p>" +
              "<br/><p >Thanking you,</p>" +
              "<p ><b>Yours truly,</p>" +
              "<p ><b>For "+currentCompanyName+"</p></b>"+
  	        "</body></html>";
  	      //------------------------------------------------------------- Cover Letter Design -->>>>  End here--------------------------------------------------------//
  	      htmlWorker.parse(new StringReader(str));
  	      document.close();
  	      System.out.println("Done");
          boolean resultUpload=ldao.uploadFileToWebServer(path);
          if(resultUpload)
          {System.out.println("PDf uploaded.");} 
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
		}
		request.setAttribute("bill", bill);
		request.setAttribute("dn", dn);
		return SUCCESS;
		
	}
//################################################################################### Printing method for generating PDF file for particular DN Number .. End here ##################################################################################################	
//########################################################## Purchase Hole ledger Display code -- start here ############################################################################################################################################
	public String  printHoleLedger()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		Document document = new Document();
		try
		{
			String fromdate=request.getParameter("fromdate");
			String todate=request.getParameter("todate");
			String mode=request.getParameter("mode");
			DaoFactory dfact=new DaoFactory();
			LedgerDao ldao=dfact.createLedgerManager();
			SupplierMasterDAO sdao=dfact.CreateSupplierManager();
			int supplierId=0;
			try{
			supplierId=Integer.parseInt(request.getParameter("supplierId"));
			}catch(NumberFormatException n )
			{
				System.out.println("Suplier ID not found .... ");
			}
			
			supList=sdao.getAllSupplierDetails();
			pLedgerList=ldao.getTotalPurchaseLedger(fromdate, todate,supplierId);
			
			BaseFont bf = BaseFont.createFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252,BaseFont.EMBEDDED);
			Font font = new Font(bf,9);    
			
			BaseFont bf2 = BaseFont.createFont( BaseFont.TIMES_ROMAN, BaseFont.CP1252,BaseFont.EMBEDDED);
			Font font2 = new Font(bf2, 11);
			font2.setColor(BaseColor.BLUE);
			
			
			BaseFont bf3 = BaseFont.createFont( BaseFont.HELVETICA, BaseFont.CP1252,BaseFont.EMBEDDED);
			Font font3 = new Font(bf3, 11);  
			font3.setColor(BaseColor.RED);

			String path="C://SMS//Tomcat7//webapps//sms//ledgerReports//printHoleledger.pdf";
		    OutputStream file = new FileOutputStream(new File(path));

            PdfWriter.getInstance(document, file);
            document.open();
            PdfPTable table = new PdfPTable(1);
            table.setWidthPercentage(100);
            Paragraph paragraph = new Paragraph("",new Font(Font.FontFamily.TIMES_ROMAN, 11));
            paragraph.add(new Paragraph("                                                                                      Ledger Print ",font2));
            try{
            if(!fromdate.equals("") && !todate.equals(""))
            { 
            paragraph.add(new Paragraph("From  :    "+fromdate +"   To :    " + todate,font));
            paragraph.add(new Paragraph(""));
            }
            }
            catch(Exception e)
            {
            paragraph.add(new Paragraph(" "));	
            }
            
            paragraph.add(new Paragraph(" "));	
       
            paragraph.setAlignment(Element.ALIGN_CENTER);
            
            String purOrDebitDetails="";
            
            for(int i=0;i<pLedgerList.size();i++)
            {
            	
            PdfPCell tableCell1 = new PdfPCell(new Phrase(pLedgerList.get(i).getSupplierName(),font2));
            tableCell1.setHorizontalAlignment(Element.ALIGN_CENTER);		
            table.addCell(tableCell1);  
            PdfPCell tableCell2 = new PdfPCell(new Phrase("PURCHASE / PAYMENT / DEBIT DETAILS",font2));
            table.addCell(tableCell2);
                
            PdfPCell tableCell3 = new PdfPCell();	
            PdfPTable purchasetable = new PdfPTable(1);
            purchasetable.setWidthPercentage(100);
            
            pLedgerList2=ldao.getPLedgerDetailsBySuppplierId(pLedgerList.get(i).getSupplierId(),mode,fromdate, todate);
            int inc=0;    
            purchasetable.addCell(new PdfPCell(new Phrase("",font2)));
            SupplierPaymentDao suppaymentdao=dfact.createSupplierPayManager();
            for(int j=0; j<pLedgerList2.size();j++){
             
            	if(!pLedgerList2.get(j).getDnNo().equals("NA"))
            	{
            		purOrDebitDetails="(D.N Details)";
            	}
            	else
            	{
            		purOrDebitDetails="(Purchase Details)";
            	}
            	
            PdfPCell purchasetableCell2 = new PdfPCell(new Phrase("_",font2));
            purchasetableCell2.setHorizontalAlignment(Element.ALIGN_LEFT);		
            purchasetable.addCell(purchasetableCell2);
            PdfPCell purchasetableCell3 = new PdfPCell(new Phrase("Bill No :"+pLedgerList2.get(j).getBillNo() +" | " +"D.N No :"+pLedgerList2.get(j).getDnNo()+" | "+" Ledger Date :"+pLedgerList2.get(j).getDnDoc()+"          " +
            "  "+purOrDebitDetails,font3));
            purchasetableCell3.setHorizontalAlignment(Element.ALIGN_LEFT);		
            purchasetable.addCell(purchasetableCell3);
                					
            pLedgerList3=ldao.getLedgerByBillNoDnNo(pLedgerList2.get(j).getBillNo(),pLedgerList2.get(j).getDnNo(),pLedgerList.get(i).getSupplierId());
            
            //------------------------------------------------------------Payment Configuration----------------------------------------------------
            System.out.println("Bill no found #################"+pLedgerList2.get(j).getBillNo() );
            System.out.println("Supplier Id  found #################"+pLedgerList.get(i).getSupplierId());
            
            paymentList=suppaymentdao.getSupplierPaymentHistoryByBillNo(pLedgerList2.get(j).getBillNo(), pLedgerList.get(i).getSupplierId()+""  );
            sdto=suppaymentdao.getMinDueAmt(pLedgerList.get(i).getSupplierId()+"");
            //------------------------------------------------------------Payment Configuration----------------------------------------------------
            
                    String allDetails =	 "Unit Scheme :"+pLedgerList2.get(j).getLessUnitScheme() +" | " +"Vat :"+pLedgerList2.get(j).getVat()+" | "+"Cst :"+pLedgerList2.get(j).getCst()+" | "+"Way Bill No :"+pLedgerList2.get(j).getWaybill()+" | "
                    + "Discount :"+pLedgerList2.get(j).getDiscounts()+" | " +"Freight :"+pLedgerList2.get(j).getLorryFreight()+ " | " 
                    + "Purchase Amount :" + pLedgerList2.get(j).getPurchaseAmount()+ " | "+"Debit Amount :" + pLedgerList2.get(j).getDebitAmount()+ " | "+"Due Amount :" + sdto.getMinDuePayment()   ;	
            
            System.out.println("Payment List found : "+paymentList.size());
            
            PdfPCell purchasetableCell9 = new PdfPCell();
	        PdfPTable pDetailstable = new PdfPTable(7);
	        pDetailstable.setWidthPercentage(100);
	        purchasetable.setWidthPercentage(100);
                        	
            pDetailstable.addCell(new PdfPCell(new Phrase("CHALLAN NO",font2)));
            pDetailstable.addCell(new PdfPCell(new Phrase("ARTICLE CODE",font2)));
            pDetailstable.addCell(new PdfPCell(new Phrase("ARTICLE  NAME",font2)));
            pDetailstable.addCell(new PdfPCell(new Phrase("SIZE",font2)));
            pDetailstable.addCell(new PdfPCell(new Phrase("QTY",font2)));
            pDetailstable.addCell(new PdfPCell(new Phrase("BUY RATE",font2)));
            pDetailstable.addCell(new PdfPCell(new Phrase("ITEM TOTAL",font2)));
             
            //------------------------------------------------------------Payment Configuration----------------------------------------------------
            
            PdfPTable paymentTable = new PdfPTable(8);
            if(inc<1)
            {
            paymentTable.setWidthPercentage(100);
            paymentTable.setWidthPercentage(100);
            
            paymentTable.addCell(new PdfPCell(new Phrase("PAYMENT DATE",font2)));
            paymentTable.addCell(new PdfPCell(new Phrase("PAID STATUS",font2)));
            paymentTable.addCell(new PdfPCell(new Phrase("PURCHASE AMOUNT",font2)));
            paymentTable.addCell(new PdfPCell(new Phrase("PAID AMOUNT",font2)));
            paymentTable.addCell(new PdfPCell(new Phrase("DUE AMOUNT",font2)));
            paymentTable.addCell(new PdfPCell(new Phrase("PAY MODE",font2)));
            paymentTable.addCell(new PdfPCell(new Phrase("CHEQUE NO",font2)));
            paymentTable.addCell(new PdfPCell(new Phrase("PAID STATUS",font2)));
            }
            //------------------------------------------------------------Payment Configuration----------------------------------------------------
           
            for(int k=0;k<pLedgerList3.size();k++)
            { 
            
            String itemCode=pLedgerList3.get(k).getItemId()+"";
            String qty=pLedgerList3.get(k).getTotalItemQty()+"";
            String bRate=pLedgerList3.get(k).getBuyRate()+"";
            String price=pLedgerList3.get(k).getItemTot()+"";
            pDetailstable.addCell(new PdfPCell(new Phrase(pLedgerList3.get(k).getChallanNo(),font)));
            pDetailstable.addCell(new PdfPCell(new Phrase(itemCode,font)));
            pDetailstable.addCell(new PdfPCell(new Phrase(pLedgerList3.get(k).getItemName(),font)));
            pDetailstable.addCell(new PdfPCell(new Phrase(pLedgerList3.get(k).getItemSize(),font)));
            pDetailstable.addCell(new PdfPCell(new Phrase(qty,font)));
            pDetailstable.addCell(new PdfPCell(new Phrase(bRate,font)));
            pDetailstable.addCell(new PdfPCell(new Phrase(price,font)));}          	
            purchasetableCell9.addElement(pDetailstable);
            purchasetable.addCell(purchasetableCell9);
            
            
            PdfPCell paymengap = new PdfPCell(new Phrase("_",font2));
            paymengap.setHorizontalAlignment(Element.ALIGN_LEFT);		
            purchasetable.addCell(paymengap);
            //------------------------------------------------------------Payment Configuration----------------------------------------------------
            if(inc<1)
            {
            
            PdfPCell paymentheading = new PdfPCell(new Phrase("PAYMENT DETAILS FOR INVOICE NO :"+pLedgerList2.get(j).getBillNo(),font3));
            paymentheading.setHorizontalAlignment(Element.ALIGN_LEFT);		
            purchasetable.addCell(paymentheading);
            
            for(int l=0;l<paymentList.size();l++)
            {
            	paymentTable.addCell(new PdfPCell(new Phrase(paymentList.get(l).getsPayDate(),font)));	
            	paymentTable.addCell(new PdfPCell(new Phrase(paymentList.get(l).getsPaidStatus(),font)));	
            	paymentTable.addCell(new PdfPCell(new Phrase(paymentList.get(l).getGrandTot(),font)));	
            	paymentTable.addCell(new PdfPCell(new Phrase(paymentList.get(l).getsPaidAmt(),font)));	
            	paymentTable.addCell(new PdfPCell(new Phrase(paymentList.get(l).getDueAmt(),font)));	
            	paymentTable.addCell(new PdfPCell(new Phrase(paymentList.get(l).getsPayMode(),font)));	
            	paymentTable.addCell(new PdfPCell(new Phrase(paymentList.get(l).getChequeNo(),font)));	
            	paymentTable.addCell(new PdfPCell(new Phrase(paymentList.get(l).getsPaidStatus(),font)));	
            
            }
            }
            purchasetable.addCell(paymentTable);
            //------------------------------------------------------------Payment Configuration----------------------------------------------------
            
            PdfPCell purchasetableCell1 = new PdfPCell(new Phrase(allDetails,font2));
            purchasetableCell1.setHorizontalAlignment(Element.ALIGN_LEFT);		
            purchasetable.addCell(purchasetableCell1);
          
            inc++;
            }
              
            tableCell3.addElement(purchasetable);               
            table.addCell(tableCell3);
               
            PdfPCell cell5 = new PdfPCell(new Phrase("_"));
            cell5.setHorizontalAlignment(Element.ALIGN_LEFT);	
            table.addCell(cell5); 
           
            }
            document.add(paragraph);
            document.add(table); 
            document.close();
            file.close();
            boolean resultUpload=true;
            if(resultUpload)
            {System.out.println("PDf uploaded."); } }
		    catch(Exception e){
			System.out.println("An exception found.."+e);}
			return SUCCESS;
	}
	//########################################################## Purchase Hole ledger Display code -- End here ########################################################################	

	//######################################### Excel Export #######################################
	public String exportingLedgerDetails(){
		HttpServletRequest request=ServletActionContext.getRequest();
		
		String currentdate=  CurrentDate.getOnlyDateWithMySQLFORMAT();
    	String result=ERROR;
    	HttpServletResponse response=ServletActionContext.getResponse();
    	String[] header2 = new String[]{"DN NO.", "INVOICE/BILL NO", "CHALLAN NO", "WAY BILL NO", "SUPPLIER NAME", "DATE", "ITEM CODE","ITEM NAME", "SIZE", "QUANTITY", "BUYRATE", "ITEM TOTAL", "SUB TOTAL", "DISCOUNTS", "UNIT SCHEME", "VAT", "CST", "LORRY FREIGHT", "PURCHASE AMOUNT", "DEBIT AMOUNT" };  
		String sId=request.getParameter("supplierId");
		String mode=request.getParameter("mode");
		String fromdate=request.getParameter("fromdate");
		String todate=request.getParameter("todate");
		try
		{
			DaoFactory dfact=new DaoFactory();
			LedgerDao ldao=dfact.createLedgerManager();
			pLedgerList=ldao.getPLedgerExportBySuppplierId(Integer.parseInt(sId),mode,fromdate,todate);
			SupplierMasterDAO supDao=dfact.CreateSupplierManager();
			supList=supDao.getAllSupplierDetails();
			ExcelExport ee=new ExcelExport();
			List<String> columnNames = new ArrayList<String>();
			List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
			String title=pLedgerList.get(0).getTitleforExcel();
			int k=1;
			for (PurchaseLedgerDto il : pLedgerList) {
               Integer i = 0;
               Map<String, Object> m = new HashMap<String, Object>();
               
               m.put((++i).toString(),il.getDnNo());
               m.put((++i).toString(),il.getBillNo());
               m.put((++i).toString(),il.getChallanNo());
               m.put((++i).toString(),il.getWaybill());
               m.put((++i).toString(),il.getSupplierName() );
               m.put((++i).toString(),il.getDnDoc());
               m.put((++i).toString(),il.getItemId() );
               m.put((++i).toString(),il.getItemName());
               m.put((++i).toString(),il.getItemSize());
               m.put((++i).toString(),il.getTotalItemQty());
               m.put((++i).toString(),il.getBuyRate());
               m.put((++i).toString(),il.getItemTotDoubleFormate());
               m.put((++i).toString(),il.getSubTot());
               m.put((++i).toString(),il.getDiscounts());
               m.put((++i).toString(),il.getLessUnitScheme());
               m.put((++i).toString(),il.getVat());
               m.put((++i).toString(),il.getCst());
               m.put((++i).toString(),il.getLorryFreight());
               m.put((++i).toString(),il.getPurchaseAmount());
               m.put((++i).toString(),il.getDebitAmount());
               
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
			response.setHeader("Content-Disposition", "attachment; filename=PurchaseLedgerReport_"+currentdate+".xls");
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
			result=SUCCESS;
		}
		catch(Exception e)
		{
			System.out.println("An exception found.."+e);
			result=SUCCESS;
		}
		return result;
	}
//###################################### EXCEL EXPORT #############################################################
	

	//######################################################################################################################################################################################################################################
	//****************************************************** C U S T O M E R  *****CODES ALTERD BY PRADIPTO ROY From 2017***********************************************************************************************************************************			 
	//++++++++++++++++++++++++++++++++++++++++  L E D G E R  R E P O R T   S T A R T  H E R E    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	//######################################################################################################################################################################################################################################

			public String customerHoleLedger() throws DocumentException, IOException
			{
				try{
					String pdfFilename;
				HttpServletRequest request=ServletActionContext.getRequest();
				String fromDate=request.getParameter("fromdate");
				String toDate=request.getParameter("todate");
				String schemename=request.getParameter("schemeName");
				System.out.println("FromDate---"+fromDate);
				System.out.println("Todate----"+toDate);
				String cId=request.getParameter("cId");
//				String pdfFilename = "C://SMS//Tomcat7//webapps//smsRajuGarments//ledgerReports//customerHoleledger.pdf";
			    pdfFilename=request.getServletContext().getRealPath("/ledgerReports/customerHoleledger.pdf");
				System.out.println("Path of Pdf"+pdfFilename);
				
				boolean returnrs=createPDF(pdfFilename,fromDate,toDate,schemename,cId);
				if(returnrs)
				{
				System.out.println("LEdger Report generated succesfully !!");
				}
				else
				{
				System.out.println("Error occur during pdf generation !!")	;	
				}
				}
				catch(Exception e)
				{
					System.out.println("Exception occur");
				}
				return SUCCESS;
			}
			
			private boolean createPDF (String pdfFilename,String fromDate,String toDate,String schemename,String cId) throws DaoException, SQLException{
				boolean returnresult=false;
				
				HttpServletRequest request=ServletActionContext.getRequest();
				DaoFactory dfact=new DaoFactory();
				
				String fromdate=request.getParameter("fromdate");
				String todate=request.getParameter("todate");
				String mode=request.getParameter("mode");

				LedgerDao ldao=dfact.createLedgerManager();
				SupplierMasterDAO sdao=dfact.CreateSupplierManager();
				CustomerMasterDAO cdao=dfact.createCustomerManager();
				SalesMasterDao saledao=dfact.createSalesMasterManager();
				
				
				int cstID=0;
				try{
					cstID=Integer.parseInt(cId);
				}catch(NumberFormatException n )
				{
					System.out.println("Suplier ID not found .... ");
				}
				clist=cdao.getAllCustomerDetails();
//				supList=sdao.getAllSupplierDetails();
				saleLedger=ldao.getSaleLedger(fromdate, todate,cstID); //***F1***
				
				List<CustomerLedgerDto> ledgerBillList=new ArrayList<CustomerLedgerDto>();
				List<CustomerLedgerDto> ledgerItemList=new ArrayList<CustomerLedgerDto>();
				List<CustomerLedgerDto> ledgerCNList=new ArrayList<CustomerLedgerDto>();
				List<CustomerLedgerDto> ledgerPaymentList=new ArrayList<CustomerLedgerDto>();
				List<SalesMasterDto> salelist=new ArrayList<SalesMasterDto>();
				
				//-----------------------------------------------  ALL Essential Configuration for ledger ends here ----------------------

				//++++++++++++++++++ MAIN LEDGER CALCULATION CODE BEGINS HERE +++++++++++++++++++++++++++++
				
				   List<SchemeMasterDto> saleSchemeListforCName=new ArrayList<SchemeMasterDto>();
				   List<SchemeMasterDto> saleSchemeListproducts=new ArrayList<SchemeMasterDto>();
				   Document doc = new Document();
				   PdfWriter docWriter = null;
				   DecimalFormat df = new DecimalFormat();
				   df.setMaximumFractionDigits(2);
				   DecimalFormat dfg = new DecimalFormat();
				   dfg.setMaximumFractionDigits(2);
				  try {
				   Font bfBold12 = new Font(FontFamily.HELVETICA, 8, Font.BOLD, new BaseColor(0, 0, 0));
				   Font bfBold13 = new Font(FontFamily.TIMES_ROMAN, 5, Font.DEFAULTSIZE, new BaseColor(0, 0, 0));
				   Font bf12 = new Font(FontFamily.HELVETICA, 6, Font.NORMAL, new BaseColor(0, 0, 0));
				   Font bf13 = new Font(FontFamily.HELVETICA, 6, Font.UNDERLINE, new BaseColor(0, 0, 0));
				   Font bf14 = new Font(FontFamily.HELVETICA, 6, Font.BOLD, new BaseColor(0, 0, 0));
				   String path =  pdfFilename;
				   docWriter = PdfWriter.getInstance(doc , new FileOutputStream(path));
				  
				   //document header attributes
				   doc.setPageSize(PageSize.A4);
				   doc.open();
				   Paragraph paragraph = new Paragraph("");
				   float[] columnWidths = {1.5f, 2f, 5f, 2f};
				   PdfPTable table = new PdfPTable(columnWidths);
				   table.setWidthPercentage(90f);
				   table.setHeaderRows(1);
				   insertCell(table, "", Element.ALIGN_LEFT, 4, bfBold12);
				   String CustomerName="";
				   int  CstID=0;
				   if(saleLedger.size()>0)
				   { 
					   
					   
					   if((cstID>0 && (fromdate!="") && todate!=""))
						{
						   insertCell(table, "  ADAK SHOE & CHAPPALS", Element.ALIGN_CENTER, 4, bfBold12);
						   insertCell(table, "  GSTTIN NO : 19AWLPA2856K1Z7  ", Element.ALIGN_CENTER, 4, bfBold12);
						   insertCell(table, "  ADDRESS : Bhabanipur Haldia  ", Element.ALIGN_CENTER, 4, bfBold12);
						   insertCell(table, "  ", Element.ALIGN_CENTER, 4, bfBold12);
						   insertCell(table, "  CUSTOMER LEDGER REPORT ", Element.ALIGN_CENTER, 4, bfBold12);
						   insertCell(table, "  FROM DATE     "+fromdate+"    TO DATE      "+toDate, Element.ALIGN_CENTER, 4, bfBold12);
						}
						else if((cstID==0) && (fromdate!="") && todate!="")
						{
							insertCell(table, "  TOTAL CUSTOMER LEDGER REPORT ", Element.ALIGN_CENTER, 4, bfBold12);
							insertCell(table, "  FROM DATE     "+fromdate+"    TO DATE      "+toDate, Element.ALIGN_CENTER, 4, bfBold12);
							
						}
					   
						else if((cstID>0) && (fromdate=="") && todate=="")
						{
							insertCell(table, "  HOLE LEDGER REPORT OF A CUSTOMER ", Element.ALIGN_CENTER, 4, bfBold12);
						}
				   }
				   else
				   {  
				    insertCell(table, " SORRY NO SALE RECORDS FOUND !!! ", Element.ALIGN_CENTER, 4, bfBold12);   
				   }
    
				   double overallTotPayment=0.0;
				   double overallTotaldDue=0.0;
				   double overallgrandTots=0.0;
				   double overallreturnSubtot=0.0;
				   
				   double grandcgstratetot=0.0;
				   double grandcgstrateamt=0.0;
				   double grandoversgstrate=0.0;
				   double grandoversgstamt=0.0;
				   double grandoverallgst=0.0;
				   double grandoverallgstamt=0.0;
				   
				   
				 for(int i=0;i<saleLedger.size();i++)
				 {
					   double totalPayment=0.0;
					   double totaldue=0.0; 
					   double grandTots=0.0;
					   double returnSubtot=0.0;
					   
				
					   double cgstratetot=0.0;
					   double cgstrateamt=0.0;
					   double oversgstrate=0.0;
					   double oversgstamt=0.0;
					   double overallgst=0.0;
					   double overallgstamt=0.0;
					 
					   
				   CustomerName= saleLedger.get(i).getCustomerName();
				   CstID=Integer.parseInt(saleLedger.get(i).getCustomerId());
				   insertCell(table, "*********************************************************************************************************************************************************************************", Element.ALIGN_LEFT, 4, bfBold13);
				   insertCell(table, "Customer Name : "+saleLedger.get(i).getCustomerName() +"        Customer GST TIN NO. : "+saleLedger.get(i).getCustgsttinno() , Element.ALIGN_LEFT, 4, bfBold12);
				   insertCell(table, "", Element.ALIGN_LEFT, 4, bf12);
				   insertCell(table, "", Element.ALIGN_LEFT, 4, bf12);
				   ledgerBillList=ldao.getBillNoDetailsByCustomerID(Integer.parseInt(saleLedger.get(i).getCustomerId()),fromDate,toDate); //******F2*****
				   
				   for(int l=0;l<ledgerBillList.size();l++)
				   {
					    double salevatTot=0.0;
					    insertCell(table, "Invoice No" , Element.ALIGN_LEFT, 1, bf13);
					    insertCell(table, "Date of Invoice" , Element.ALIGN_LEFT, 1, bf13);
					    insertCell(table, "Item Total(Before GST)", Element.ALIGN_CENTER, 1, bf13);
					    insertCell(table, "Total GST Rate % (Total GST AMT)", Element.ALIGN_RIGHT, 1, bf13);
					    ledgerItemList=ldao.getItemDetailsForCustomerLedgerByBillNo(ledgerBillList.get(l).getBillNo(),fromdate,todate);//******F3*****
					    
					    
					    List<SalesMasterDto> slisttemp=new ArrayList<SalesMasterDto>();
					   
					    double totalgstrate=0.0;
					    double totalgstamt=0.0;
					    double totbasetotal=0.0;
					    double totcgst=0.0;
					    double totcgstamt=0.0;
					    double totsgstrate=0.0;
					    double totsgstamt=0.0;
					    double totigstrate=0.0;
					    double totigstamt=0.0;
					    double grandtotal=0.0;
					    
					    
					    
					    slisttemp=saledao.getAllSalesDetailsByBillNoOnly(ledgerBillList.get(l).getBillNo());
					    
					    
					    
					    for(int gh=0;gh<slisttemp.size();gh++)
					    {
					    	totalgstrate=Double.parseDouble(slisttemp.get(gh).getGstrate());
					    	totalgstamt=totalgstamt+Double.parseDouble(slisttemp.get(gh).getGstamt());
					    	totbasetotal=totbasetotal+Double.parseDouble(slisttemp.get(gh).getBasetotal());
					    	totcgst=Double.parseDouble(slisttemp.get(gh).getCgstrate());
					    	totcgstamt=totcgstamt+Double.parseDouble(slisttemp.get(gh).getCgstamt());
					    	totsgstrate=Double.parseDouble(slisttemp.get(gh).getSgstrate());
					    	totsgstamt=totsgstamt+Double.parseDouble(slisttemp.get(gh).getSgstamt());
					    	totigstrate=Double.parseDouble(slisttemp.get(gh).getIgstrate());
					    	totigstamt=totigstamt+Double.parseDouble(slisttemp.get(gh).getIgstamt());
					    	grandtotal=Double.parseDouble(slisttemp.get(gh).getGrandTotal());
					    	
					    }
					    
					    
					    overallgst=totalgstrate;
					    overallgstamt= overallgstamt+totalgstamt;
					    
					    cgstratetot=totcgst;
					    cgstrateamt=cgstrateamt+totcgstamt;
					    
					    oversgstrate=totsgstrate;
					    oversgstamt=oversgstamt+totsgstamt;
					    
			
				  
				    for(int x=0; x<ledgerItemList.size(); x++)
				    { 
				    insertCell(table, ledgerItemList.get(0).getBillNo() , Element.ALIGN_LEFT, 1, bf14);
				    insertCell(table, ledgerItemList.get(0).getSaleDate(), Element.ALIGN_LEFT, 1, bf12);
				    
				    
//				    salevatTot=Double.parseDouble(ledgerItemList.get(0).getSubTot())* Double.parseDouble(ledgerItemList.get(0).getVat())/100;
				    
				    salevatTot=totalgstamt;
				    
				    insertCell(table,+totbasetotal+"         ", Element.ALIGN_CENTER, 1, bf12); 
				    insertCell(table,  +totalgstrate+ "%"+"  (" +df.format(salevatTot)+")", Element.ALIGN_RIGHT, 1, bf12);
				    
				    //------------------------------------------------ GST Updates in ledger ----------------------------------------------------
				    insertCell(table, "Other Details for this Invoice", Element.ALIGN_LEFT, 4, bf14);// Payment Details
				    
				    
			
				    
				    insertCell(table, "CGST RATE %( CGST AMT)" , Element.ALIGN_LEFT, 1, bf13);
				    insertCell(table, "SGST RATE %( SGST AMT)" , Element.ALIGN_LEFT, 1, bf13);
				    insertCell(table, "IGST RATE %( IGST AMT)", Element.ALIGN_CENTER, 1, bf13);
				    insertCell(table, "Grand Total", Element.ALIGN_RIGHT, 1, bf13);
				    
				    
				    

				    
				    
//				    insertCell(table, "CGST RATE % (CGST AMT)" , Element.ALIGN_LEFT, 1, bf13);
//				    insertCell(table, "SGST RATE % (SGST AMT)" , Element.ALIGN_LEFT, 1, bf13);
//				    insertCell(table, "IGST RATE % (IGST AMT)", Element.ALIGN_RIGHT, 1, bf13);
				    
				    
				   
				    insertCell(table, totcgst+ "%  ( "+(dfg.format( totcgstamt))+" )", Element.ALIGN_LEFT, 1, bf12);
				    insertCell(table,  totsgstrate+ "%   ( "+( dfg.format( totsgstamt))+" )", Element.ALIGN_LEFT, 1, bf12);
				    insertCell(table,  totigstrate+ "%    ( "+( dfg.format(totigstrate))+" )", Element.ALIGN_CENTER, 1, bf12);
				    insertCell(table, dfg.format( grandtotal)+"", Element.ALIGN_RIGHT, 1, bf12);
				 
				    
				    
				    /*
			    salelist=saledao.getAllSalesDetailsByBillNoOnly(ledgerItemList.get(0).getBillNo());
				    
				    for(int kl=0;kl<salelist.size();kl++)
				    {
				    	
					    insertCell(table, "Item Name" , Element.ALIGN_LEFT, 1, bf13);
					    insertCell(table, "Qty" , Element.ALIGN_LEFT, 1, bf13);
					    insertCell(table, "Discount(Rate)", Element.ALIGN_CENTER, 1, bf13);
					    insertCell(table, "Item Total", Element.ALIGN_RIGHT, 1, bf13);
				    	
				        insertCell(table, salelist.get(kl).getItemName() , Element.ALIGN_LEFT, 1, bf12);
					    insertCell(table,  salelist.get(kl).getQty(), Element.ALIGN_LEFT, 1, bf12);
					    insertCell(table,  salelist.get(kl).getSdiscount2()+(salelist.get(kl).getSdiscountamt()), Element.ALIGN_CENTER, 1, bf12);
					    insertCell(table, salelist.get(kl).getBasetotal(), Element.ALIGN_RIGHT, 1, bf12);
				    	
				    	
					    
					    insertCell(table, "Item Gst Details", Element.ALIGN_LEFT, 4, bf14);// Payment Details
					    

					    insertCell(table, "Gst Rate (GST AMT)" , Element.ALIGN_LEFT, 1, bf13);
					    insertCell(table, "CGST Rate (CGST AMT)" , Element.ALIGN_LEFT, 1, bf13);
					    insertCell(table, "CGST Rate (CGST AMT)", Element.ALIGN_CENTER, 1, bf13);
					    insertCell(table, "IGST Rate (IGST AMT)", Element.ALIGN_RIGHT, 1, bf13);    
					    
					    
					    insertCell(table, salelist.get(kl).getGstrate()+ "%                ( "+(salelist.get(kl).getGstamt())+" )", Element.ALIGN_LEFT, 1, bf12);
					    insertCell(table,  salelist.get(kl).getCgstrate()+ "%                 ( "+(salelist.get(kl).getCgstamt())+" )", Element.ALIGN_LEFT, 1, bf12);
					    insertCell(table,  salelist.get(kl).getSgstrate()+ "%                 ( "+(salelist.get(kl).getSgstamt())+" )", Element.ALIGN_CENTER, 1, bf12);
					    insertCell(table, salelist.get(kl).getIgstrate()+ "%                 ( "+(salelist.get(kl).getIgstamt())+" )", Element.ALIGN_RIGHT, 1, bf12);
				    	
					    
					    insertCell(table, "", Element.ALIGN_LEFT, 4, bf12);
					    insertCell(table, "", Element.ALIGN_LEFT, 4, bf12);
				    }
				    
				    */
				    
				    //------------------------------------------------ GST Updates in ledger ----------------------------------------------------
				    
			
				    insertCell(table, "", Element.ALIGN_LEFT, 4, bf12);
				    insertCell(table, "PAYMENT DETAILS", Element.ALIGN_LEFT, 4, bf14);// Payment Details
				    insertCell(table, "Invoice No" , Element.ALIGN_LEFT, 1, bf13);
				    insertCell(table, "Date of Payment" , Element.ALIGN_LEFT, 1, bf13);
				    insertCell(table, "Paid Amount", Element.ALIGN_CENTER, 1, bf13);
				    insertCell(table, "Due Amount", Element.ALIGN_RIGHT, 1, bf13);
				    ledgerPaymentList=ldao.getpaymentHistoryListByBillNoByFromDateTodate(ledgerBillList.get(l).getBillNo(), fromdate, todate);
				    double minDueAmount=ldao.getMinDueAmountBybillNoAndFROMDATETODATE(ledgerBillList.get(l).getBillNo(), fromdate, todate);
				    
				    for(int q=0;q<ledgerPaymentList.size();q++)
				    {
				    insertCell(table, ledgerPaymentList.get(q).getBillNo() , Element.ALIGN_LEFT, 1, bf12);
				    insertCell(table, ledgerPaymentList.get(q).getPaymentdate() , Element.ALIGN_LEFT, 1, bf12);
				    insertCell(table, ledgerPaymentList.get(q).getPaymentamount(), Element.ALIGN_CENTER, 1, bf12);
				    insertCell(table, ledgerPaymentList.get(q).getDueamount(), Element.ALIGN_RIGHT, 1, bf12);
				    totalPayment=totalPayment+Double.parseDouble(ledgerPaymentList.get(q).getPaymentamount());
				    }

				    grandTots=grandTots+Double.parseDouble(ledgerItemList.get(0).getSaleAmount());
				    insertCell(table, "", Element.ALIGN_LEFT, 4, bf12);
				    insertCell(table, "CREDIT NOTE DETAILS", Element.ALIGN_LEFT, 4, bf14);// Payment Details
				    ledgerCNList=ldao.getItemDetailsOFCNByBillNoWithFromDateTodate(ledgerBillList.get(l).getBillNo(), fromdate, todate);///----F4---

				    int ls=ledgerCNList.size();
				    if(ls>0)
				    {
				    insertCell(table, "Cn Number", Element.ALIGN_LEFT, 1, bf13);	    
					insertCell(table, "Credit Date" , Element.ALIGN_LEFT, 1, bf13);
					insertCell(table, "Return Subtot      Vat      Credit Amount", Element.ALIGN_CENTER, 1, bf13);	
					insertCell(table, "Due Amount", Element.ALIGN_RIGHT, 1, bf13);
					double dueamt=0.0;
					double gt=0.0;
					
				    for(int s=0;s<ledgerCNList.size();s++)
				    {
				    double Vatamt=0.0;
					insertCell(table, ledgerCNList.get(s).getCnNo(), Element.ALIGN_LEFT, 1, bf12);
				    insertCell(table, ledgerCNList.get(s).getCnDoc() , Element.ALIGN_LEFT, 1, bf12);
				    Vatamt=Double.parseDouble(ledgerCNList.get(s).getReturnSubtot())*Double.parseDouble(ledgerCNList.get(s).getVat())/100;
				    insertCell(table,ledgerCNList.get(s).getReturnSubtot()+"      "+df.format(Vatamt)+"      "+ ledgerCNList.get(s).getCreditAmount(), Element.ALIGN_CENTER, 1, bf12);
				    
				    double payamt=Double.parseDouble(ledgerItemList.get(0).getPaymentamount());
				    double cramt=Double.parseDouble(ledgerCNList.get(s).getCreditAmount());
				    dueamt=Double.parseDouble(ledgerItemList.get(0).getDueamount());
				    gt=Double.parseDouble(ledgerItemList.get(0).getSaleAmount());
				    
				    cramt=Double.parseDouble(ledgerCNList.get(s).getReturnSubtot())+Vatamt;
				    System.out.println("Credet amount found" + cramt);
				    System.out.println("due amount found" + dueamt);
				  
				    returnSubtot=returnSubtot+cramt;
				    dueamt=	dueamt-returnSubtot;  //---------------- Main Calc
				    System.out.println("total due amount found" + dueamt);
	 		        insertCell(table, df.format(dueamt), Element.ALIGN_RIGHT, 1, bf12);
				    }
				    totaldue=totaldue+minDueAmount;
				    }

				    else
				    {
				    	totaldue=totaldue+minDueAmount;
					    insertCell(table, " NO CN DATA AVAILABLE ..", Element.ALIGN_LEFT, 4, bf14);	
				    }
				    insertCell(table, "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", Element.ALIGN_LEFT, 4, bf12);
				    insertCell(table, "-----------------------------------------------------------------------------------E N D of Invoice NO.-----------------------------------------------------------------------------------------------------------------------", Element.ALIGN_LEFT, 4, bf12);
				    insertCell(table, "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", Element.ALIGN_LEFT, 4, bf12);
				    insertCell(table, "", Element.ALIGN_LEFT, 4, bf12);
				    
				    insertCell(table, "-----------------------------------------------------------------------------------Begin of Invoice NO.------------------------------------------------------------------------------------------------------------------------", Element.ALIGN_LEFT, 4, bf12);
				   }
				 }
				   

				   
				   
				   
				   grandcgstratetot=cgstratetot;
				   grandcgstrateamt=grandcgstrateamt+cgstrateamt;
				   grandoversgstrate=oversgstrate;
				   grandoversgstamt=grandoversgstamt+oversgstamt;
				   grandoverallgst=overallgst;
				   grandoverallgstamt=grandoverallgstamt+overallgstamt;
				   
				   
				   
				   
				   insertCell(table, 
		                   "Tot Gstrate : "+df.format(overallgst) + " %   "+
				   
		                   "Tot Gst AMT : "+df.format(overallgstamt) + " /-   "+
		                   
		"Tot CGst : "+df.format(cgstratetot) + " %  "+

		"Tot CGST AMT : "+df.format(cgstrateamt) + " /-  "+


		"Tot SGst : "+df.format(oversgstrate) + " %  "+

		"Tot SGst AMT : "+df.format(oversgstamt) + " /-  "
						   , Element.ALIGN_RIGHT, 4, bfBold12); 
				   
				    insertCell(table, "", Element.ALIGN_LEFT, 4, bf12);
				   
				   
				  
				   insertCell(table, "Total Payment : "+df.format(totalPayment) + " /-   "+"Total CN :"+df.format(returnSubtot)+" /-   "+" Total Due : "+  df.format(totaldue)+" /-   "+"Grand Total : "+df.format(grandTots)+" /-" , Element.ALIGN_RIGHT, 4, bfBold12);  
				  
				   
				   
			
				   
				   
				   
				   
				   
				   overallTotPayment=overallTotPayment+totalPayment;
				   overallreturnSubtot=overallreturnSubtot+returnSubtot;
				   overallTotaldDue=overallTotaldDue+totaldue;
				   overallgrandTots=overallgrandTots+grandTots;
				   
				   
				   insertCell(table, "*****************************************************************************************************************************************************************************************", Element.ALIGN_LEFT, 4, bfBold13);  
				
				 }
				 
				 insertCell(table, "", Element.ALIGN_LEFT, 4, bfBold13);  
				 insertCell(table, "*****************************************************************************************************************************************************************************************", Element.ALIGN_LEFT, 4, bfBold13);  
				
				 
				   insertCell(table, 
		                   "Tot Gstrate : "+df.format(grandoverallgst) + " %   "+
				   
		                   "Tot Gst AMT : "+df.format(grandoverallgstamt) + " /-   "+
		                   
		"Tot CGst : "+df.format(grandcgstratetot) + " %  "+

		"Tot CGST AMT : "+df.format(grandcgstrateamt) + " /-  "+


		"Tot SGst : "+df.format(grandoversgstrate) + " %  "+

		"Tot SGst AMT : "+df.format(grandoversgstamt) + " /-  "
						   , Element.ALIGN_RIGHT, 4, bfBold12); 
				 
				 
				 
				 insertCell(table, "Over all  Payment Taken : "+df.format(overallTotPayment) + " /-   "+"Over all Total CN :"+df.format(overallreturnSubtot)+" /-   "+"Over all Total Due : "+  df.format(overallTotaldDue)+" /-   "+"Over all Grand Total: "+df.format(overallgrandTots)+" /-" , Element.ALIGN_RIGHT, 4, bfBold12);
				
				 
				 
				 
				 insertCell(table, "*****************************************************************************************************************************************************************************************", Element.ALIGN_LEFT, 4, bfBold13);  
				 
				
				   paragraph.add(table);
				   doc.add(paragraph);
				   doc.close();
				  
				   returnresult=true;
					//++++++++++++++++++ MAIN LEDGER CALCULATION CODE ENDS HERE +++++++++++++++++++++++++++++
				 }
				  catch (DocumentException dex)
				  {
				   dex.printStackTrace();
				  }
				  catch (Exception ex)
				  {
				   ex.printStackTrace();
				  }
				  finally
				  {
				   if (doc != null){
				    doc.close();
				   }
				   if (docWriter != null){
				    docWriter.close();
				   }
				  }
				  return returnresult;
				 }
			
			 private void insertCell(PdfPTable table, String text, int align, int colspan, Font font)
			 {
				  PdfPCell cell = new PdfPCell(new Phrase(text.trim(), font));
				  cell.setHorizontalAlignment(align);
				  cell.setColspan(colspan);
				  cell.setBorder(Rectangle.NO_BORDER);
			      cell.setBackgroundColor(BaseColor.WHITE);
				  if(text.trim().equalsIgnoreCase("")){
				   cell.setMinimumHeight(5f);
				  }
				  table.addCell(cell); 
			}

	//######################################################################################################################################################################################################################################
	//****************************************************** C U S T O M E R  ***** CODES ALTERD BY PRADIPTO ROY ***************************************************************************************************************************		 
	//++++++++++++++++++++++++++++++++++++++++  L E D G E R  R E P O R T   E N D   H E R E    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	//######################################################################################################################################################################################################################################			 


			 
	//######################################################################################################################################################################################################################################
	//****************************************************** P U R C H A S E  *****CODES ALTERD BY PRADIPTO ROY***********************************************************************************************************************************			 
	//++++++++++++++++++++++++++++++++++++++++  L E D G E R  R E P O R T   S T A R T  H E R E    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	//######################################################################################################################################################################################################################################

					public String purHoleLedger() throws DocumentException, IOException
					{
						String pdfFilename="";
						try{
						HttpServletRequest request=ServletActionContext.getRequest();
						String fromDate=request.getParameter("fromdate");
						String toDate=request.getParameter("todate");
						String schemename=request.getParameter("schemeName");
						System.out.println("FromDate---"+fromDate);
						System.out.println("Todate----"+toDate);
						String sId=request.getParameter("supplierId");
//						String pdfFilename = "C://SMS//Tomcat7//webapps//smsRajuGarments//ledgerReports//printHoleledger.pdf";
						
						
						 pdfFilename=request.getServletContext().getRealPath("/ledgerReports/printHoleledger.pdf");
						
						
						boolean returnrs=createpurledgerPDF(pdfFilename,fromDate,toDate,schemename,sId);
						if(returnrs)
						{
						System.out.println("LEdger Report generated succesfully !!");
						}
						else
						{
						System.out.println("Error occur during pdf generation !!")	;	
						}
						}
						catch(Exception e)
						{
							System.out.println("Exception occur");
						}
						return SUCCESS;
					}
					
				private boolean createpurledgerPDF (String pdfFilename,String fromDate,String toDate,String schemename,String sId) throws DaoException, SQLException{
						boolean returnresult=false;
						
						HttpServletRequest request=ServletActionContext.getRequest();
						DaoFactory dfact=new DaoFactory();
						
						String fromdate=request.getParameter("fromdate");
						String todate=request.getParameter("todate");
						String mode=request.getParameter("mode");

						LedgerDao ldao=dfact.createLedgerManager();
						SupplierMasterDAO sdao=dfact.CreateSupplierManager();
						CustomerMasterDAO cdao=dfact.createCustomerManager();
						
						int stID=0;
						try{
							stID=Integer.parseInt(sId);
						}catch(NumberFormatException n )
						{
							System.out.println("Suplier ID not found .... ");
						}
						//clist=cdao.getAllCustomerDetails();
					    supList=sdao.getAllSupplierDetails();
					    pLedgerList=ldao.getPurchaseLedger(fromdate, todate,stID); //***F1***
						
						List<PurchaseLedgerDto> ledgerBillList=new ArrayList<PurchaseLedgerDto>();
						List<PurchaseLedgerDto> ledgerItemList=new ArrayList<PurchaseLedgerDto>();
						List<PurchaseLedgerDto> ledgerDNList=new ArrayList<PurchaseLedgerDto>();
						List<PurchaseLedgerDto> ledgerPaymentList=new ArrayList<PurchaseLedgerDto>();
						
						//-----------------------------------------------  ALL Essential Configuration for ledger ends here ----------------------

						//++++++++++++++++++ MAIN LEDGER CALCULATION CODE BEGINS HERE +++++++++++++++++++++++++++++
						
						   List<SchemeMasterDto> saleSchemeListforCName=new ArrayList<SchemeMasterDto>();
						   List<SchemeMasterDto> saleSchemeListproducts=new ArrayList<SchemeMasterDto>();
						   Document doc = new Document();
						   PdfWriter docWriter = null;
						   DecimalFormat df = new DecimalFormat();
						   df.setMaximumFractionDigits(2);
						   
						  try {
						   Font bfBold12 = new Font(FontFamily.HELVETICA, 8, Font.BOLD, new BaseColor(0, 0, 0));
						   Font bfBold13 = new Font(FontFamily.TIMES_ROMAN, 5, Font.DEFAULTSIZE, new BaseColor(0, 0, 0));
						   Font bfBold15 = new Font(FontFamily.TIMES_ROMAN, 5, Font.DEFAULTSIZE, new BaseColor(0, 0, 0));
						   Font bf12 = new Font(FontFamily.HELVETICA, 6, Font.NORMAL, new BaseColor(0, 0, 0));
						   Font bf13 = new Font(FontFamily.HELVETICA, 6, Font.UNDERLINE, new BaseColor(0, 0, 0));
						   Font bf14 = new Font(FontFamily.HELVETICA, 6, Font.BOLD, new BaseColor(0, 0, 0));
						   String path =  pdfFilename;
						   docWriter = PdfWriter.getInstance(doc , new FileOutputStream(path));
						  
						   //document header attributes
						   doc.setPageSize(PageSize.A4);
						   doc.open();
						   Paragraph paragraph = new Paragraph("");
						   float[] columnWidths = {1.5f, 2f, 5f, 2f};
						   PdfPTable table = new PdfPTable(columnWidths);
						   table.setWidthPercentage(90f);
						   table.setHeaderRows(1);
						   insertCell(table, "", Element.ALIGN_LEFT, 4, bfBold12);
						   String CustomerName="";
						   int  CstID=0;
						   if(pLedgerList.size()>0)
						   {
							   
							if((stID>0 && (fromdate!="") && todate!=""))
								{
								   insertCell(table, "  PURCHASE LEDGER REPORT ", Element.ALIGN_CENTER, 4, bfBold12);
								   insertCell(table, "  FROM DATE     "+fromdate+"    TO DATE      "+toDate, Element.ALIGN_CENTER, 4, bfBold12);
								}
								else if((stID==0) && (fromdate!="") && todate!="")
								{
									insertCell(table, "  TOTAL PURCHASE LEDGER REPORT ", Element.ALIGN_CENTER, 4, bfBold12);
									insertCell(table, "  FROM DATE     "+fromdate+"    TO DATE      "+toDate, Element.ALIGN_CENTER, 4, bfBold12);
									
								}  
								else if((stID>0) && (fromdate=="") && todate=="")
								{
									insertCell(table, "  HOLE PURCHASE LEDGER REPORT OF SUPPLIER ", Element.ALIGN_CENTER, 4, bfBold12);
									
								}
							   
						   }
						   else
						   {  
						    insertCell(table, " SORRY NO PURCHASE RECORDS FOUND !!! ", Element.ALIGN_CENTER, 4, bfBold12);   
						   }

						   double overallTotPayment=0.0;
						   double overallTotaldDue=0.0;
						   double overallgrandTots=0.0;
						   double overallreturnSubtot=0.0;
						   
  
						   
						 for(int i=0;i<pLedgerList.size();i++)
						 {
							   double totalPayment=0.0;
							   double totaldue=0.0; 
							   double grandTots=0.0;
							   double returnSubtot=0.0;
						   CustomerName= pLedgerList.get(i).getSupplierName();
						   CstID=pLedgerList.get(i).getSupplierId();
						   insertCell(table, "***********************************************************************************************************************************************", Element.ALIGN_LEFT, 4, bfBold13);
						   insertCell(table, "Supplier Name : "+pLedgerList.get(i).getSupplierName() , Element.ALIGN_LEFT, 4, bfBold12);
						   ledgerBillList=ldao.getBillNoDetailsBySupplierIDPURCHASE(pLedgerList.get(i).getSupplierId(),fromDate,toDate); //******F2*****
						  
						 
							    double salevatTot=0.0;
							  
//							    ledgerItemList=ldao.getItemDetailsForPurchaseLedgerByBillNoPURCHASE(ledgerBillList.get(l).getBillNo());//******F3*****
						  
						 
						 
						    
//						    insertCell(table, ledgerItemList.get(0).getPurchaseAmount(), Element.ALIGN_RIGHT, 1, bf12);
						    insertCell(table, "", Element.ALIGN_LEFT, 4, bf12);
						    insertCell(table, "PAYMENT DETAILS", Element.ALIGN_LEFT, 4, bf14);// Payment Details
						    insertCell(table, "Invoice No" , Element.ALIGN_LEFT, 1, bf13);
						    insertCell(table, "Date of Payment" , Element.ALIGN_LEFT, 1, bf13);
						    insertCell(table, "Paid Amount", Element.ALIGN_CENTER, 1, bf13);
						    insertCell(table, "Due Amount", Element.ALIGN_RIGHT, 1, bf13);
						    
						    ledgerPaymentList=ldao.getSpaymentHistoryListByBillNoBYFROMDATETODATE(pLedgerList.get(i).getSupplierId()+"", fromdate, todate);
			                double maxdueamount=ldao.getMaxDueAmountByBillnoFromdateTotDate(pLedgerList.get(i).getSupplierId()+"", fromdate, todate);
						    double minDueAmount=ldao.getMinDueAmountByBillnoFromdateTotDate(pLedgerList.get(i).getSupplierId()+"", fromdate, todate);
						    
			                
			                for(int q=0;q<ledgerPaymentList.size();q++)
						    {
						    insertCell(table, ledgerPaymentList.get(q).getBillNo() , Element.ALIGN_LEFT, 1, bf12);
						    insertCell(table, ledgerPaymentList.get(q).getPaymentdate() , Element.ALIGN_LEFT, 1, bf12);
						    insertCell(table, ledgerPaymentList.get(q).getPaymentamount(), Element.ALIGN_CENTER, 1, bf12);
						    insertCell(table, ledgerPaymentList.get(q).getDueamount(), Element.ALIGN_RIGHT, 1, bf12);
						    totalPayment=totalPayment+Double.parseDouble(ledgerPaymentList.get(q).getPaymentamount());
						    }

						    grandTots=grandTots+maxdueamount;
						    insertCell(table, "", Element.ALIGN_LEFT, 4, bf12);
						    insertCell(table, "DEBIT NOTE DETAILS", Element.ALIGN_LEFT, 4, bf14);// Payment Details
						    ledgerDNList=ldao.getItemDetailsOFDNByBillNoPURCHASE(pLedgerList.get(i).getSupplierId()+"");///----F4---

						    int ls=ledgerDNList.size();
						    if(ls>0)
						    {
						    insertCell(table, "DN Number", Element.ALIGN_LEFT, 1, bf13);	    
							insertCell(table, "Debit Date" , Element.ALIGN_LEFT, 1, bf13);
							insertCell(table, "Return Subtot      Vat      Credit Amount", Element.ALIGN_CENTER, 1, bf13);	
							insertCell(table, "Due Amount", Element.ALIGN_RIGHT, 1, bf13);
							double dueamt=0.0;
							double gt=0.0;
							double cramt=0.0;
						    for(int s=0;s<ledgerDNList.size();s++)
						    {
						    double Vatamt=0.0;
							insertCell(table, ledgerDNList.get(s).getDnNo(), Element.ALIGN_LEFT, 1, bf12);
						    insertCell(table, ledgerDNList.get(s).getDnDoc() , Element.ALIGN_LEFT, 1, bf12);
						    Vatamt=Double.parseDouble(ledgerDNList.get(s).getSubTot())*Double.parseDouble(ledgerDNList.get(s).getVat())/100;
						    insertCell(table,ledgerDNList.get(s).getSubTot()+"      "+df.format(Vatamt)+"      "+ ledgerDNList.get(s).getDebitAmount(), Element.ALIGN_CENTER, 1, bf12);
						    
//						    double payamt=Double.parseDouble(ledgerItemList.get(0).getPaymentamount());
//						    double cramt=Double.parseDouble(ledgerDNList.get(s).getDebitAmount());
//						    dueamt=Double.parseDouble(ledgerItemList.get(0).getDueamount());
//						    gt=Double.parseDouble(ledgerItemList.get(0).getPurchaseAmount());
						    
						    cramt=Double.parseDouble(ledgerDNList.get(s).getSubTot())+Vatamt;
						    System.out.println("Credet amount found" + cramt);
						    System.out.println("due amount found" + dueamt);
						  
						    returnSubtot=returnSubtot+cramt;
						    dueamt=	minDueAmount-cramt;  //---------------- Main Calc
						    System.out.println("total due amount found" + dueamt);
			 		        insertCell(table, df.format(dueamt), Element.ALIGN_RIGHT, 1, bf12);
						    }
						    totaldue=totaldue+dueamt;
						    }

						    else
						    {
						    	totaldue=totaldue+minDueAmount;
							    insertCell(table, " NO DN DATA AVAILABLE ..", Element.ALIGN_LEFT, 4, bf14);	
						    }
						    insertCell(table, "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", Element.ALIGN_LEFT, 4, bf12);
						  
						        DecimalFormat dfg = new DecimalFormat();
							   dfg.setMaximumFractionDigits(2);
							   insertCell(table, "Total Payment : "+df.format(totalPayment) + " /-   "+"Total DN :"+df.format(returnSubtot)+" /-   "+" Total Due : "+  df.format(totaldue)+" /-   "+"Grand Total : "+df.format(grandTots)+" /-" , Element.ALIGN_RIGHT, 4, bfBold12);  
							  
							   overallTotPayment=overallTotPayment+totalPayment;
							   overallreturnSubtot=overallreturnSubtot+returnSubtot;
							   overallTotaldDue=overallTotaldDue+totaldue;
							   overallgrandTots=overallgrandTots+grandTots;
						 
						 }
						
						   
						  
						 
						 
						 
						 insertCell(table, "", Element.ALIGN_LEFT, 4, bfBold13);  
						 insertCell(table, "*****************************************************************************************************************************************************************************************", Element.ALIGN_LEFT, 4, bfBold13);  
						 insertCell(table, "Over all  Payment given : "+df.format(overallTotPayment) + " /-   "+"Over all Total DN :"+df.format(overallreturnSubtot)+" /-   "+"Over all Total Due : "+  df.format(overallTotaldDue)+" /-   "+"Over all Grand Total: "+df.format(overallgrandTots)+" /-" , Element.ALIGN_RIGHT, 4, bfBold12);
						 insertCell(table, "*****************************************************************************************************************************************************************************************", Element.ALIGN_LEFT, 4, bfBold13);  
						 
					
						   paragraph.add(table);
						   doc.add(paragraph);
						   doc.close();
						  
						   returnresult=true;}
							//++++++++++++++++++ MAIN LEDGER CALCULATION CODE ENDS HERE +++++++++++++++++++++++++++++
						 
						  catch (DocumentException dex)
						  {
						   dex.printStackTrace();
						  }
						  catch (Exception ex)
						  {
						   ex.printStackTrace();
						  }
						  finally
						  {
						   if (doc != null){
						    doc.close();
						   }
						   if (docWriter != null){
						    docWriter.close();
						   }
						  }
						  return returnresult;
						 }
					
			
				
				
				
				
				/*private boolean createpurledgerPDF (String pdfFilename,String fromDate,String toDate,String schemename,String sId) throws DaoException, SQLException{
					boolean returnresult=false;
					
					HttpServletRequest request=ServletActionContext.getRequest();
					DaoFactory dfact=new DaoFactory();
					
					String fromdate=request.getParameter("fromdate");
					String todate=request.getParameter("todate");
					String mode=request.getParameter("mode");

					LedgerDao ldao=dfact.createLedgerManager();
					SupplierMasterDAO sdao=dfact.CreateSupplierManager();
					CustomerMasterDAO cdao=dfact.createCustomerManager();
					
					int stID=0;
					try{
						stID=Integer.parseInt(sId);
					}catch(NumberFormatException n )
					{
						System.out.println("Suplier ID not found .... ");
					}
					//clist=cdao.getAllCustomerDetails();
				    supList=sdao.getAllSupplierDetails();
				    pLedgerList=ldao.getPurchaseLedger(fromdate, todate,stID); //***F1***
					
					List<PurchaseLedgerDto> ledgerBillList=new ArrayList<PurchaseLedgerDto>();
					List<PurchaseLedgerDto> ledgerItemList=new ArrayList<PurchaseLedgerDto>();
					List<PurchaseLedgerDto> ledgerDNList=new ArrayList<PurchaseLedgerDto>();
					List<PurchaseLedgerDto> ledgerPaymentList=new ArrayList<PurchaseLedgerDto>();
					
					//-----------------------------------------------  ALL Essential Configuration for ledger ends here ----------------------

					//++++++++++++++++++ MAIN LEDGER CALCULATION CODE BEGINS HERE +++++++++++++++++++++++++++++
					
					   List<SchemeMasterDto> saleSchemeListforCName=new ArrayList<SchemeMasterDto>();
					   List<SchemeMasterDto> saleSchemeListproducts=new ArrayList<SchemeMasterDto>();
					   Document doc = new Document();
					   PdfWriter docWriter = null;
					   DecimalFormat df = new DecimalFormat();
					   df.setMaximumFractionDigits(2);
					   
					  try {
					   Font bfBold12 = new Font(FontFamily.HELVETICA, 8, Font.BOLD, new BaseColor(0, 0, 0));
					   Font bfBold13 = new Font(FontFamily.TIMES_ROMAN, 5, Font.DEFAULTSIZE, new BaseColor(0, 0, 0));
					   Font bfBold15 = new Font(FontFamily.TIMES_ROMAN, 5, Font.DEFAULTSIZE, new BaseColor(0, 0, 0));
					   Font bf12 = new Font(FontFamily.HELVETICA, 6, Font.NORMAL, new BaseColor(0, 0, 0));
					   Font bf13 = new Font(FontFamily.HELVETICA, 6, Font.UNDERLINE, new BaseColor(0, 0, 0));
					   Font bf14 = new Font(FontFamily.HELVETICA, 6, Font.BOLD, new BaseColor(0, 0, 0));
					   String path =  pdfFilename;
					   docWriter = PdfWriter.getInstance(doc , new FileOutputStream(path));
					  
					   //document header attributes
					   doc.setPageSize(PageSize.A4);
					   doc.open();
					   Paragraph paragraph = new Paragraph("");
					   float[] columnWidths = {1.5f, 2f, 5f, 2f};
					   PdfPTable table = new PdfPTable(columnWidths);
					   table.setWidthPercentage(70f);
					   table.setHeaderRows(1);
					   insertCell(table, "", Element.ALIGN_LEFT, 4, bfBold12);
					   String CustomerName="";
					   int  CstID=0;
					   if(pLedgerList.size()>0)
					   {
						   
						if((stID>0 && (fromdate!="") && todate!=""))
							{
							   insertCell(table, "  PURCHASE LEDGER REPORT ", Element.ALIGN_CENTER, 4, bfBold12);
							   insertCell(table, "  FROM DATE     "+fromdate+"    TO DATE      "+toDate, Element.ALIGN_CENTER, 4, bfBold12);
							}
							else if((stID==0) && (fromdate!="") && todate!="")
							{
								insertCell(table, "  TOTAL PURCHASE LEDGER REPORT ", Element.ALIGN_CENTER, 4, bfBold12);
								insertCell(table, "  FROM DATE     "+fromdate+"    TO DATE      "+toDate, Element.ALIGN_CENTER, 4, bfBold12);
								
							}  
							else if((stID>0) && (fromdate=="") && todate=="")
							{
								insertCell(table, "  HOLE PURCHASE LEDGER REPORT OF SUPPLIER ", Element.ALIGN_CENTER, 4, bfBold12);
								
							}
						   
					   }
					   else
					   {  
					    insertCell(table, " SORRY NO PURCHASE RECORDS FOUND !!! ", Element.ALIGN_CENTER, 4, bfBold12);   
					   }

					   double overallTotPayment=0.0;
					   double overallTotaldDue=0.0;
					   double overallgrandTots=0.0;
					   double overallreturnSubtot=0.0;
					   

					   
					 for(int i=0;i<pLedgerList.size();i++)
					 {
						   double totalPayment=0.0;
						   double totaldue=0.0; 
						   double grandTots=0.0;
						   double returnSubtot=0.0;
					   CustomerName= pLedgerList.get(i).getSupplierName();
					   CstID=pLedgerList.get(i).getSupplierId();
					   insertCell(table, "***********************************************************************************************************************************************", Element.ALIGN_LEFT, 4, bfBold13);
					   insertCell(table, "Supplier Name : "+pLedgerList.get(i).getSupplierName() , Element.ALIGN_LEFT, 4, bfBold12);
					   ledgerBillList=ldao.getBillNoDetailsBySupplierIDPURCHASE(pLedgerList.get(i).getSupplierId(),fromDate,toDate); //******F2*****
					   for(int l=0;l<ledgerBillList.size();l++)
					   {
						    double salevatTot=0.0;
						    insertCell(table, "Invoice No" , Element.ALIGN_LEFT, 1, bf13);
						    insertCell(table, "Date of Invoice" , Element.ALIGN_LEFT, 1, bf13);
						    insertCell(table, "Sub Total          VAT", Element.ALIGN_CENTER, 1, bf13);
						    insertCell(table, "Grand Total", Element.ALIGN_RIGHT, 1, bf13);
						    ledgerItemList=ldao.getItemDetailsForPurchaseLedgerByBillNoPURCHASE(ledgerBillList.get(l).getBillNo());//******F3*****
					  
					    for(int x=0; x<ledgerItemList.size(); x++){ 
					    insertCell(table, ledgerItemList.get(0).getBillNo() , Element.ALIGN_LEFT, 1, bf12);
					    insertCell(table, ledgerItemList.get(0).getPurchaseDate(), Element.ALIGN_LEFT, 1, bf12);
					    salevatTot=Double.parseDouble(ledgerItemList.get(0).getSubTot())* Double.parseDouble(ledgerItemList.get(0).getVat())/100;
					    insertCell(table,ledgerItemList.get(0).getSubTot()+ "           " +df.format(salevatTot), Element.ALIGN_CENTER, 1, bf12); 
					    insertCell(table, ledgerItemList.get(0).getPurchaseAmount(), Element.ALIGN_RIGHT, 1, bf12);
					    insertCell(table, "", Element.ALIGN_LEFT, 4, bf12);
					    insertCell(table, "PAYMENT DETAILS", Element.ALIGN_LEFT, 4, bf14);// Payment Details
					    insertCell(table, "Invoice No" , Element.ALIGN_LEFT, 1, bf13);
					    insertCell(table, "Date of Payment" , Element.ALIGN_LEFT, 1, bf13);
					    insertCell(table, "Paid Amount", Element.ALIGN_CENTER, 1, bf13);
					    insertCell(table, "Due Amount", Element.ALIGN_RIGHT, 1, bf13);
					    ledgerPaymentList=ldao.getSpaymentHistoryListByBillNoBYFROMDATETODATE(ledgerBillList.get(l).getBillNo(), fromdate, todate);
					    double minDueAmount=ldao.getMinDueAmountByBillnoFromdateTotDate(ledgerBillList.get(l).getBillNo(), fromdate, todate);
					    for(int q=0;q<ledgerPaymentList.size();q++)
					    {
					    insertCell(table, ledgerPaymentList.get(q).getBillNo() , Element.ALIGN_LEFT, 1, bf12);
					    insertCell(table, ledgerPaymentList.get(q).getPaymentdate() , Element.ALIGN_LEFT, 1, bf12);
					    insertCell(table, ledgerPaymentList.get(q).getPaymentamount(), Element.ALIGN_CENTER, 1, bf12);
					    insertCell(table, ledgerPaymentList.get(q).getDueamount(), Element.ALIGN_RIGHT, 1, bf12);
					    totalPayment=totalPayment+Double.parseDouble(ledgerPaymentList.get(q).getPaymentamount());
					    }

					    grandTots=grandTots+Double.parseDouble(ledgerItemList.get(0).getPurchaseAmount());
					    insertCell(table, "", Element.ALIGN_LEFT, 4, bf12);
					    insertCell(table, "DEBIT NOTE DETAILS", Element.ALIGN_LEFT, 4, bf14);// Payment Details
					    ledgerDNList=ldao.getItemDetailsOFDNByBillNoPURCHASE(ledgerBillList.get(l).getBillNo());///----F4---

					    int ls=ledgerDNList.size();
					    if(ls>0)
					    {
					    insertCell(table, "DN Number", Element.ALIGN_LEFT, 1, bf13);	    
						insertCell(table, "Debit Date" , Element.ALIGN_LEFT, 1, bf13);
						insertCell(table, "Return Subtot      Vat      Credit Amount", Element.ALIGN_CENTER, 1, bf13);	
						insertCell(table, "Due Amount", Element.ALIGN_RIGHT, 1, bf13);
						double dueamt=0.0;
						double gt=0.0;
						
					    for(int s=0;s<ledgerDNList.size();s++)
					    {
					    double Vatamt=0.0;
						insertCell(table, ledgerDNList.get(s).getDnNo(), Element.ALIGN_LEFT, 1, bf12);
					    insertCell(table, ledgerDNList.get(s).getDnDoc() , Element.ALIGN_LEFT, 1, bf12);
					    Vatamt=Double.parseDouble(ledgerDNList.get(s).getSubTot())*Double.parseDouble(ledgerDNList.get(s).getVat())/100;
					    insertCell(table,ledgerDNList.get(s).getSubTot()+"      "+df.format(Vatamt)+"      "+ ledgerDNList.get(s).getDebitAmount(), Element.ALIGN_CENTER, 1, bf12);
					    
					    double payamt=Double.parseDouble(ledgerItemList.get(0).getPaymentamount());
					    double cramt=Double.parseDouble(ledgerDNList.get(s).getDebitAmount());
					    dueamt=Double.parseDouble(ledgerItemList.get(0).getDueamount());
					    gt=Double.parseDouble(ledgerItemList.get(0).getPurchaseAmount());
					    
					    cramt=Double.parseDouble(ledgerDNList.get(s).getSubTot())+Vatamt;
					    System.out.println("Credet amount found" + cramt);
					    System.out.println("due amount found" + dueamt);
					  
					    returnSubtot=returnSubtot+cramt;
					    dueamt=	dueamt-returnSubtot;  //---------------- Main Calc
					    System.out.println("total due amount found" + dueamt);
		 		        insertCell(table, df.format(dueamt), Element.ALIGN_RIGHT, 1, bf12);
					    }
					    totaldue=totaldue+minDueAmount;
					    }

					    else
					    {
					    	totaldue=totaldue+minDueAmount;
						    insertCell(table, " NO DN DATA AVAILABLE ..", Element.ALIGN_LEFT, 4, bf14);	
					    }
					    insertCell(table, "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------", Element.ALIGN_LEFT, 4, bf12);
					   }
					 }
					   
					   DecimalFormat dfg = new DecimalFormat();
					   dfg.setMaximumFractionDigits(2);
					   insertCell(table, "Total Payment : "+df.format(totalPayment) + " /-   "+"Total DN :"+df.format(returnSubtot)+" /-   "+" Total Due : "+  df.format(totaldue)+" /-   "+"Grand Total : "+df.format(grandTots)+" /-" , Element.ALIGN_RIGHT, 4, bfBold12);  
					  
					   overallTotPayment=overallTotPayment+totalPayment;
					   overallreturnSubtot=overallreturnSubtot+returnSubtot;
					   overallTotaldDue=overallTotaldDue+totaldue;
					   overallgrandTots=overallgrandTots+grandTots;
					 }
					 
					 
					 insertCell(table, "", Element.ALIGN_LEFT, 4, bfBold13);  
					 insertCell(table, "*****************************************************************************************************************************************************************************************", Element.ALIGN_LEFT, 4, bfBold13);  
					 insertCell(table, "Over all  Payment given : "+df.format(overallTotPayment) + " /-   "+"Over all Total DN :"+df.format(overallreturnSubtot)+" /-   "+"Over all Total Due : "+  df.format(overallTotaldDue)+" /-   "+"Over all Grand Total: "+df.format(overallgrandTots)+" /-" , Element.ALIGN_RIGHT, 4, bfBold12);
					 insertCell(table, "*****************************************************************************************************************************************************************************************", Element.ALIGN_LEFT, 4, bfBold13);  
					 
				
					   paragraph.add(table);
					   doc.add(paragraph);
					   doc.close();
					  
					   returnresult=true;
						//++++++++++++++++++ MAIN LEDGER CALCULATION CODE ENDS HERE +++++++++++++++++++++++++++++
					 }
					  catch (DocumentException dex)
					  {
					   dex.printStackTrace();
					  }
					  catch (Exception ex)
					  {
					   ex.printStackTrace();
					  }
					  finally
					  {
					   if (doc != null){
					    doc.close();
					   }
					   if (docWriter != null){
					    docWriter.close();
					   }
					  }
					  return returnresult;
					 }			
				*/
				
				
//################################################################################### Printing method for generating PDF file for particular CN Number ...Printing method for generating PDF file for particular CN Number .. Start here ##################################################################################################
//#########################################################################################################################################################################################################################################################################################################################################
							
							public String printCreditCoverLetter()
							{
								HttpServletRequest request=ServletActionContext.getRequest();
								String bill=request.getParameter("billNo");
								String cn=request.getParameter("cn");
								System.out.println("bill= "+bill);
								System.out.println("cn "+cn);
								boolean flag = false;
								File stockFile = new File("C://SMS//Tomcat7//webapps//sms//ledgerReports//printCoverLetter.pdf");
								try {
								    flag = stockFile.createNewFile();
								    if(flag)
								    {
								    	System.out.println("C://SMS//Tomcat7//webapps//sms//ledgerReports//printCoverLetter.pdf");
								    }
								} catch (IOException ioe) {
								     System.out.println("Error while Creating File in Java" + ioe);}
								System.out.println("stock file" + stockFile.getPath() + " created ");
								try
								{
									DaoFactory dfact=new DaoFactory();
									LedgerDao ldao=dfact.createLedgerManager();
								    ledgerCNList=ldao.printCNLedgerByBillNoCnNo(bill, cn);
						            String path=getLedgerListPath();
								    Document document = new Document(PageSize.A4);
						  	        PdfWriter.getInstance(document, new FileOutputStream("C://SMS//Tomcat7//webapps//sms//ledgerReports//printCoverLetter.pdf"));
						  	        document.open();
						  	        document.addCreationDate();
						  	        document.addTitle("Cover Letter");
						            String date=CurrentDate.getOnlyDateWithMySQLFORMAT();
						            String cnno=cn;
						            String cnDate=ledgerCNList.get(0).getCnDoc();
						            String grandTotal=ledgerCNList.get(0).getCreditAmount();
						            String customerName=ledgerCNList.get(0).getCustomerName();
						            String customeraddress=ledgerCNList.get(0).getCustomeraddress();
						            String location="Howrah";
						            String State="West Bengal";
						            String currentCompanyName=ledgerCNList.get(0).getCurrentCompanyName();
						  	        HTMLWorker htmlWorker = new HTMLWorker(document);
						  	        //------------------------------------------------------------- Cover Letter Design -->>>>  Start here--------------------------------------------------------//
						  	        String str = "<html><head></head><body><br/>" +
						  	        		"<br/>" +
						  	        		"<br/>"+
						  	        		"<br/>"+
						  	        "<p>"+ date+
						  	        "</p><br/>" +
						            "<p> M/S &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>"+ customerName+"</b>,"+
						  	        "</p> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +customeraddress+","+
						  	        "<p> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +location+","+
						  	        "</p>"+
						  	        "<p> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +State+"," +
						  	        "</p>"+
						  	        "<div style='width: 100px'></div>" +
						  	        "<br/><br/><p>Dear Sir, " +
						  	        "<br/> <br/><center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
						  	        "<b style='text-decoration: underline;'>Sub: Enclosure of Credit Note against rate & quality difference -reg</b> </center>" +
						  	        "<br/><br/>" +
						  	        "<p >Please find enclosed here with Credit note for rate & quality difference (rejected pieces).</p>" +
						              "<p ><b ><font size='2'>CN Number:&nbsp;" +cnno+
						              "</font></b>"+
						              "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size='2'>CN Date:&nbsp;" +cnDate+
						              "</font></b>"+
						              "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font size='2'>Grand Total:&nbsp;" +grandTotal+
						              "</font></b></p>"+
						              "<br/><p >Kindly acknowledge on receipt of the same.</p>" +
						              "<br/><p >Thanking you,</p>" +
						              "<p ><b>Yours truly,</p>" +
						              "<p ><b>For "+currentCompanyName+"</p></b>"+
						  	        "</body></html>";
						  	      //------------------------------------------------------------- Cover Letter Design -->>>>  End here--------------------------------------------------------//
						  	      htmlWorker.parse(new StringReader(str));
						  	      document.close();
						  	      System.out.println("Done");
						         /* boolean resultUpload=ldao.uploadFileToWebServer(path);
						          if(resultUpload)
						          {System.out.println("PDf uploaded.");} */
								}
								catch(Exception e)
								{
									System.out.println("An exception found.."+e);
								}
								request.setAttribute("bill", bill);
								request.setAttribute("cn", cn);
								return SUCCESS;
								
							}
							
						public String printCreditLedger()
							{
							HttpServletRequest request=ServletActionContext.getRequest();
							String bill=request.getParameter("billNo");
							String cn=request.getParameter("cn");
							System.out.println("bill= "+bill);
							System.out.println("cn= "+cn);
							boolean flag = false;
							File stockFile = new File("C://SMS//Tomcat7//webapps//sms//ledgerReports//printCoverLetter.pdf");
							try {
							    flag = stockFile.createNewFile();
							    if(flag)
							    {
							    	System.out.println("Pdf file created in your local machine... C://SMS//Tomcat7//webapps//sms//ledgerReports//printCoverLetter.pdf");
							    }
							} catch (IOException ioe) {
							     System.out.println("Error while Creating File in Java" + ioe);}
							System.out.println("stock file" + stockFile.getPath() + " created ");
							try
							{
								DaoFactory dfact=new DaoFactory();
								LedgerDao ldao=dfact.createLedgerManager();
								ledgerCNList=ldao.printCNLedgerByBillNoCnNo(bill, cn);
					            String path="C://SMS//Tomcat7//webapps//sms//ledgerReports//printCoverLetter.pdf";
							    OutputStream file = new FileOutputStream(new File(path));
					            Document document = new Document();
					            PdfWriter.getInstance(document, file);
					            document.open();
					            BaseFont bf = BaseFont.createFont(
					            BaseFont.TIMES_ROMAN,
					            BaseFont.CP1252,
					            BaseFont.EMBEDDED);
					            Font font = new Font(bf, 10);
					            String headerP="Customer Name : "+ledgerCNList.get(0).getCustomerName()+"       "+"C.N Number : "+cn+"       "+"C.N date : "+ledgerCNList.get(0).getCnDoc(); 
					            Paragraph paragraph = new Paragraph(headerP,new Font(Font.FontFamily.TIMES_ROMAN, 11));
					            paragraph.setAlignment(Element.ALIGN_CENTER);
					            
					            paragraph.add(new Paragraph(" "));
					                      
					            document.add(paragraph);
					            PdfPTable pdfTable = new PdfPTable(6);
					            
					            PdfPCell cell1 = new PdfPCell(new Phrase("ITEM NAME",font));
					            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
					            pdfTable.addCell(cell1);
					            
					            cell1 = new PdfPCell(new Phrase("SIZE",font));
					            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
					            pdfTable.addCell(cell1);

					            cell1 = new PdfPCell(new Phrase("PURCHASE QUANTITY",font));
					            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
					            pdfTable.addCell(cell1);

					            cell1 = new PdfPCell(new Phrase("RATE",font));
					            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
					            pdfTable.addCell(cell1);
					            
					           /* cell1 = new PdfPCell(new Phrase("VALUE",font));
					            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
					            pdfTable.addCell(cell1);*/
					            
					            cell1 = new PdfPCell(new Phrase("RETURN PCS",font));
					            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
					            pdfTable.addCell(cell1);
					            
					            cell1 = new PdfPCell(new Phrase("RETURN VALUE",font));
					            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
					            pdfTable.addCell(cell1);
					            
					            pdfTable.setHeaderRows(-1);

					            	for(int i=0; i<ledgerCNList.size();i++)
					            	{
					            		  PdfPCell cell2 = new PdfPCell(new Phrase(ledgerCNList.get(i).getItemName(),font));
					                      cell1.setHorizontalAlignment(Element.ALIGN_CENTER);		
					                      pdfTable.addCell(cell2);
					                      
					                      PdfPCell cell8 = new PdfPCell(new Phrase(ledgerCNList.get(i).getItemSize(),font));
					                      cell8.setHorizontalAlignment(Element.ALIGN_CENTER);		
					                      pdfTable.addCell(cell8);
					                      
					                      PdfPCell cell3 = new PdfPCell(new Phrase(ledgerCNList.get(i).getTotalItemQty()+"",font));
					                      cell3.setHorizontalAlignment(Element.ALIGN_CENTER);		
					                      pdfTable.addCell(cell3);
					                      
					                      PdfPCell cell4 = new PdfPCell(new Phrase(ledgerCNList.get(i).getSaleAmount(),font));
					                      cell4.setHorizontalAlignment(Element.ALIGN_CENTER);		
					                      pdfTable.addCell(cell4);
					                     
					                     /* PdfPCell cell5 = new PdfPCell(new Phrase(ledgerCNList.get(i).getItemTot()+"",font));
					                      cell5.setHorizontalAlignment(Element.ALIGN_CENTER);		
					                      pdfTable.addCell(cell5);*/
					                      
					                      PdfPCell cell6 = new PdfPCell(new Phrase(ledgerCNList.get(i).getReturnquantity(),font));
					                      cell6.setHorizontalAlignment(Element.ALIGN_CENTER);		
					                      pdfTable.addCell(cell6);
					                      
					                      PdfPCell cell7 = new PdfPCell(new Phrase(ledgerCNList.get(i).getItemTotal(),font));
					                      cell7.setHorizontalAlignment(Element.ALIGN_CENTER);		
					                      pdfTable.addCell(cell7);
					              
					            	}
					            	  /*DecimalFormat df= new DecimalFormat("0.00");*/
					            	  Double taxAmt=0.00;
					            	  taxAmt=Double.parseDouble(ledgerCNList.get(0).getCreditAmount())-Double.parseDouble(ledgerCNList.get(0).getSubTot());
					            	  /*DecimalFormat df= new DecimalFormat("#.##");
					            	  taxAmt=df.format(taxAmt);*/
					            	 
					            	  document.add(pdfTable);
					            	  paragraph.add(new Paragraph(" "));
					            	  paragraph.add(new Paragraph(" "));
					            	  String footerP="Tax amount ("+ledgerCNList.get(0).getVat()+"%): "+ new DecimalFormat("#.##").format(taxAmt)+"       "+"Sub Total : "+ledgerCNList.get(0).getSubTot()+"       "+"Grand Total : "+ledgerCNList.get(0).getCreditAmount(); 
					                  Paragraph footer = new Paragraph(footerP,new Font(Font.FontFamily.TIMES_ROMAN, 11));
					                  footer.setAlignment(Element.ALIGN_CENTER);
					                  footer.add(new Paragraph(" "));
					                  document.add(footer);
					            document.close();
					            file.close();
					            
					           
					            	System.out.println("PDf uploaded.");
					            
							}
							catch(Exception e)
							{
								System.out.println("An exception found.."+e);
							}
							request.setAttribute("bill", bill);
							request.setAttribute("cn", cn);
							return SUCCESS;
							}
//################################################################################### Printing method for generating PDF file for particular CN Number .. End here ##################################################################################################	
											

	//######################################################################################################################################################################################################################################
	//****************************************************** P U R C H A S E  ***** CODES ALTERD BY PRADIPTO ROY ***************************************************************************************************************************		 
	//++++++++++++++++++++++++++++++++++++++++  L E D G E R  R E P O R T   E N D   H E R E    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	//######################################################################################################################################################################################################################################		
	
	
	
	
	
	
}
