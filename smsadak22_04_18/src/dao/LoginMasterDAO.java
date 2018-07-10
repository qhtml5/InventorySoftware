package dao;

import java.sql.SQLException;
import java.util.List;

import util.FinancialYear;

import dTO.LoginUserCompanyMasterDto;

public interface LoginMasterDAO {
	
	public LoginUserCompanyMasterDto getValidateLoginDetails(LoginUserCompanyMasterDto logindetails)throws DaoException,SQLException;

	int getSizeofTotalUsers() throws DaoException, SQLException;

	public List<FinancialYear> getYearRangeOfUserStock(String companyId) throws DaoException, SQLException;

}
