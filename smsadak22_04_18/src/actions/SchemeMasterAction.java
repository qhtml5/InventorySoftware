package actions;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import util.CurrentDate;
import util.EligibleCustomerNames;
import util.Messages;

import com.opensymphony.xwork2.ActionSupport;

import dTO.CustomerMasterDTO;
import dTO.ItemCategoryTypeMasterDTO;
import dTO.ItemMasterDTO;
import dTO.LoginUserCompanyMasterDto;
import dTO.SalesMasterDto;
import dTO.SchemeMasterDto;
import dao.CustomerMasterDAO;
import dao.DaoFactory;
import dao.ItemMasterAndTypeDAO;
import dao.LoginMasterDAO;
import dao.SalesMasterDao;
import dao.SchemeMasterDao;

public class SchemeMasterAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	SchemeMasterDto schemeDto = new SchemeMasterDto();
	List<SchemeMasterDto> schemeList = new LinkedList<SchemeMasterDto>();

	List<ItemCategoryTypeMasterDTO> itemList = new LinkedList<ItemCategoryTypeMasterDTO>();
	List<CustomerMasterDTO> customerList = new ArrayList<CustomerMasterDTO>();
	List<ItemCategoryTypeMasterDTO> itemList1 = new LinkedList<ItemCategoryTypeMasterDTO>();
	List<CustomerMasterDTO> customerList1 = new ArrayList<CustomerMasterDTO>();
	List<EligibleCustomerNames> eList = new ArrayList<EligibleCustomerNames>();

	public synchronized List<EligibleCustomerNames> geteList() {
		return eList;
	}

	public synchronized void seteList(List<EligibleCustomerNames> eList) {
		this.eList = eList;
	}

	public synchronized List<CustomerMasterDTO> getCustomerList() {
		return customerList;
	}

	public synchronized void setCustomerList(
			List<CustomerMasterDTO> customerList) {
		this.customerList = customerList;
	}

	public SchemeMasterDto getSchemeDto() {
		return schemeDto;
	}

	public void setSchemeDto(SchemeMasterDto schemeDto) {
		this.schemeDto = schemeDto;
	}

	public List<ItemCategoryTypeMasterDTO> getItemList() {
		return itemList;
	}

	public void setItemList(List<ItemCategoryTypeMasterDTO> itemList) {
		this.itemList = itemList;
	}

	public List<SchemeMasterDto> getSchemeList() {
		return schemeList;
	}

	public void setSchemeList(List<SchemeMasterDto> schemeList) {
		this.schemeList = schemeList;
	}

	public static synchronized long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<ItemCategoryTypeMasterDTO> getItemList1() {
		return itemList1;
	}

	public void setItemList1(List<ItemCategoryTypeMasterDTO> itemList1) {
		this.itemList1 = itemList1;
	}

	public List<CustomerMasterDTO> getCustomerList1() {
		return customerList1;
	}

	public void setCustomerList1(List<CustomerMasterDTO> customerList1) {
		this.customerList1 = customerList1;
	}

	@Override
	public String execute() {
		String retrunResult = ERROR;
		schemeDto.setSchemeDoc(CurrentDate.getOnlyDateWithMySQLFORMAT());
		DaoFactory dfact = new DaoFactory();
		ItemMasterAndTypeDAO idao = dfact.createItemMasterManager();
		CustomerMasterDAO cdao = dfact.createCustomerManager();
		try {
			itemList = idao.getAllItemByCompanyId();
			customerList = cdao.ViewANDEditCALLCustomerDetails(0);
			retrunResult = SUCCESS;
		} catch (Exception e) {
			retrunResult = ERROR;
			e.printStackTrace();
		}
		return retrunResult;
	}

	public String chk() {

		return SUCCESS;
	}

	public String checkDupScheme() {
		String result = ERROR;
		HttpServletRequest request = ServletActionContext.getRequest();
		String sName = request.getParameter("schemeName");
		try {
			DaoFactory dfact = new DaoFactory();
			SchemeMasterDao schdao = dfact.createSchemeMasterManager();
			schemeDto = schdao.checkDupScheme(sName);
			if (schemeDto != null) {
				result = SUCCESS;
				request.setAttribute("Msg", "true");

			} else {
				result = ERROR;
				request.setAttribute("Msg", "false");
			}

		} catch (Exception e) {
			System.out.println("ex= " + e);
		}
		return result;
	}

	// ########################################################### Save and Edit
	// for perticular scheme action code start here
	// ##########################################################
	public String saveScheme() {
		String result = ERROR;
		int itemSize;
		int customerSize;
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			DaoFactory dfact = new DaoFactory();
			SchemeMasterDao schdao = dfact.createSchemeMasterManager();
			System.out.println("s name= " + schemeDto.getSchemeName());
			System.out.println("start= " + schemeDto.getSchemeSdate());
			System.out.println("end= " + schemeDto.getSchemeEdate());
			System.out.println("qty= " + schemeDto.getSchemeQty());

			String[] itemIds = request.getParameterValues("checkedId");
			itemSize = itemIds.length;
			for (int i = 0; i < itemIds.length; i++) {
				System.out.println("item= " + itemIds[i]);
			}

			String[] customerIds = request.getParameterValues("customerIds");
			customerSize = customerIds.length;
			for (int i = 0; i < customerIds.length; i++) {
				System.out.println("cutomer= " + customerIds[i]);
			}
			if (schdao.checkschdaoSchemeDuplicateORNOT(schemeDto)) {
				System.out.println("dup existt");
				request.setAttribute("Messages", Messages.Duplicate);
				result = "duplicate";
			} else {
				Boolean saveresult = schdao.saveAndEditScheme(schemeDto,
						itemIds, customerIds, itemSize, customerSize);
				if (saveresult) {
					result = SUCCESS;
					if (schemeDto.getSchemeEditFlag() == 0) {
						request.setAttribute("Messages",
								Messages.SchemeSaveSuccesfully);
					} else if (schemeDto.getSchemeEditFlag() > 0) {
						request.setAttribute("Messages", Messages.Schemeupdate);
					}
				} else {
					request.setAttribute("Messages", Messages.errorSavingSupply);
				}
			}
		} catch (Exception e) {
			System.out.println("An error Occur" + e);
			result = ERROR;
		}
		return result;
	}

	// ########################################################### Save and Edit
	// for perticular scheme action code End here
	// ##########################################################
	public String viewSchemeCall() {
		String result = ERROR;
		try {
			DaoFactory dfact = new DaoFactory();
			SchemeMasterDao schdao = dfact.createSchemeMasterManager();
			schemeList = schdao.getAllSchemes();
			System.out.println("list size= " + schemeList.size());
			result = SUCCESS;
		} catch (Exception e) {
			System.out.println("ex= " + e);
		}
		return result;
	}

	public String showItemNames() {
		String result = ERROR;
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			DaoFactory dfact = new DaoFactory();
			SchemeMasterDao schdao = dfact.createSchemeMasterManager();
			String schemename = request.getParameter("schemename");
			itemList = schdao.getItemNamesBySchemeName(schemename);
			request.setAttribute("schemeName", schemename);
			request.setAttribute("itemcount", itemList.size());
			System.out.println(" item list size= " + itemList.size());
			result = SUCCESS;
		} catch (Exception e) {
			System.out.println("ex= " + e);
		}
		return result;
	}

	public String searchItemsByItemsName() {
		String result = ERROR;
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			DaoFactory dfact = new DaoFactory();
			SchemeMasterDao schdao = dfact.createSchemeMasterManager();
			String itemsnames = request.getParameter("itemsnames");
			itemList = schdao.searchItemNamesByItemsName(itemsnames);
			System.out.println(" item list size= " + itemList.size());
			result = SUCCESS;
		} catch (Exception e) {
			System.out.println("ex= " + e);
		}
		return result;
	}

	public String searchCustomersByCustomerNames() {
		String result = ERROR;
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			DaoFactory dfact = new DaoFactory();
			SchemeMasterDao schdao = dfact.createSchemeMasterManager();
			String customernames = request.getParameter("customernames");
			customerList = schdao.searchCustomersByNames(customernames);
			request.setAttribute("customercount", customerList.size());
			System.out.println(" customer list size= " + customerList.size());
			result = SUCCESS;
		} catch (Exception e) {
			System.out.println("ex= " + e);
		}
		return result;
	}

	public String showCustomerNames() {
		String result = ERROR;
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			DaoFactory dfact = new DaoFactory();
			SchemeMasterDao schdao = dfact.createSchemeMasterManager();
			String schemename = request.getParameter("schemename");
			customerList = schdao.getCustomersNamesBySchemeName(schemename);
			request.setAttribute("schemeName", schemename);
			request.setAttribute("customercount", customerList.size());
			System.out.println(" customer list size= " + customerList.size());
			result = SUCCESS;
		} catch (Exception e) {
			System.out.println("ex= " + e);
		}
		return result;
	}

	public String delSchemeFormCall() {
		String result = SUCCESS;
		HttpServletRequest request = ServletActionContext.getRequest();

		return result;
	}

	public String getAllSchemesBYFROMAndTODATE() {
		String result = ERROR;
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			DaoFactory dfact = new DaoFactory();
			SchemeMasterDao schdao = dfact.createSchemeMasterManager();
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			schemeList = schdao.getAllSchemesBYFROMAndTODATE(fromDate, toDate);

			result = SUCCESS;
		} catch (Exception e) {
			System.out.println("ex= " + e);
		}
		return result;
	}

	public String schemeDelValidation() {
		String result = ERROR;
		HttpServletRequest request = ServletActionContext.getRequest();
		try {
			DaoFactory dfact = new DaoFactory();
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String schemename = request.getParameter("schemename");
			System.out.println("userName--" + userName);
			System.out.println("userName--" + password);
			LoginUserCompanyMasterDto lValidateDetails = new LoginUserCompanyMasterDto();
			LoginMasterDAO ldao = dfact.createLoginManager();
			lValidateDetails.setUserName(userName);
			lValidateDetails.setPassword(password);
			lValidateDetails = ldao.getValidateLoginDetails(lValidateDetails);
			if (lValidateDetails.getUserName() != null
					&& lValidateDetails.getPassword() != null) {

				SchemeMasterDao sdao = dfact.createSchemeMasterManager();
				boolean delResult = sdao.deleteScheme(schemename);
				if (delResult) {
					request.setAttribute("Msg", Messages.Schemedeleted);
					result = SUCCESS;
				}
			} else {
				request.setAttribute("Msg", Messages.inavlidLogin);
			}

		} catch (Exception e) {
			result = ERROR;
			System.out.println("ex= " + e);
		}
		return result;
	}

	public String getSchemeDetailsForEdit() {
		String result = ERROR;
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println("sname= " + request.getParameter("schemeName"));

		DaoFactory dfact = new DaoFactory();
		SchemeMasterDao schdao = dfact.createSchemeMasterManager();
		ItemMasterAndTypeDAO idao = dfact.createItemMasterManager();
		CustomerMasterDAO cdao = dfact.createCustomerManager();

		try {
			schemeDto = schdao.getSchemeDetailsBySchemeName(request
					.getParameter("schemeName"));
			itemList = idao.getAllItemByCompanyId();
			customerList = cdao.ViewANDEditCALLCustomerDetails(0);
			itemList1 = schdao.getItemNamesBySchemeName(request
					.getParameter("schemeName"));
			customerList1 = schdao.getCustomersNamesBySchemeName(request
					.getParameter("schemeName"));

			request.setAttribute("cusSize", customerList1.size());
			request.setAttribute("itemSize", itemList1.size());

			result = SUCCESS;

		} catch (Exception e) {
			System.out.println("ex= " + e);
		}

		return result;
	}

	public String viewEligibleCustomerCall() {

		DaoFactory dfact = new DaoFactory();
		SchemeMasterDao schdao = dfact.createSchemeMasterManager();
		try {
			schemeList = schdao.getAllSchemes();

		} catch (Exception e) {
			System.out.println("ex= " + e);

		}

		return SUCCESS;
	}

	public String fetchEligibleCustomerList() {
		System.out.println("Called sucessfully");
		DaoFactory dfact = new DaoFactory();
		HttpServletRequest request = ServletActionContext.getRequest();
		String schemename = request.getParameter("schemeName");
		List<SalesMasterDto> saleList = new ArrayList<SalesMasterDto>();
		SalesMasterDao sdao = dfact.createSalesMasterManager();
		SchemeMasterDao schdao = dfact.createSchemeMasterManager();
		try {
			eList = sdao.retriveEligibleCustomer(schemename);
			schemeDto = schdao.getSchemeDetailsBySchemeName(schemename);
			if (eList.size() > 0) {
				for (int i = 0; i < eList.size(); i++) {
					System.out.println("eligible customers are : "
							+ eList.get(i).getCustomerNames());
				}
			}
		} catch (Exception e) {
			System.out.println("ex= " + e);

		}

		return SUCCESS;
	}

	public String fetchEligibleproductsList() {
		try {
			System.out.println("Called sucessfully");
			DaoFactory dfact = new DaoFactory();
			HttpServletRequest request = ServletActionContext.getRequest();
			
			String schemename = request.getParameter("schemeName");
			String customername = request.getParameter("customername");
			String sdate = request.getParameter("sdate");
			String edate = request.getParameter("edate");
			
			SalesMasterDao saledao = dfact.createSalesMasterManager();
			eList = saledao.calculateEligiblityWithSchemeQuantity(customername,schemename, sdate, edate);
			
			request.setAttribute("totalQuantitySold", eList.get(0).getTotalQuantitySold());
			request.setAttribute("customername", customername);
			request.setAttribute("schemeQty",eList.get(0).getSchemeQty());
			System.out.println(eList.size());

		} catch (Exception e) {
			System.out.println("ex= " + e);
		}

		return SUCCESS;

	}

}
