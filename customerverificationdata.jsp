<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="mybeans.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{
long id=Long.valueOf(session.getAttribute("userid").toString());
/*String driver="com.mysql.jdbc.Driver";
	String connectionUrl="jdbc:mysql://localhost:3306/";
	String database="kba";
	String userid="root";
	String password="";
	 Class.forName(driver);*/
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
CustomerData csd=new CustomerData();
 PreparedStatement pst;
 ResultSet rs;
 pst=con.prepareStatement("select userid,name,email,mobile,address,landmark,city,pincode from users where userid=?;");
 pst.setLong(1,id);
 rs=pst.executeQuery();
	while(rs.next())
	{
         csd.setUserid(rs.getLong("userid"));
		 csd.setName(rs.getString("name"));
		 csd.setEmail(rs.getString("email"));
		 csd.setMobno(rs.getLong("mobile"));
		 csd.setAddress(rs.getString("address"));
		 csd.setLandmark(rs.getString("landmark"));
		 csd.setCity(rs.getString("city"));
		 csd.setPincode(rs.getInt("pincode"));
		 
		 
		 out.println(rs.getString("name"));
		 out.println(rs.getString("email"));
		 out.println(rs.getLong("mobile"));
		 out.println(rs.getString("address"));
		 out.println(rs.getString("landmark"));
		 out.println(rs.getString("city"));
		 out.println(rs.getInt("pincode"));
		 
		 
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