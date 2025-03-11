<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mybeans.AddProductToCart" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	long prodid=Long.valueOf(request.getParameter("prodid"));
	long userid=Long.valueOf(request.getParameter("userid"));
	int quantity=Integer.valueOf(request.getParameter("quantity"));
	double price=Double.valueOf(request.getParameter("price"));
	
	AddProductToCart ap=new AddProductToCart();
	ap.setUserid(userid);
	ap.setProdid(prodid);
	ap.setQuantity(quantity);
	ap.setPrice(price);
	
	

%>
</body>
</html>