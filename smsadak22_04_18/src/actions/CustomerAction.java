package actions;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import util.Messages;
import com.opensymphony.xwork2.ActionSupport;
import  dTO.CustomerMasterDTO;
import dao.DaoFactory;
import dao.CustomerMasterDAO;
import freemarker.template.utility.Execute;

public class CustomerAction  extends ActionSupport{

private static final long serialVersionUID = 1L;
protected static final Log log = LogFactory.getLog(CustomerAction.class);
CustomerMasterDTO cDTO=new CustomerMasterDTO();
List<CustomerMasterDTO> cList=new ArrayList<CustomerMasterDTO>();
public synchronized CustomerMasterDTO getcDTO() {
	return cDTO;
}
public synchronized void setcDTO(CustomerMasterDTO cDTO) {
	this.cDTO = cDTO;
}
public synchronized List<CustomerMasterDTO> getcList() {
	return cList;
}
public synchronized void setcList(List<CustomerMasterDTO> cList) {
	this.cList = cList;
}
public static synchronized Log getLog() {
	return log;
}
@Override
public String execute()
{
	return SUCCESS;
}

//##################################################### Customer Save and Edit in single method . Action config -- Satrt here #############################################


public String saveCustomerDetails()
{
	String result=ERROR;
	HttpServletRequest request=ServletActionContext.getRequest();
	try
	{
	DaoFactory dfact =new DaoFactory();
	CustomerMasterDAO cdao=dfact.createCustomerManager();
	if(cdao.checkCustomerDuplicateORNOT(cDTO)){
		
		if(!cDTO.getCustomerId().equals(""))
		{
			cDTO.setCustomerType("REGULAR");
			Boolean saveresult=cdao.saveCustomerDetails(cDTO);
			if(saveresult)
			{   result=SUCCESS;
				request.setAttribute("Messages", Messages.getCustomerSaveSuccesfully());
			}
			else
			{request.setAttribute("Messages", Messages.errorSavingSupply);}	
		}
		else
		{
			System.out.println("dup existt");
			request.setAttribute("Messages", Messages.Duplicate);
			result="duplicate";	
		}
		
		
		
	}
	else{
			cDTO.setCustomerType("REGULAR");
			Boolean saveresult=cdao.saveCustomerDetails(cDTO);
			if(saveresult)
			{   result=SUCCESS;
				request.setAttribute("Messages", Messages.getCustomerSaveSuccesfully());
			}
			else
			{request.setAttribute("Messages", Messages.errorSavingSupply);}
	}
	}
	catch(Exception e)
	{
		System.out.println("An error Occur" + e);
	}
	return result;
}

//##################################################### Customer Save and Edit in single . Action config -- End here #############################################

//##################################################### Customer List display and Edit page call display in single method. Action config -- Satrt here ###########
public String viewlistAndEditCall()
{
	int cid=0;
	String result="listPage";
	int flagCheckEdit=0;
	HttpServletRequest request=ServletActionContext.getRequest();
	try
	{
	DaoFactory dfact =new DaoFactory();
	CustomerMasterDAO cdao=dfact.createCustomerManager();
	String id=request.getParameter("customerId");
    System.out.println("Id found ..." +id);
    int ids= Integer.parseInt(id.trim());
    if(ids>0)
    {
    	cid=Integer.parseInt(id.trim());
    	result="editPage";
    	flagCheckEdit=1;
    }
    System.out.println("customerId found" +cid );
    cList=cdao.ViewANDEditCALLCustomerDetails(cid);
    System.out.println("Size of List "+cList.size());
    if(flagCheckEdit>0)
    {
    	cDTO.setCustomerId(cList.get(0).getCustomerId());
		cDTO.setcName(cList.get(0).getcName());
		cDTO.setPhoneno(cList.get(0).getPhoneno());
		cDTO.setAddress(cList.get(0).getAddress());
		cDTO.setState(cList.get(0).getState());
		cDTO.setPincode(cList.get(0).getPincode());
		cDTO.setFax(cList.get(0).getFax());
		cDTO.setVat(cList.get(0).getVat());
		cDTO.setType(cList.get(0).getType());
		cDTO.setNote(cList.get(0).getNote());
		cDTO.setDateofcreate(cList.get(0).getDateofcreate());
		cDTO.setCompanyid(cList.get(0).getCompanyid());
		cDTO.setUserid(cList.get(0).getUserid());
		cDTO.setCompanyName(cList.get(0).getCompanyName());
		cDTO.setUserName(cList.get(0).getUserName());
		cDTO.setRemarks(cList.get(0).getRemarks());
		cDTO.setMobile(cList.get(0).getMobile());
		cDTO.setEmail(cList.get(0).getEmail());
		cDTO.setCustomerBarcode(cList.get(0).getCustomerBarcode());
		cDTO.setCustomerBarcodeUrl(cList.get(0).getCustomerBarcodeUrl());
		cDTO.setCustomerType(cList.get(0).getCustomerType());
		cDTO.setGsttin(cList.get(0).getGsttin());
		cDTO.setStcode(cList.get(0).getStcode());
		
		System.out.println("customer name"+cDTO.getcName());
    }
	}
	catch(Exception e)
	{
		System.out.println("An error Occur" + e);
		request.setAttribute("Messages", Messages.Error);
	}
	return result;
}
//##################################################### Customer List display and Edit page call display in single method. Action config -- End here #############

public String delCustomer()
{
	int cid=0;
	String result=ERROR;
	HttpServletRequest request=ServletActionContext.getRequest();
	try
	{
		DaoFactory dfact =new DaoFactory();
		CustomerMasterDAO cdao=dfact.createCustomerManager();
		String id=request.getParameter("customerId");
	    System.out.println("Id found ..." +id);
	    cid= Integer.parseInt(id.trim());

	    if(cdao.deleteCustomerById(cid))
		{   result=SUCCESS;
			request.setAttribute("Messages", "<p style='color:green;'>Customer Deleted Successfully</p>");
		}
		else
		{
			result=ERROR;
			request.setAttribute("Messages", "<p style='color:red;'>Error Deleteing Customer!</p>");
		}
    
	}
	catch(Exception e)
	{
		System.out.println("An error Occur" + e);
		request.setAttribute("Messages", Messages.Error);
	}
	return result;
}




}
