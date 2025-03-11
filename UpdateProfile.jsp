<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="mybeans.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<% 
	String name,email,address,city;
	long mobile;
	int userid;
	
	
    PreparedStatement pst;
    ResultSet rs;
    
    name=request.getParameter("name");
    email=request.getParameter("email");
    mobile=Long.parseLong(request.getParameter("mobile"));
    address=request.getParameter("address");
    
    city=request.getParameter("city");
   
    userid=Integer.parseInt(request.getParameter("userid"));
    
	try{
		 String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid1 = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid1, password);
					pst=con.prepareStatement("update users set name=?,email=?,mobile=?,address=?,city=? where userid=?;");
                    pst.setString(1,name);
					pst.setString(2,email);
                    pst.setLong(3,mobile);
                    pst.setString(4,address);
                    
                    pst.setString(5,city);
                   
                    pst.setInt(6,userid);
                    pst.executeUpdate();
                    
             	
		
		con.close();
	}
	catch(Exception ex){
		System.out.print("Error:"+ex.getMessage());
	}
%>
<title>Insert title here</title>
</head>
<body>

</body>
</html>