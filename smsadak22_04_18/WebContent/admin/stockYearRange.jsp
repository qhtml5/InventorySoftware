<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>


	<s:select theme="simple" cssStyle="cursor:pointor;" onchange="setRange()"
	headerKey="0" headerValue="-Financial Year-" list="YearRange" 
	listKey="fYear" listValue="fYear" id="yearRangeId" name="fYearDto.fYear" />
	