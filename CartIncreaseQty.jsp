<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="mybeans.IncreaseQtyAndPrice" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	int qty;
	long pid,uid;
	
	qty=Integer.valueOf(request.getParameter("qty"));
	pid=Long.valueOf(request.getParameter("pid"));
	uid=Long.valueOf(request.getParameter("uid"));
	
	IncreaseQtyAndPrice i=new IncreaseQtyAndPrice();
	i.setQty(qty);
	i.setPid(pid);
	i.setUid(uid);
	
%>
</body>
</html>