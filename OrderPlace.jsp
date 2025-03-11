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
		String address,landmark,city;
		int pincode;
		int userid=Integer.parseInt(request.getParameter("userid"));
		
	     PreparedStatement pst;
	     ResultSet rs;
		 try
		 {
			 
			 address=request.getParameter("address");
			 landmark=request.getParameter("landmark");
			 city=request.getParameter("city");
			 pincode=Integer.parseInt(request.getParameter("pincode"));
			 
			  String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid1 = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid1, password);
		      
		      pst=con.prepareStatement("update users set address=?,landmark=?,city=?,pincode=? where userid=?;");
		      pst.setString(1,address);
		      pst.setString(2,landmark);
		      pst.setString(3,city);
		      pst.setInt(4,pincode);
		      pst.setLong(5,userid);
		      
		      int c=pst.executeUpdate();
		      if(c>0)
		      {
		    	  session.setAttribute("userid",userid);
		    	  response.sendRedirect("FinalCart.jsp");
		      }
		      else
		      {
		    	  %>
		    	  <script>alert("Your details are not submitted successfully.. Try again..")</script>
		    	  <%
		    	  response.sendRedirect("AddressForm.jsp");
		      }
		      
		 }
		 catch(Exception ex)
		 {
			 System.out.print("Error:"+ex.getMessage());
		 }
	%>
	
</body>
</html>