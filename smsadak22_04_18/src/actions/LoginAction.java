package actions;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.StackedBarRenderer;
import org.jfree.chart.renderer.category.StandardBarPainter;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.RectangleInsets;
import org.jfree.ui.TextAnchor;

import util.FinancialYear;

import com.itextpdf.awt.geom.misc.Messages;
import com.opensymphony.xwork2.ActionSupport;

import dao.ConnectCore;
import dao.CustomerMasterDAO;
import dao.DaoException;
import dao.DaoFactory;
import dao.ItemMasterAndTypeDAO;
import dao.LoginMasterDAO;
import dao.CompanyMasterDAO;
import dao.SalesMasterDao;
import dao.StockMasterDAO;
import dao.SupplierMasterDAO;


import dTO.CustomerMasterDTO;
import dTO.LoginUserCompanyMasterDto;
import dTO.OpenigAndClosingStockDTO;
import dTO.SalesMasterDto;
import dTO.StockMasterDTO;
import dTO.SupplierMasterDTO;

public class LoginAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	protected static final Log log = LogFactory.getLog(LoginAction.class);
	LoginUserCompanyMasterDto loginobj=new LoginUserCompanyMasterDto();
	List<LoginUserCompanyMasterDto> companyList=new LinkedList<LoginUserCompanyMasterDto>();
	boolean loginnotfound=false;
	List<StockMasterDTO> stockDTOList=new ArrayList<StockMasterDTO>();
	List<StockMasterDTO> previousYearstockDTOList=new ArrayList<StockMasterDTO>();
	List<SupplierMasterDTO> supList =new ArrayList<SupplierMasterDTO>();
	List<CustomerMasterDTO> cList=new ArrayList<CustomerMasterDTO>();
	List<SalesMasterDto> saleList=new ArrayList<SalesMasterDto>();
	LoginUserCompanyMasterDto lValidateDetails=new LoginUserCompanyMasterDto();
	List<OpenigAndClosingStockDTO> openingClosingList=new ArrayList<OpenigAndClosingStockDTO>();
	
	public synchronized List<OpenigAndClosingStockDTO> getOpeningClosingList() {
		return openingClosingList;
	}
	public synchronized void setOpeningClosingList(
			List<OpenigAndClosingStockDTO> openingClosingList) {
		this.openingClosingList = openingClosingList;
	}
	public synchronized List<StockMasterDTO> getPreviousYearstockDTOList() {
		return previousYearstockDTOList;
	}
	public synchronized void setPreviousYearstockDTOList(
			List<StockMasterDTO> previousYearstockDTOList) {
		this.previousYearstockDTOList = previousYearstockDTOList;
	}

	private List<FinancialYear> YearRange=new ArrayList<FinancialYear>();
	FinancialYear fYearDto=new FinancialYear();
	
	public synchronized LoginUserCompanyMasterDto getlValidateDetails() {
		return lValidateDetails;
	}
	public synchronized void setlValidateDetails(
			LoginUserCompanyMasterDto lValidateDetails) {
		this.lValidateDetails = lValidateDetails;
	}
	public synchronized List<SalesMasterDto> getSaleList() {
		return saleList;
	}
	public synchronized void setSaleList(List<SalesMasterDto> saleList) {
		this.saleList = saleList;
	}
	public static synchronized long getSerialversionuid() {
		return serialVersionUID;
	}
	public static synchronized Log getLog() {
		return log;
	}
	public synchronized LoginUserCompanyMasterDto getLoginobj() {
		return loginobj;
	}
	public synchronized void setLoginobj(LoginUserCompanyMasterDto loginobj) {
		this.loginobj = loginobj;
	}
	public List<LoginUserCompanyMasterDto> getCompanyList() {
		return companyList;
	}
	public void setCompanyList(List<LoginUserCompanyMasterDto> companyList) {
		this.companyList = companyList;
	}
	public synchronized boolean isLoginnotfound() {
		return loginnotfound;
	}
	public synchronized void setLoginnotfound(boolean loginnotfound) {
		this.loginnotfound = loginnotfound;
	}
	public synchronized List<StockMasterDTO> getStockDTOList() {
		return stockDTOList;
	}
	public synchronized void setStockDTOList(List<StockMasterDTO> stockDTOList) {
		this.stockDTOList = stockDTOList;
	}
	public synchronized List<SupplierMasterDTO> getSupList() {
		return supList;
	}
	public synchronized void setSupList(List<SupplierMasterDTO> supList) {
		this.supList = supList;
	}
	public synchronized List<CustomerMasterDTO> getcList() {
		return cList;
	}
	public synchronized void setcList(List<CustomerMasterDTO> cList) {
		this.cList = cList;
	}
	public List<FinancialYear> getYearRange() {
		return YearRange;
	}
	public void setYearRange(List<FinancialYear> yearRange) {
		YearRange = yearRange;
	}
	
	public FinancialYear getfYearDto() {
		return fYearDto;
	}
	public void setfYearDto(FinancialYear fYearDto) {
		this.fYearDto = fYearDto;
	}
	//########################################### Login Action Code for validating user start here ############################################################
		@Override
		public String execute()
		{
			return SUCCESS;
		}
		
		public String submitLoginDetails() throws SQLException
		   {
			 Connection con=null; 
			
           String returnResult=ERROR;
		   DaoFactory dfact=new DaoFactory();
		   LoginMasterDAO lDao=dfact.createLoginManager();
		   StockMasterDAO sdao=dfact.createStockManager();
		   SupplierMasterDAO supdao=dfact.CreateSupplierManager();
		   CustomerMasterDAO cdao=dfact.createCustomerManager();
		   SalesMasterDao saleDao=dfact.createSalesMasterManager();
		   ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		   String fromdateYear="";
		   String todateYear="";
			 
			HttpServletRequest request=ServletActionContext.getRequest();
		    loginobj.setUserName(request.getParameter("usernames"));
			loginobj.setPassword(request.getParameter("password"));
			loginobj.setCompanyId(request.getParameter("companyId"));
			loginobj.setYearRange(request.getParameter("fYearDto.fYear")); 
			
			HttpSession session = request.getSession();
			
//			loginobj.setUserName("admin");
//			loginobj.setPassword("admin");
//			loginobj.setCompanyId("1");
//			loginobj.setYearRange("2014-2015");
			
			
			//-------------------------------- Current Financial year From date and To date creating codes start here ------------------------------
			 String Str = new String(request.getParameter("fYearDto.fYear"));
			 String fromdate=Str.substring(0,4)+"-04-"+"01";
			 String todate=Str.substring(5,9)+"-03-"+"31";
			 System.out.println("#######################################################");
			 System.out.println("Fromdate created: "+fromdate);
			 System.out.println("todate created: "+todate);
			 System.out.println("#######################################################");
			//-------------------------------- Current Financial year From date and To date creating codes start here ------------------------------
			 
			//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			//-------------------------------- Previous Financial year From date and To date retrieving codes start here ------------------------------
			//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 String lfromdate=Str.substring(0,4);
			 String ltodate=Str.substring(5,9);
			 session.setAttribute("curFyear", lfromdate);
			 session.setAttribute("curToyear",ltodate);
			 
			 int k=Integer.parseInt(lfromdate);
			 fromdateYear=k+"";
			 fromdateYear=fromdateYear.trim();
			 k=k-1;
			 lfromdate=k+"";
			 int l=Integer.parseInt(ltodate);
			 todateYear=l+"";
			 todateYear=todateYear.trim();
			 l=l-1;
			 String previousFinancialyear=k+"-"+l;
			 ltodate=l+"";
			 lfromdate=lfromdate+"-04-"+"01";
			 ltodate=ltodate+"-03-"+"31";
			 openingClosingList=sdao.getAllOpeningStock(previousFinancialyear);
			 if(openingClosingList.size()<1)
			 {
			  boolean saveresult=false;
		      previousYearstockDTOList=sdao.getAllStockDetailsforclosingStockMaster();
		      
		      sdao.truncateopeningclosingstockmaster();
		      
		      for(int j=0;j<previousYearstockDTOList.size();j++)
		      {
		      OpenigAndClosingStockDTO dto=new   OpenigAndClosingStockDTO();
		      dto.setStockId(previousYearstockDTOList.get(j).getStockid());
		      dto.setFinancialYear(previousFinancialyear);
		      dto.setItemIds(previousYearstockDTOList.get(j).getItemIds());
		      dto.setQty(previousYearstockDTOList.get(j).getQty());
		      dto.setStockManupulation(previousYearstockDTOList.get(j).getQty());
		      dto.setRemarks("NA");
		      dto.setCompanyId(previousYearstockDTOList.get(j).getCompanyId());
		      dto.setUserId(previousYearstockDTOList.get(j).getUserId());
		      saveresult=sdao.saveOpeningClosingStock(dto,fromdateYear,todateYear);
		      }
		     if(saveresult)
		     {
		    	 request.setAttribute("message", 
		    	"<br/><b style='color:blue' >Closing Stock of Previous Financial year : "+previousFinancialyear+" is created.<br/>" +
		    	"Click the following link to view your previous year closing Stock <br/>" +
		    	"<a href='closingstockcall.action'> View Closing Stock</a></b> <br/><br/><br/>");
		     }
			 }
		
			//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
			//-------------------------------- Previous Financial year From date and To date retrieving codes End here ------------------------------
			//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
		
			try{
					con=ConnectCore.getConnection();
					lValidateDetails=lDao.getValidateLoginDetails(loginobj);
					if(lValidateDetails.getUserName()!=null && lValidateDetails.getPassword()!=null)
					{
						if(lValidateDetails.getRoleStatus().equals("ADMIN"))
						{
							 session.setAttribute("roleStatus", lValidateDetails.getRoleStatus());
						     session.setAttribute("login", lValidateDetails.getUserName());
						     session.setAttribute("password", lValidateDetails.getPassword());
						     session.setAttribute("photoUrl", lValidateDetails.getUserUrl());
						     session.setAttribute("userId", lValidateDetails.getUserId());
						     session.setAttribute("companyId", lValidateDetails.getCompanyId());
						     session.setAttribute("companyName", lValidateDetails.getNameofcompany());
						     session.setAttribute("userName", lValidateDetails.getUserName());
						     session.setAttribute("fYear", request.getParameter("fYearDto.fYear"));
						     session.setAttribute("FYFromdate", fromdate);
						     session.setAttribute("FYTodate", todate);
						     session.setAttribute("lastfinancialyears", previousFinancialyear);
						     
						    
					//################################## Total Size display on dash board: Start ######################################################
						     stockDTOList=sdao.getAllPurchaseDetails();
						     supList=supdao.getAllSupplierDetails();
						     cList=cdao.ViewANDEditCALLCustomerDetails(0);
						     session.setAttribute("totalstock", stockDTOList.size());
						     session.setAttribute("totalsupplier", supList.size());
						     session.setAttribute("totalcustomer", cList.size());
						     session.setAttribute("itemSize", idao.getSizeofTotalItems());
						     session.setAttribute("saleSize", saleDao.getSizeofTotalSales());
						     session.setAttribute("totaluser", lDao.getSizeofTotalUsers());
					//################################## Total Size display on dash board: End ######################################################
						     session.removeAttribute("loginStatus");
						     System.out.println(session.getAttribute("login"));
						     System.out.println(session.getAttribute("roleStatus"));
						     System.out.println("Role Status found : "+lValidateDetails.getRoleStatus());
						     returnResult="adminPage";
						}
						else if(lValidateDetails.getRoleStatus().equals("USER"))
						{
							session.setAttribute("roleStatus", lValidateDetails.getRoleStatus());
					        session.setAttribute("login", lValidateDetails.getUserName());
					        session.setAttribute("password", lValidateDetails.getPassword());
					        session.setAttribute("photoUrl", lValidateDetails.getUserUrl());
					        session.setAttribute("userId", lValidateDetails.getUserId());
					        session.setAttribute("companyId", lValidateDetails.getCompanyId());
						    session.setAttribute("companyName", lValidateDetails.getNameofcompany());
						    session.setAttribute("userName", lValidateDetails.getUserName());
						    session.setAttribute("fYear", request.getParameter("fYearDto.fYear"));
					        session.removeAttribute("loginStatus");
					        session.setAttribute("FYFromdate", fromdate);
						    session.setAttribute("FYTodate", todate);
						    returnResult="normalUser";
						    session.setAttribute("lastfinancialyears", previousFinancialyear);
						  }
					}
					else{
							loginnotfound=true;
							request.setAttribute("loginStatus", "invalidLogin");
							String result=callLogin();
							if(result.equalsIgnoreCase("success")){
								returnResult="signInpage";
							}else{
								returnResult="signInpage";
							}
					}
					
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------					
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ BAR CHART OF MONTHLY SALE CODES Start here +++++++++++++++++++++++++++++++++++++++++++++++++++					
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
															
															  final String PRODUCTS = "PRODUCTS";
														   
														      final String JAN = "JAN";
														      final String FEB = "FEB";
														      final String MAR = "MAR";
														      final String APR = "APR";
														      final String MAY = "MAY";
														      final String JUN = "JUN";
														      final String JUL = "JUL";
														      final String AUG = "AUG";
														      final String SEP = "SEP";
														      final String OCT = "OCT";
														      final String NOV = "NOV";
														      final String DEC=  "DEC";
														      
														      final DefaultCategoryDataset dataset = new DefaultCategoryDataset( );

														      dataset.addValue( saleDao.getMonthlySaleReportOFAPR() , PRODUCTS , APR );
														      dataset.addValue( saleDao.getMonthlySaleReportOFMAY() , PRODUCTS , MAY );
														      dataset.addValue( saleDao.getMonthlySaleReportOFJUN() , PRODUCTS , JUN );
														      dataset.addValue( saleDao.getMonthlySaleReportOFJUL() , PRODUCTS, JUL );
														      dataset.addValue( saleDao.getMonthlySaleReportOFAUG(),  PRODUCTS , AUG);
														      dataset.addValue( saleDao.getMonthlySaleReportOFSEP() , PRODUCTS, SEP );
														      dataset.addValue( saleDao.getMonthlySaleReportOFOCT() , PRODUCTS, OCT );
														      dataset.addValue( saleDao.getMonthlySaleReportOFNOV() , PRODUCTS, NOV );
														      dataset.addValue( saleDao.getMonthlySaleReportOFDEC() , PRODUCTS, DEC );
														      dataset.addValue( saleDao.getMonthlySaleReportOFJAN() , PRODUCTS , JAN );
														      dataset.addValue( saleDao.getMonthlySaleReportOFFEB(),  PRODUCTS, FEB );
														      dataset.addValue( saleDao.getMonthlySaleReportOFMAR(),  PRODUCTS , MAR );

														      CategoryAxis categoryAxis = new CategoryAxis("MONTHS");
														      categoryAxis.setLowerMargin(.01);
														      categoryAxis.setCategoryMargin(.01);
														      categoryAxis.setUpperMargin(.01);      
														      categoryAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_90);
														      
														      ValueAxis valueAxis = new NumberAxis("SALE AMOUNTS");
														      StackedBarRenderer renderer = new StackedBarRenderer();
														      renderer.setBarPainter(new StandardBarPainter());
														      renderer.setDrawBarOutline(false);
														      renderer.setShadowVisible(false);
														      renderer.setBaseItemLabelsVisible(true);
														      renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BOTTOM_CENTER));
														      renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
												
														      CategoryPlot plot = new CategoryPlot( dataset,categoryAxis,valueAxis,renderer);
														      plot.setOrientation(PlotOrientation.VERTICAL);
														      JFreeChart chart = new JFreeChart( "MONTHLY SALE CHART OF FINANCIAL YEAR "+request.getParameter("fYearDto.fYear"),
											                  JFreeChart.DEFAULT_TITLE_FONT,plot,true);
														      JFreeChart barChart =chart;

														      barChart.setPadding(new RectangleInsets(10, 20, 20, 5));
														      
														      int width = 640; /* Width of the image */
														      int height = 480; /* Height of the image */ 
														      String path=request.getServletContext().getRealPath("/img/BarChart.jpeg");
														      File BarChart = new File( path ); 
														      ChartUtilities.saveChartAsJPEG( BarChart , barChart , width , height );
														      

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------					
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ BAR CHART OF MONTHLY SALE CODES End here +++++++++++++++++++++++++++++++++++++++++++++++					
//-------------------------------------------------------
										
					
					
				}
				catch(Exception e){System.out.println("An exeption occur"+e);}
				finally
				{
					if(con!=null)
					{
						con.close();
						System.out.println("connection closed.");
					}
				}
				return returnResult;
		}
		//########################################### Login Action Code for validating user End here #######################################################################
		
		//########################################### LogOut Action Code for logged out from website start here ############################################################	
		public String logoutDetails() throws SQLException
		{String result="";
		Connection con=null;
		try
		{
	     con=ConnectCore.getConnection();
	     HttpServletRequest request=ServletActionContext.getRequest();
		 HttpSession session = request.getSession();
		 request.setAttribute("loginStatus", "logout");
		 session.removeAttribute("roleStatus");
		 session.removeAttribute("login");
		 session.removeAttribute("password");
		 session.removeAttribute("photoUrl");
		 session.removeAttribute("companyId");
		 session.removeAttribute("companyName");
		 session.removeAttribute("userId");
		 session.removeAttribute("userName");
		 session.removeAttribute("FYFromdate");
		 session.removeAttribute("FYTodate");
		 session.removeAttribute("fYear");
		 session.removeAttribute("lastfinancialyears");
		 
		 session.invalidate();
		 result=callLogin();
		 if(!result.equalsIgnoreCase("success")){
				result="success";
		}
		}
		catch(Exception e)
		{
			System.out.println("Exception occur"+e);
		}
		finally
		{
			if(con!=null)
			{
				con.close();
			}
		}
			return result;
		}
		//########################################### LogOut Action Code for logged out from website End here ############################################################

	public String adminIndexCall()
	{
		String Result=SUCCESS;
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		DaoFactory dfact=new DaoFactory();
		StockMasterDAO sdao=dfact.createStockManager();
		SupplierMasterDAO supdao=dfact.CreateSupplierManager();
		CustomerMasterDAO cdao=dfact.createCustomerManager();
		SalesMasterDao saleDao=dfact.createSalesMasterManager();
		ItemMasterAndTypeDAO idao=dfact.createItemMasterManager();
		LoginMasterDAO lDao=dfact.createLoginManager();
		try{
			//################################## Total Size display on dash board: Start ######################################################
			     stockDTOList=sdao.getAllStockDetails();
			     supList=supdao.getAllSupplierDetails();
			     cList=cdao.ViewANDEditCALLCustomerDetails(0);
			     session.removeAttribute("totalstock");
			     session.removeAttribute("totalsupplier");
			     session.removeAttribute("totalcustomer");
			     session.removeAttribute("saleSize");
			     session.removeAttribute("itemSize");
			     session.setAttribute("itemSize", idao.getSizeofTotalItems());
			     session.setAttribute("saleSize", saleDao.getSizeofTotalSales());
			     session.setAttribute("totalstock", stockDTOList.size());
			     session.setAttribute("totalsupplier", supList.size());
			     session.setAttribute("totalcustomer", cList.size());
			     session.setAttribute("totaluser", lDao.getSizeofTotalUsers());
		     //################################## Total Size display on dash board: End ######################################################
			     loginobj.setUserName((String)session.getAttribute("login"));
				 loginobj.setPassword((String)session.getAttribute("password"));
				 loginobj.setCompanyId((String)session.getAttribute("companyId"));
				 lValidateDetails=lDao.getValidateLoginDetails(loginobj);
                 if(lValidateDetails.getUserId()!="" && stockDTOList.size()>0 && supList.size()>0  )
				 {
					 System.out.println("Connection successfully Re- Initialized.");
					 request.setAttribute("messages", "<b> Connection Reset.</b> ");
					 session.setMaxInactiveInterval(702);
					 Result=SUCCESS;
				 }
					
		}catch(Exception e){
			
			System.out.println("An exception found.."+e);
			System.out.println("Connection lost.");
			request.setAttribute("messages", "<b> Connection lost.</b> ");
			Result=SUCCESS;
		
		}
		return Result;
	}
	
	public String callLogin() throws SQLException{
		String result=ERROR;
		Connection con=null;
		
		DaoFactory dfact=new DaoFactory();
		CompanyMasterDAO cdo=dfact.createCompanyMasterManager();
		LoginMasterDAO lDao=dfact.createLoginManager();
		try {
			    con=ConnectCore.getConnection();
				companyList=cdo.getCompanyDetails();
				YearRange=lDao.getYearRangeOfUserStock("1");
				System.out.println("size= "+companyList.size());
				result=SUCCESS;
		} catch (Exception e) {
			System.out.println("An exception occur: " + e);
		}
		finally
		{
			if(con!=null)
			{
				con.close();
				System.out.println("Connection closed");
			}
		}
		
		return result;
	}
	
	public String getYearRangeOfStock() throws SQLException{
		String result=ERROR;
		Connection con=null;
		DaoFactory dfact=new DaoFactory();
		LoginMasterDAO lDao=dfact.createLoginManager();
		HttpServletRequest request=ServletActionContext.getRequest();
		String companyId=request.getParameter("companyId");
		companyId=companyId.trim();
		try {
			    con=ConnectCore.getConnection();
				YearRange=lDao.getYearRangeOfUserStock(companyId);
				System.out.println("size= "+YearRange.size());
				result=SUCCESS;
		} catch (Exception e) {
			System.out.println("An exception occur: " + e);
		}
		finally
		{
			if(con!=null)
			{
				con.close();
				System.out.println("Connection closed");
			}
		}
		return result;
	}
//########################################### LogOut Action Code for logged out from website End here ############################################################	
	
	public String companyDetailsSave() throws DaoException
	{
		String result=ERROR;
		try
		{
			DaoFactory dfac=new DaoFactory();
			CompanyMasterDAO cdo=dfac.createCompanyMasterManager();
			System.out.println("image= "+loginobj.getUserPhoto());
			boolean saveResult=cdo.saveCompanyDetails(loginobj);
			if(saveResult)
			{
				System.out.println("Save Sucessfully");
				HttpServletRequest request=ServletActionContext.getRequest();
				request.setAttribute("loginStatus", "companycreated");
				result=callLogin();
			}
		}
		catch(Exception e)
		{
		System.out.println("An exception occur while saving comapny details " + e)	;
		}
		return result;
		
	}
	
	
	public String companyDetailsUpdate() throws DaoException
	{
		String result=ERROR;
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try
		{   
			DaoFactory dfac=new DaoFactory();
			CompanyMasterDAO cdo=dfac.createCompanyMasterManager();
			LoginMasterDAO lDao=dfac.createLoginManager();
			boolean saveResult=cdo.updateCompanyDetails(lValidateDetails);
			if(saveResult)
			{
				System.out.println("update Sucessfully");
				session.setAttribute("totaluser", lDao.getSizeofTotalUsers());
				request.setAttribute("message",util.Messages.companyNewUserAndUpdateinfo);
				result=SUCCESS;
			}
		}
		catch(Exception e)
		{
		System.out.println("An exception occur while saving comapny details " + e)	;
		result=SUCCESS;
		}
		
		return result;
	}
	
	public String backupDatabase()
	{
		String returnresult=SUCCESS;
		HttpServletRequest request=ServletActionContext.getRequest();
		
			String path="C:\\Program Files\\MySQL\\MySQL Server 5.7\\bin\\mysqldump.exe";
					boolean rs=backupDataWithOutDatabase(path, "localhost", "3306", "root", "root", "adkdb", "E:\\dbbackup\\");
			
			if(rs)
			{
				request.setAttribute("message", "<b style=color:green>Backup Completed !!</b>");
			}
			else
			{
				request.setAttribute("message", "<b style=color:red>Error occur please try again !!</b>");
			}
					
					
	        return returnresult;
	}
	
	public String sessionCheck()
	{
		String messages="expire";
		HttpServletRequest request=ServletActionContext.getRequest();
		try{
		HttpSession session=request.getSession();
		 if(session.getAttribute("login")!=null)
		    {
	    	System.out.println("login found");
	    	System.out.println("Session active #########################################################>>>>>");
	    	request.setAttribute("loginStatus", "sessionIn");
	        messages=SUCCESS;
		    }
		    else
		    {
		    	System.out.println("Session EXPIRED #########################################################>>>>>"); 	
		    	request.setAttribute("loginStatus", "sessionExpired");
		    	messages="expire";
		    }
		}
		catch(Exception e)
		{
			System.out.println("Error occur"+e);
			System.out.println("Session EXPIRED #########################################################>>>>>"); 	
			request.setAttribute("loginStatus", "sessionExpired");
			messages="expire";	
		}
		
		return messages;
	}
	
	public static boolean backupDataWithOutDatabase(String dumpExePath, String host, String port, String user, String password, String database, String backupPath) {
		boolean status = false;
		try {
		Process p = null;
		 
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		String filepath = "backup_" + database + "_ADAK_INVENTORY" + host + "-(" + dateFormat.format(date) + ").sql";
		 
		String batchCommand = "";
		if (password != "") {
		//only backup the data not included create database
		batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --password=" + password + " " + database + " -r \"" + backupPath + "" + filepath + "\"";
		} else {
		batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " " + database + " -r \"" + backupPath + "" + filepath + "\"";
		}
		 
		Runtime runtime = Runtime.getRuntime();
		p = runtime.exec(batchCommand);
		int processComplete = p.waitFor();
		 
		if (processComplete == 0) {
		status = true;
		 System.out.println("Backup created successfully for without DB " + database + " in " + host + ":" + port);
		} else {
		status = false;
		System.out.println("Could not create the backup for without DB " + database + " in " + host + ":" + port);
		}
		 
		} catch (IOException ioe) {
		 System.out.println(ioe);
		} catch (Exception e) {
		 System.out.println(e);
		}
		return status;
		}
}
