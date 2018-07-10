<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<b style="color:green;font-size:19px">Report successfully created !!</b>
<br/><a style="color:blue;font-size:17px" href="<%=request.getContextPath() %>/gstr/<%=request.getAttribute("filename")%>.csv">Click here to Download report</a>
