<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="mybeans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/global.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/dropdownmenu.js" type="text/javascript"></script>
        <script src="js/jquery-3.3.1.slim.min.js"></script>
  <script src="js/popper.min.js"></script>
  <link rel="stylesheet" href="css/popup.css">
  <script src="js/bootstrap.min.js"></script>
<title>Tender Management</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<center>
<%

String bidid=request.getParameter("bidid");

PreparedStatement pst;
ResultSet rs;

try
{
	String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
Statement st=con.createStatement();
  int i=st.executeUpdate("DELETE FROM bids WHERE bidid="+bidid);

	    		out.print("<h1>"+"Bid cancelled successfully...."+"</h1>");
	    	
    
    
	con.close();
}
catch(Exception ex){
	System.out.print("Error: "+ex.getMessage());
}
%>

</center>
<br>
<br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>