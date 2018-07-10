package dao;




import dao.LoginMasterDAO;
import dao.CompanyMasterDAO;
import daoImpl.CustomerMasterDaoIMPL;
import daoImpl.ItemMasterAndTypeDaoIMPL;
import daoImpl.LoginMasterDaoIMPL;
import daoImpl.CompanyMasterDAOIMPL;
import daoImpl.SalesMasterDaoImpl;
import daoImpl.SchemeMasterDaoImpl;
import daoImpl.SupplierMasterDAOIMPL;
import dao.ItemMasterAndTypeDAO;
import daoImpl.*;
import dao.StockMasterDAO;
import daoImpl.StockMasterDaoImpl;
public final class DaoFactory {

	
	
	public LoginMasterDAO createLoginManager()
	{
		return new LoginMasterDaoIMPL();
	}
	
	public CompanyMasterDAO createCompanyMasterManager()
	{
		return new CompanyMasterDAOIMPL();
	}
	
	
	public ItemMasterAndTypeDAO createItemMasterManager()
	{
		return new ItemMasterAndTypeDaoIMPL();
	}
	public SchemeMasterDao createSchemeMasterManager()
	{
		return new SchemeMasterDaoImpl();
	}
	
	public LocationMasterDao CreateLocatiobManager()
	{
		return new LocationMasterDaoImpl();
	}
	
	
	public SupplierMasterDAO CreateSupplierManager()
	{
		return new SupplierMasterDAOIMPL();
	}
	public CustomerMasterDAO createCustomerManager()
	{
		return new CustomerMasterDaoIMPL();
	}
	
	public StockMasterDAO createStockManager()
	{
		return new StockMasterDaoImpl();
	}
	
	public LedgerDao createLedgerManager()
	{
		return new LedgerDaoImpl();
	}
	
	public SalesMasterDao createSalesMasterManager()
	{
		return new SalesMasterDaoImpl();
	}
	
	public CustomerPaymentDao createCustomerPayManager()
	{
		return new CustomerPaymentDaoImpl();
	}
	
	public SupplierPaymentDao createSupplierPayManager()
	{
		return new SupplierPaymentDaoImpl();
	}
}
