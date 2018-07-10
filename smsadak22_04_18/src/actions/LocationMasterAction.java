package actions;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import util.Messages;

import com.opensymphony.xwork2.ActionSupport;

import dTO.LocationMasterDto;
import dao.DaoFactory;
import dao.ItemMasterAndTypeDAO;
import dao.LocationMasterDao;

public class LocationMasterAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	LocationMasterDto locDto=new LocationMasterDto();
	List<LocationMasterDto> locList=new LinkedList<LocationMasterDto>();
	public LocationMasterDto getLocDto() {
		return locDto;
	}
	public void setLocDto(LocationMasterDto locDto) {
		this.locDto = locDto;
	}
	
	public List<LocationMasterDto> getLocList() {
		return locList;
	}
	public void setLocList(List<LocationMasterDto> locList) {
		this.locList = locList;
	}
	@Override
	public String execute(){
		return SUCCESS;
	}
	
	
	public String addWareHouse()
	{
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		System.out.println("name= "+locDto.getLocationName());
		System.out.println("addr= "+locDto.getLocationAddress());
		System.out.println("desc= "+locDto.getLocationDescription());
		try
		{
			DaoFactory dfact =new DaoFactory();
			LocationMasterDao locdao=dfact.CreateLocatiobManager();
			
			if(locdao.checkLocationDuplicateORNOT(locDto)){
				System.out.println("dup existt");
				result="duplicate";
				request.setAttribute("Messages", Messages.Duplicate);
			} else{
						Boolean saveresult=locdao.addWareHouse(locDto);
						if(saveresult)
						{
							result=SUCCESS;
							request.setAttribute("Messages", Messages.LocationSaveSuccesfully);
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
	
	public String getLocations()
	{
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		LocationMasterDao locdao=dfact.CreateLocatiobManager();
	
		try {
			locList=locdao.getAllLocationsByCompanyId();
			if(locList!=null){
				retrunResult=SUCCESS;
			}
		} catch (Exception e) {
			retrunResult=ERROR;
			e.printStackTrace();
		}
		return retrunResult;
	}
	
	public String getLocationById()
	{
		String retrunResult=ERROR;
		DaoFactory dfact =new DaoFactory();
		LocationMasterDao locdao=dfact.CreateLocatiobManager();
		HttpServletRequest request=ServletActionContext.getRequest();
		String locid=(String)request.getParameter("locId");
		locid=locid.trim();
		try {
			locDto=locdao.getLocationByCompanyIdLocId(Integer.parseInt(locid));
			retrunResult=SUCCESS;
		} catch (Exception e) {
			retrunResult=ERROR;
			e.printStackTrace();
		}
		return retrunResult;
	}
	
	public String editLocationById()
	{
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		System.out.println("name= "+locDto.getLocationName());
		System.out.println("addr= "+locDto.getLocationAddress());
		System.out.println("desc= "+locDto.getLocationDescription());
		try
		{
		DaoFactory dfact =new DaoFactory();
		LocationMasterDao locdao=dfact.CreateLocatiobManager();
		Boolean saveresult=locdao.editLocationnDetailsById(locDto);
		if(saveresult)
		{
			result=SUCCESS;
			request.setAttribute("Messages", Messages.UpdateLocSuccessfully);
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
}
