package dao;

import java.util.List;

import util.AllBankNames;

import dTO.SalesMasterDto;
import dTO.SmsMaster;

public interface CustomerPaymentDao {

	public List<SalesMasterDto> getAllUnpaidBillofSales() throws DaoException, Exception;
	public List<SalesMasterDto> getPaymentHistoryByBillNo(String billNo) throws DaoException, Exception;
	public List<SalesMasterDto> getPaymentInfoByCustomerId(String customerId) throws DaoException, Exception;
	boolean saveCustomerPayment(SalesMasterDto sdto) throws DaoException, Exception;
	public List<SalesMasterDto> getAllCustomerPaymentDueInfo() throws DaoException,Exception ;
	public List<SalesMasterDto> getPaymentDueInfoByCustomerId(String customerId) throws DaoException, Exception;
	public List<SalesMasterDto> getCustomerWithDuePay() throws DaoException, Exception;
	public List<AllBankNames> getAllBankList() throws DaoException;
	public boolean saveCustomerPaymentforSales(SalesMasterDto sdto) throws DaoException, Exception;
	public List<SalesMasterDto> getPaymentBillNoCustomerId(String customerId)  throws DaoException, Exception;
    public List<SalesMasterDto>getAllCustomernamesByCustomerNameWithDistinct(String customerName) throws DaoException,Exception;
    public List<SmsMaster> getSmsDetails() throws DaoException, Exception ;
    public boolean updateSmsMaster(SmsMaster s)throws DaoException;
}
