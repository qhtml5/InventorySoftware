package actions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import util.AllBankNames;
import util.CurrentDate;
import util.ExcelExport;

import com.opensymphony.xwork2.Action;

import dTO.LoginUserCompanyMasterDto;
import dTO.PurchaseLedgerDto;
import dTO.SalesMasterDto;
import dao.CompanyMasterDAO;
import dao.CustomerPaymentDao;
import dao.DaoFactory;
import dao.ItemMasterAndTypeDAO;
import dao.LedgerDao;
import dao.LoginMasterDAO;
import dao.SupplierMasterDAO;

public class CustomerPaymentAction implements Action {
	SalesMasterDto saleDto = new SalesMasterDto();
	SalesMasterDto cPayDto = new SalesMasterDto();
	List<SalesMasterDto> saleList = new LinkedList<SalesMasterDto>();
	List<SalesMasterDto> cPayList = new LinkedList<SalesMasterDto>();
	List<SalesMasterDto> customerList = new LinkedList<SalesMasterDto>();
	int listsize = 0;
	double totalDue=0;
	AllBankNames banknamesDto=new AllBankNames();
	List<AllBankNames> banknamesDtoList=new ArrayList<AllBankNames>();
	LoginUserCompanyMasterDto companyDto=new LoginUserCompanyMasterDto();
	
	
	public SalesMasterDto getSaleDto() {
		return saleDto;
	}

	public void setSaleDto(SalesMasterDto saleDto) {
		this.saleDto = saleDto;
	}

	public SalesMasterDto getcPayDto() {
		return cPayDto;
	}

	public void setcPayDto(SalesMasterDto cPayDto) {
		this.cPayDto = cPayDto;
	}

	public List<SalesMasterDto> getSaleList() {
		return saleList;
	}

	public void setSaleList(List<SalesMasterDto> saleList) {
		this.saleList = saleList;
	}

	public List<SalesMasterDto> getcPayList() {
		return cPayList;
	}

	public void setcPayList(List<SalesMasterDto> cPayList) {
		this.cPayList = cPayList;
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
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();
			saleList = cpdao.getAllUnpaidBillofSales();
			cPayList = cpdao.getCustomerWithDuePay();
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

	public String customerPaymentDetailsByBilNo() throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();
		String result=ERROR;
		float totalPaid=0, totalDue=0;
		try {
			DaoFactory dfact=new DaoFactory();
			CustomerPaymentDao cpdao=dfact.createCustomerPayManager();
			banknamesDtoList=cpdao.getAllBankList();
			String billNo=request.getParameter("billNo");
			billNo=billNo.trim();
			System.out.println("bill"+billNo);
			cPayList=cpdao.getPaymentHistoryByBillNo(billNo);

			if (cPayList!=null) {
				for (int i = 0; i < cPayList.size(); i++) {
					totalPaid=totalPaid+Float.parseFloat(cPayList.get(i).getcPaidAmt());
				}
				totalDue=Float.parseFloat(cPayList.get(0).getGrandTotal())-totalPaid;
				if(totalDue<0)
				{
					totalDue=Float.parseFloat("0.0");
				}
				System.out.println("paid= "+totalPaid+ " due= "+totalDue);
				cPayDto.setDoc(cPayList.get(0).getDoc());
				cPayDto.setRegcustomerId(cPayList.get(0).getRegcustomerId());
				cPayDto.setGrandTotal(cPayList.get(0).getGrandTotal());
				cPayDto.setTotalPaid(totalPaid+"");
				cPayDto.setTotaldue(totalDue+"");
				listsize=cPayList.size();
				request.setAttribute("cusId", cPayList.get(0).getCustomerId());
				request.setAttribute("gtot", cPayList.get(0).getGrandTotal());
				request.setAttribute("tPaid", totalPaid);
				request.setAttribute("tDue", totalDue);
				request.setAttribute("saleDate", cPayList.get(0).getDoc());
				result=SUCCESS;
			}else{
				listsize=0;
				cPayDto.setGrandTotal("");
				cPayDto.setTotalPaid("");
				cPayDto.setTotaldue("");
				result=SUCCESS;
			}
		} catch (Exception e) {
			System.out.println("ex="+e);
		}
		return result;
	}
	
	public String retreiveCustomerList() {
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		CustomerPaymentDao cdao=dfact.createCustomerPayManager();
		HttpServletRequest request=ServletActionContext.getRequest();
		String customername=request.getParameter("customername");
		try {
			cPayList=cdao.getAllCustomernamesByCustomerNameWithDistinct(customername);
			
//			cPayList = cdao.getCustomerWithDuePay();
			if(cPayList!=null){
				
				request.setAttribute("csize", cPayList.size());
				
				
				retrunResult=SUCCESS;
			}
		} catch (Exception e) {
			retrunResult=ERROR;
			e.printStackTrace();
		}
		return retrunResult;
		
	}

	/*public String saveCustomerPayment() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		String result = ERROR;
		float totalDue = Float.parseFloat(request.getParameter("totaldue"));
		float newAmt=0;
		System.out.println(request.getParameter("pBillno"));
		cPayDto.setBillno(request.getParameter("pBillno"));
		try
		{
		 newAmt = Float.parseFloat(request.getParameter("cPaidAmt"));
		 cPayDto.setcPayMode("Cash");
		}
		catch(Exception e)
		{
			float chechPaidAmt = Float.parseFloat(request.getParameter("chechPaidAmt"));
			newAmt=chechPaidAmt;
			cPayDto.setcPayMode("Cheque");		
		}
		float due = 0;
		if (totalDue > newAmt) {
			due = totalDue - newAmt;
			cPayDto.setcPaidStatus("Partial");
		} else {
			due = 0;
			cPayDto.setcPaidStatus("Paid");
		}
		cPayDto.setDueAmt(due + "");
		cPayDto.setcPaidAmt(newAmt+"");
		cPayDto.setGrandTotal(request.getParameter("grandTotal"));
		cPayDto.setRegcustomerId(request.getParameter("regcustomerId"));
		cPayDto.setDoc(request.getParameter("saleDate"));
		try {
			DaoFactory dfact = new DaoFactory();
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();
			if (cpdao.saveCustomerPayment(cPayDto)) {
				System.out.println("Customer Payment Saved Successfully!.");
				request.setAttribute("Messages", "Customer Payment Saved Successfully!");
				result = SUCCESS;
			} else {

			}

		} catch (Exception e) {
			System.out.println("ex=" + e);
		}
		return result;
	}*/
	
	public String saveCustomerPayment() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		String result = ERROR;
		System.out.println("date= " + cPayDto.getcPayDate());
		System.out.println("cusId= " + cPayDto.getCustomerId());
		String[] billwiseAmt = request.getParameterValues("cPaidAmt[]");
		String[] bill = request.getParameterValues("cBillNo[]");
		System.out.println("bill no: " + billwiseAmt.length);
		System.out.println("bill no: " + bill.length);
		String[] billwiseAmt1 = new String[billwiseAmt.length];
		String[] bill1 = new String[bill.length];
		try {
			DaoFactory dfact = new DaoFactory();
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();

			int k = 0;
			for (int i = 0; i < billwiseAmt.length; i++) {
				System.out.println("billwiseAmt1[i]= "+billwiseAmt[i]);
				System.out.println("bill[i]= "+bill[i]);
				if(billwiseAmt[i].equalsIgnoreCase("")){
						billwiseAmt1[k]="0";
						System.out.println("billwiseAmt1[i]= "+billwiseAmt1[k]);
						bill1[k]=bill[i];
						System.out.println("bill[i]= "+bill1[k]);
				} else {
					billwiseAmt1[k]=billwiseAmt[k];
					bill1[k]=bill[i];
				}
				k++;
			}

			for (int i = 0; i < billwiseAmt.length; i++) {
				if (billwiseAmt1[i] != null) {
					cPayDto.setBillno(bill[i]);
					cPayDto.setcPaidAmt(billwiseAmt[i]);
					if (cpdao.saveCustomerPayment(cPayDto)) {
						System.out
								.println("Customer Payment Saved Successfully!.");
					}
				}
			}
			request.setAttribute("Messages",
					"Customer Payment Saved Successfully!");
			result = SUCCESS;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return result;
	}

	public String allCustomerPaymentDueSatus() {

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
	
	public String customerPaymentBilNo() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String customerId = request.getParameter("customerId");
		String result = ERROR;
		try {
			DaoFactory dfact = new DaoFactory();
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();
			saleList = cpdao.getPaymentBillNoCustomerId(customerId);
			if (saleList != null) {
				
				for(int i=0; i<saleList.size();i++){
					totalDue=totalDue+Double.parseDouble(saleList.get(i).getDueAmt());
				}
				request.setAttribute("totalDue", totalDue);
				result = SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//######################################### Excel Export Whole Customer Due ###################################################
	public String excelWholeCustomerDue() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		String result = ERROR;
		String currentdate=  CurrentDate.getOnlyDateWithMySQLFORMAT();
		try {
			DaoFactory dfact = new DaoFactory();
			CustomerPaymentDao cpdao = dfact.createCustomerPayManager();
//			CompanyMasterDAO ldao=dfact.createCompanyMasterManager();
			
			/*Regeneration of Due Status*/
				cPayList = cpdao.getAllCustomerPaymentDueInfo();
				/*companyDto=ldao.getCurrentCompanyDetails();
				request.setAttribute("companyName", companyDto.getNameofcompany());
				request.setAttribute("companyAddress", companyDto.getAddress());
				request.setAttribute("companyPhone", companyDto.getPhoneno());
				request.setAttribute("companyEmail", companyDto.getEmail());*/
			/*Regeneration of Due Status*/
			
			/* Code For Excel Report*/
		    	String[] header2 = new String[]{"INVOICE/BILL NO", "CUSTOMER NAME", "LAST PAYMENT DATE", "PAID STATUS", "SALE AMOUNT", "PAYMENT AMOUNT","DUE AMOUNT", "DUE DAYS", "SALE DATE"};  
				ExcelExport ee=new ExcelExport();
				List<String> columnNames = new ArrayList<String>();
				List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
				String title="All Customer Payment Due List As on_"+currentdate;
				int k=1;
				for (SalesMasterDto il : cPayList) {
	               Integer i = 0;
	               Map<String, Object> m = new HashMap<String, Object>();
	               
	               m.put((++i).toString(),il.getBillno());
	               m.put((++i).toString(),il.getCustomerName());
	               m.put((++i).toString(),il.getcPayDate());
	               m.put((++i).toString(),il.getcPaidStatus());
	               m.put((++i).toString(),il.getGrandTotal());
	               m.put((++i).toString(),il.getcPaidAmt());
	               m.put((++i).toString(),il.getDueAmt() );
	               m.put((++i).toString(),il.getDateDiff());
	               m.put((++i).toString(),il.getDoc());

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
				response.setHeader("Content-Disposition", "attachment; filename=All_Customer_Due_Report_as_On_"+currentdate+".xls");
				ServletOutputStream out = response.getOutputStream();
				wb.write(out);
				out.flush();
				out.close();
				response.getOutputStream().flush();
				response.getOutputStream().close();
			/* Code For Excel Report*/
				
				result=SUCCESS;
		} catch(IllegalStateException t) {
			System.out.println("IlligelstateExceptionoccur");
			result=SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//######################################### Excel Export Whole Customer Due ###################################################
}
