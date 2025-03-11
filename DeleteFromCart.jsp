<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="mybeans.DeleteProductFromCart" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	long uid,Tenderid;
	uid=Long.valueOf(request.getParameter("userid"));
	Tenderid=Long.valueOf(request.getParameter("Tenderid"));
	
	DeleteProductFromCart dp=new DeleteProductFromCart();
	dp.setUserid(uid);
	dp.setTenderid(Tenderid);
	
%>
</body>
</html>