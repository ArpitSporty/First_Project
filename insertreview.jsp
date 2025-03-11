<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.* "%>
   <%@page import="mybeans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
long proreview=Long.parseLong(request.getParameter("stars")); 
long productid=(Long)session.getAttribute("proid");
HttpSession ses=request.getSession(true);
ses.setAttribute("proid",productid);
try
{
	String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
    Statement st=con.createStatement();
    String sql="insert into review values('"+productid+"','"+proreview+"')";
int count=st.executeUpdate(sql);
if(count>0)
{
	out.println("Review inserted successfully");
}

}
catch(Exception e)
{
 out.println(e);
    e.printStackTrace();
}
%>
</body>
</html>