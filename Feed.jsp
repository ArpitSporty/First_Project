<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="mybeans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String name,email,comment;

Connection con;
PreparedStatement pst;
ResultSet rs;
try
{
	 name=request.getParameter("name");
	 email=request.getParameter("email");
	 comment=request.getParameter("comment");
	 
	 DBConnector dbc=new DBConnector();
     con=dbc.getDbconnection();
     
     pst=con.prepareStatement("insert into feedback values(?,?,?);");
     pst.setString(1,name);
     pst.setString(2,email);
     pst.setString(3,comment);
     
     int c=pst.executeUpdate();
     
     if(c>0)
     {
   	  %>
   	  <h3>Your feedback registered successfully....</h3>
   	  <input type="button" onclick="history.back()" value="Back">
   	  <%
     }
}
catch(Exception ex)
{
	
}
%>

</body>
</html>