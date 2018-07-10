package actions;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;

import util.AllBankNames;
import util.SMSSender1;

import com.opensymphony.xwork2.Action;
import com.sun.net.httpserver.Authenticator.Success;

import dTO.CustomerMasterDTO;
import dTO.LoginUserCompanyMasterDto;
import dTO.SmsMaster;
import dTO.StockMasterDTO;
import dTO.SupplierMasterDTO;
import dao.CustomerMasterDAO;
import dao.CustomerPaymentDao;
import dao.DaoFactory;
import dao.SupplierMasterDAO;
import dao.SupplierPaymentDao;

public class SupplierPaymentAction implements Action {
	StockMasterDTO stockDto = new StockMasterDTO();
	StockMasterDTO sPayDto = new StockMasterDTO();
	List<StockMasterDTO> stockList = new LinkedList<StockMasterDTO>();
	List<StockMasterDTO> sPayList = new LinkedList<StockMasterDTO>();
	int listsize = 0;
	double totalDue=0;
	AllBankNames banknamesDto=new AllBankNames();
	List<AllBankNames> banknamesDtoList=new ArrayList<AllBankNames>();
	LoginUserCompanyMasterDto companyDto=new LoginUserCompanyMasterDto();
	List<CustomerMasterDTO> clist=new ArrayList<CustomerMasterDTO>();
	List<SupplierMasterDTO> sdolist=new ArrayList<SupplierMasterDTO>();
	

	public List<SupplierMasterDTO> getSdolist() {
		return sdolist;
	}

	public void setSdolist(List<SupplierMasterDTO> sdolist) {
		this.sdolist = sdolist;
	}

	public List<CustomerMasterDTO> getClist() {
		return clist;
	}

	public void setClist(List<CustomerMasterDTO> clist) {
		this.clist = clist;
	}

	public StockMasterDTO getStockDto() {
		return stockDto;
	}

	public void setStockDto(StockMasterDTO stockDto) {
		this.stockDto = stockDto;
	}

	public StockMasterDTO getsPayDto() {
		return sPayDto;
	}

	public void setsPayDto(StockMasterDTO sPayDto) {
		this.sPayDto = sPayDto;
	}

	public List<StockMasterDTO> getStockList() {
		return stockList;
	}

	public void setStockList(List<StockMasterDTO> stockList) {
		this.stockList = stockList;
	}

	public List<StockMasterDTO> getsPayList() {
		return sPayList;
	}

	public void setsPayList(List<StockMasterDTO> sPayList) {
		this.sPayList = sPayList;
	}

	public int getListsize() {
		return listsize;
	}

	public void setListsize(int listsize) {
		this.listsize = listsize;
	}
	
	public double getTotalDue() {
		return totalDue;
	}

	public void setTotalDue(double totalDue) {
		this.totalDue = totalDue;
	}
	
	public synchronized AllBankNames getBanknamesDto() {
		return banknamesDto;
	}

	public synchronized void setBanknamesDto(AllBankNames banknamesDto) {
		this.banknamesDto = banknamesDto;
	}

	public synchronized List<AllBankNames> getBanknamesDtoList() {
		return banknamesDtoList;
	}

	public synchronized void setBanknamesDtoList(List<AllBankNames> banknamesDtoList) {
		this.banknamesDtoList = banknamesDtoList;
	}
	public LoginUserCompanyMasterDto getCompanyDto() {
		return companyDto;
	}

	public void setCompanyDto(LoginUserCompanyMasterDto companyDto) {
		this.companyDto = companyDto;
	}

	@Override
	public String execute() throws Exception {
		try {
			DaoFactory dfact = new DaoFactory();
			SupplierPaymentDao cpdao = dfact.createSupplierPayManager();
			stockList = cpdao.getSupplierWithDuePay();
			//cPayList = cpdao.getCustomerWithDuePay();
			 banknamesDtoList=cpdao.getAllBankList();
				int bankListSize=banknamesDtoList.size();
				for(int h=0;h<bankListSize;h++)
				{
					System.out.println("Bank found "+banknamesDtoList.get(h).getBanknames());
				}

		} catch (Exception e) {
			System.out.println("ex=" + e);
		}
		return SUCCESS;
	}
	
	public String supplierPaymentBilNo() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String supplierId = request.getParameter("supplierId");
		String result = ERROR;
		try {
			DaoFactory dfact = new DaoFactory();
			SupplierPaymentDao cpdao = dfact.createSupplierPayManager();
			stockList = cpdao.getPaymentBillNoSupplierId(supplierId);
			if (stockList != null) {
				for (int i = 0; i < stockList.size(); i++) {
					totalDue = totalDue
							+ Double.parseDouble(stockList.get(i).getDueAmt());
				}
				request.setAttribute("totalDue", totalDue);
				result = SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String supplierPaymentDetailsByBilNo() throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();
		String result=ERROR;
		float totalPaid=0, totalDue=0;
		try {
			DaoFactory dfact=new DaoFactory();
			SupplierPaymentDao cpdao=dfact.createSupplierPayManager();
			SupplierMasterDAO spdao=dfact.CreateSupplierManager();
			banknamesDtoList=cpdao.getAllBankList();
			String billNo=request.getParameter("billNo");
			String supplierId=request.getParameter("supplierId");
			billNo=billNo.trim();
			supplierId=supplierId.trim();
			System.out.println("bill"+billNo);
			stockList=cpdao.getSupplierPaymentHistoryByBillNo(billNo,supplierId);
			
			sdolist=spdao.getAllSupplierDetails();

			if (stockList!=null) {
				for (int i = 0; i < stockList.size(); i++) {
					totalPaid=totalPaid+Float.parseFloat(stockList.get(i).getsPaidAmt());
				}
				totalDue=Float.parseFloat(stockList.get(0).getGrandTot())-totalPaid;
				if(totalDue<0)
				{
					totalDue=Float.parseFloat("0.0");
				}
				System.out.println("paid= "+totalPaid+ " due= "+totalDue);
				stockDto.setSupplierId(stockList.get(0).getSupplierId());
				stockDto.setGrandTot(stockList.get(0).getGrandTot());
				stockDto.setTotalPaid(totalPaid+"");
				stockDto.setTotaldue(totalDue+"");
				listsize=stockList.size();
				request.setAttribute("supId", stockList.get(0).getSupplierId());
				request.setAttribute("gtot", stockList.get(0).getGrandTot());
				request.setAttribute("tPaid", totalPaid);
				request.setAttribute("tDue", totalDue);
				result=SUCCESS;
			}else{
				listsize=0;
				stockDto.setGrandTot("");
				stockDto.setTotalPaid("");
				stockDto.setTotaldue("");
				result=SUCCESS;
			}
		} catch (Exception e) {
			System.out.println("ex="+e);
		}
		return result;
	}

	/*public String saveSupplierPayment() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		String result = ERROR;
		float totalDue = Float.parseFloat(request.getParameter("totaldue"));
		float newAmt=0;
		System.out.println(request.getParameter("pBillno"));
		cPayDto.setBillno(request.getParameter("pBillno"));
		try
		{
		 newAmt = Float.parseFloat(request.getParameter("sPaidAmt"));
		 stockDto.setsPayMode("Cash");
		}
		catch(Exception e)
		{
			float chechPaidAmt = Float.parseFloat(request.getParameter("chechPaidAmt"));
			newAmt=chechPaidAmt;
			stockDto.setsPayMode("Cheque");		
		}
		float due = 0;
		if (totalDue > newAmt) {
			due = totalDue - newAmt;
			stockDto.setsPaidStatus("Partial");
		} else {
			due = 0;
			stockDto.setsPaidStatus("Paid");
		}
		stockDto.setDueAmt(due + "");
		stockDto.setsPaidAmt(newAmt+"");
		stockDto.setGrandTot(request.getParameter("grandTotal"));
		//stockDto.setSupplierId(Integer.parseInt(request.getParameter("supplierId")));
	
		try {
			DaoFactory dfact = new DaoFactory();
			SupplierPaymentDao cpdao = dfact.createSupplierPayManager();
			if (cpdao.saveSupplierPayment(stockDto)) {
				System.out.println("Supplier Payment Saved Successfully!.");
				request.setAttribute("Messages", "Supplier Payment Saved Successfully!");
				result = SUCCESS;
			} else {

			}

		} catch (Exception e) {
			System.out.println("ex=" + e);
		}
		return result;
	}*/
	
	public String saveSupplierPayment() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		String result = ERROR;
		System.out.println("date= " + stockDto.getsPayDate());
		System.out.println("supId= " + stockDto.getSupplierId());
		String[] billwiseAmt = request.getParameterValues("sPaidAmt[]");
//		String[] bill = request.getParameterValues("sBillNo[]");
		System.out.println("billwise no: " + billwiseAmt.length);
//		System.out.println("bill no: " + bill.length);
		String[] billwiseAmt1 = new String[billwiseAmt.length];
//		String[] bill1 =new String[bill.length];
		String checqueno[]=request.getParameterValues("chequeno");
		String checqueBank[]=request.getParameterValues("bankname");
		String paymentType[]=request.getParameterValues("paymentType");
		
		try {
			DaoFactory dfact = new DaoFactory();
			SupplierPaymentDao cpdao = dfact.createSupplierPayManager();
			int k=0;
			
			
				if(billwiseAmt[0].equalsIgnoreCase("")){
						
					
//						bill1[k]=bill[i];
//						System.out.println("bill[i]= "+bill1[k]);
				} else {
					billwiseAmt1[k]=billwiseAmt[k];
//					bill1[k]=bill[i];
				}
		
			
			
				if(billwiseAmt1[0]!=null){

					stockDto.setBillNo("NA");
					stockDto.setsPaidAmt(billwiseAmt1[0]);
					stockDto.setChequeNo(checqueno[0]);
					stockDto.setChequeBank(checqueBank[0]);
					stockDto.setsPayMode(paymentType[0]);

					if (cpdao.saveSupplierPayment(stockDto)) {
						System.out.println("Supplier Payment Saved Successfully!.");
						request.setAttribute("Messages","Supplier Payment Saved Successfully!");
						result = SUCCESS;
					}
				}
			
		} catch (Exception e) {
			System.out.println("ex=" + e);
			e.printStackTrace();
		}

		return result;
	}

	/*public String allCustomerPaymentDueSatus() {

		String result = ERROR;
		try {
			DaoFactory dfact = new DaoFactory();
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();
			cPayList = cpdao.getAllCustomerPaymentDueInfo();
			if (cPayList != null) {
				result = SUCCESS;
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return result;

	}
	
	public String allCustomerPaymentDueSatusForPrint() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String result = ERROR;
		try {
			DaoFactory dfact = new DaoFactory();
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();
			CompanyMasterDAO ldao=dfact.createCompanyMasterManager();
			
			cPayList = cpdao.getAllCustomerPaymentDueInfo();
			companyDto=ldao.getCurrentCompanyDetails();
			
			request.setAttribute("companyName", companyDto.getNameofcompany());
			request.setAttribute("companyAddress", companyDto.getAddress());
			request.setAttribute("companyPhone", companyDto.getPhoneno());
			request.setAttribute("companyEmail", companyDto.getEmail());
			
			result = SUCCESS;
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		return result;

	}

	public String paymentDueSatusOfCustomer() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String customerId = request.getParameter("customerId");
		String result = ERROR;
		try {
			DaoFactory dfact = new DaoFactory();
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();
			cPayList = cpdao.getPaymentDueInfoByCustomerId(customerId);
			request.setAttribute("customerId", customerId);
			if (cPayList != null) {
				result = SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String paymentDueSatusOfCustomerPrint() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String customerId = request.getParameter("customerId");
		String result = ERROR;
		try {
			DaoFactory dfact = new DaoFactory();
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();
			CompanyMasterDAO ldao=dfact.createCompanyMasterManager();
			
			cPayList = cpdao.getPaymentDueInfoByCustomerId(customerId);
			companyDto=ldao.getCurrentCompanyDetails();
			
			request.setAttribute("companyName", companyDto.getNameofcompany());
			request.setAttribute("companyAddress", companyDto.getAddress());
			request.setAttribute("companyPhone", companyDto.getPhoneno());
			request.setAttribute("companyEmail", companyDto.getEmail());
			result = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String paymentSatusOfCustomer() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String customerId = request.getParameter("customerId");
		String result = ERROR;
		try {
			DaoFactory dfact = new DaoFactory();
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();
			cPayList = cpdao.getPaymentInfoByCustomerId(customerId);
			if (cPayList != null) {
				result = SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String getCustomerWithDuePay() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String result = ERROR;
		try {
			DaoFactory dfact = new DaoFactory();
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();
			cPayList = cpdao.getCustomerWithDuePay();
			if (cPayList != null) {
				result = SUCCESS;
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return result;
	}
	
	*/
	
	public String smsPay()
	{
		return SUCCESS;
	}
	
	public String searchCustomerforsms()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String cstname = request.getParameter("cstname");
		String smsremain = request.getParameter("smsremain");
		
		String result = ERROR;
		try {
			DaoFactory dfact = new DaoFactory();
			CustomerMasterDAO cdao=dfact.createCustomerManager();
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();
			clist = cdao.getAllCustomerDetailsByNames(cstname);
			request.setAttribute("clist", clist);
			request.setAttribute("smsremain", smsremain);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		
		
		
				}
		return SUCCESS;
	}
	
	
	public String custsmssend()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String message = request.getParameter("message");
		String[] mobileno=request.getParameterValues("mobile");
	    String smsremaining=request.getParameter("remainsms");
	     List<SmsMaster> smlist=new ArrayList<SmsMaster>();
		
		String result = ERROR;
		try {
			DaoFactory dfact = new DaoFactory();
			CustomerMasterDAO cdao=dfact.createCustomerManager();
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();
			smlist=cpdao.getSmsDetails();
			String smsresult="";
			int countsms=0;
			for(int i=0;i<mobileno.length;i++)
			{
			 countsms=countsms+1;
			 smsresult=SMSSender1.sendSmsGateway(mobileno[i], message);
			 JSONObject obj = new JSONObject(smsresult);
			 System.out.println(obj);
			 
			 
			 
			 
			 
			 countsms++;
			}
			
			for(SmsMaster s:smlist)
			{
//				smsresult=s.getLastsmsjson();
				
				s.setSmsremain(smsremaining);
				s.setLastsmsjson(smsresult);
				boolean sr=cpdao.updateSmsMaster(s);
				if(sr)
				{
					System.out.println("one sms sent sucessfully");
				}
				
			}
			
			String s=ServletActionContext.getServletContext().getRealPath("json/json.txt");
			System.out.println(s);
				 
			BufferedWriter bwr = new BufferedWriter(new FileWriter(new File(s)));
	        
	        //write contents of StringBuffer to a file
	       
				bwr.write(smsresult);
				bwr.flush();
			    bwr.close();
			
		
			request.setAttribute("smsresult", smsresult);
			request.setAttribute("clist", clist);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		
		
		
				}
		return SUCCESS;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	public String searchSupplierByName()
	{
		
	    DaoFactory dfact=new DaoFactory();
		SupplierPaymentDao sdao=dfact.createSupplierPayManager();
		SupplierMasterDAO smdao=dfact.CreateSupplierManager();
		HttpServletRequest request=ServletActionContext.getRequest();
		String sp=request.getParameter("sp");
		
		try
		{
			sdolist=smdao.getAllSupplierDetailsBySUPNAME(sp);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
		return SUCCESS;
	}
	
	
	
	
	
	
	
	
	
	
}
