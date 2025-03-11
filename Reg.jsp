<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="mybeans.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<% 
		String name,email,mobile,pass,Company,Address,city;
		 
	     PreparedStatement pst;
	     ResultSet rs;
		 try
		 {
			  name=request.getParameter("name");
		      email=request.getParameter("email");
                      
		      mobile=request.getParameter("mobile");
		      pass=request.getParameter("pass");
		       Company=request.getParameter("Company");
                        Address=request.getParameter("Address");
                        city=request.getParameter("City");
                        
		      String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
		      
		      pst=con.prepareStatement("insert into users(name,email,password,mobile,address,city,companyName,usertype)values(?,?,?,?,?,?,?,default);");
		      pst.setString(1,name);
		      pst.setString(2,email);
		      pst.setString(3,pass);
		      pst.setString(4,mobile);
                      pst.setString(5,Address);
                      pst.setString(6,city);
		      pst.setString(7,Company);
                      
		      int c=pst.executeUpdate();
		      if(c>0)
		      {
		    	  %><script>alert("Registered Successfully...");
		    	  					<%response.sendRedirect("Log.jsp?emailmobile="+email+"&pass="+pass);%>
		    	  </script><%
		    	  
		      }
		      else
		      {
		    	  
		      }
		      
		 }
		 catch(Exception ex)
		 {
			 
			 System.out.print("Error:"+ex.getMessage());
		 }
		
	%>


</body>
</html>