package actions;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import util.Messages;
import com.opensymphony.xwork2.ActionSupport;
import dao.DaoException;
import dao.DaoFactory;
import dao.ItemMasterAndTypeDAO;
import dao.LoginMasterDAO;
import dao.CompanyMasterDAO;
import dTO.ItemMasterDTO;
import dTO.ItemCategoryTypeMasterDTO;
import dTO.SupplierMasterDTO;
import dao.SupplierMasterDAO;

public class SupplierMasterAction extends ActionSupport {
	
private static final long serialVersionUID = 1L;
protected static final Log log = LogFactory.getLog(ItemMasterAction.class);
SupplierMasterDTO sDTO=new SupplierMasterDTO();
List<SupplierMasterDTO> sDTOList=new ArrayList<SupplierMasterDTO>();
public synchronized SupplierMasterDTO getsDTO() {
	return sDTO;
}
public synchronized void setsDTO(SupplierMasterDTO sDTO) {
	this.sDTO = sDTO;
}
public synchronized List<SupplierMasterDTO> getsDTOList() {
	return sDTOList;
}
public synchronized void setsDTOList(List<SupplierMasterDTO> sDTOList) {
	this.sDTOList = sDTOList;
}
public static synchronized Log getLog() {
	return log;
}
@Override
public String execute()
{	
return SUCCESS;
}
public String saveSupplierDetails()
{
	
	String result=ERROR;
	HttpServletRequest request=ServletActionContext.getRequest();
	try
	{
			DaoFactory dfact =new DaoFactory();
			SupplierMasterDAO sdao=dfact.CreateSupplierManager();
			if(sdao.checkSupplierDuplicateORNOT(sDTO)){
				System.out.println("dup existt");
				result="duplicate";
				request.setAttribute("Messages", Messages.Duplicate);
			}
			else{
				Boolean saveresult=sdao.saveSupplierDetails(sDTO);
				if(saveresult)
				{
					result=SUCCESS;
					request.setAttribute("Messages", Messages.SupplierSaveSuccesfully);
				}
				else
				{
					request.setAttribute("Messages", Messages.errorSavingSupply);
				}
			}
	}
	catch(Exception e)
	{
		System.out.println("An error Occur" + e);
	}
	return result;
}

public String viewSupplierList()
{
	String result=SUCCESS;
	try
	{
	DaoFactory dfact =new DaoFactory();
	SupplierMasterDAO sdao=dfact.CreateSupplierManager();
	sDTOList=sdao.getAllSupplierDetails();
	}
	catch(Exception e)
	{
		System.out.println("An error Occur" + e);
	}
	return result;
}

public String editSupplierCall()
{
	String result=SUCCESS;
	try
	{
	DaoFactory dfact =new DaoFactory();
	SupplierMasterDAO sdao=dfact.CreateSupplierManager();
	HttpServletRequest request=ServletActionContext.getRequest();
	String id=request.getParameter("SupplierId");
    System.out.println("Id found ..." +id);
    id=id.trim();
    sDTO=sdao.getSupplierDetailsById(Integer.parseInt(id));
	}
	catch(Exception e)
	{
		System.out.println("An error Occur" + e);
	}
	return result;
}

public String updateSupplierMasterBySID()
{
	String result=ERROR;
	try
	{
	DaoFactory dfact =new DaoFactory();
	SupplierMasterDAO sdao=dfact.CreateSupplierManager();
	HttpServletRequest request=ServletActionContext.getRequest();
    boolean resultUpdate=sdao.UpdateSupplierDetails(sDTO);
    if(resultUpdate)
    {
    	request.setAttribute("Messages", Messages.UpdatesupplierSuccessfully);
    	result=SUCCESS;
    }
    else
    {
    	request.setAttribute("Messages", Messages.errorSavingSupply);
    }
	}
	catch(Exception e)
	{
		System.out.println("An error Occur" + e);
	}
	return result;
}

public String delSupplier()
{
	int cid=0;
	String result=ERROR;
	HttpServletRequest request=ServletActionContext.getRequest();
	try
	{
		DaoFactory dfact =new DaoFactory();
		SupplierMasterDAO sdao = dfact.CreateSupplierManager();
		String id=request.getParameter("SupplierId");
	    System.out.println("Id found ..." +id);
	    cid= Integer.parseInt(id.trim());

	    if(sdao.deleteSupplierById(cid))
		{   result=SUCCESS;
			request.setAttribute("Messages", "<p style='color:green;'>Supplier Deleted Successfully</p>");
		}
		else
		{
			result=ERROR;
			request.setAttribute("Messages", "<p style='color:red;'>Error Deleteing Supplier!</p>");
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
