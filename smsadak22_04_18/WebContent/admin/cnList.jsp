<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>

<html>
<head></head>
<body>
	<select name="saleDto.crNo" id="cnNo">
		<option value="0">--Select Credit Note No--</option>
		<s:iterator value="crList">
			<option value="<s:property value='cnNo'/>">
				<s:property value="cnNo" />
			</option>
		</s:iterator>
	</select>
</body>
</html>
	