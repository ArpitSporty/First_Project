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
<title>Insert title here</title>
</head>
<body>
<%
String userid=request.getParameter("userid");
String status=request.getParameter("status");


PreparedStatement pst;
ResultSet rs;

try{
	String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid1 = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid1, password);
    
	if(status.equals("Cancel"))
	{%>
		<table class="table table-striped">
		<%
		pst=con.prepareStatement("select * from cancelorder where userid=? order by cancelid desc;");
        pst.setString(1,userid);
        rs=pst.executeQuery();
        while(rs.next())
        {
        %>
        	
			<tr>
				<td>CANCEL ID #<br><%=rs.getLong("cancelid")%></td>
				<td>ORDER ID # <%=rs.getLong("orderid")%></td>
				<td>PRODUCT NAME #<br><%=rs.getString("prodnm")%></td>
				<td>QUANTITY<br><%=rs.getInt("quantity")%></td>
				<td>PRICE<br><%=rs.getDouble("price")%></td>
			</tr><%
        }
        %>
        </table>
		<%
	}
	else if(status.equals("Return"))
	{%>
		<table class="table table-striped">
		<%
		pst=con.prepareStatement("select * from returnorder inner join products on returnorder.prodid=products.prodid where userid=? order by returnid desc;");
    	pst.setString(1,userid);
    	rs=pst.executeQuery();
    	while(rs.next())
   		{
    	%>
    	
		<tr>
			<td>RETURN ID #<br><%=rs.getLong("returnid")%></td>
			<td>RETURN DATE #<br><%=rs.getString("returndate")%></td>
			<td>PRODUCT NAME #<br><%=rs.getString("prodnm")%></td>
			<td>RETURN STATUS<br><%=rs.getString("returnstatus")%></td>
			<td>REASON<br><%=rs.getString("reason")%></td>
		</tr>
	
		<%
    	}
    	%>
		</table>
		<%
	}
	else if(status.equals("Replace"))
	{
		%>
		<table class="table table-striped">
		<%
		pst=con.prepareStatement("select * from replaceorder where userid=? order by replaceid desc;");
    	pst.setString(1,userid);
    	rs=pst.executeQuery();
    	while(rs.next())
   		{
    	%>
		<tr>
			<td>REPLACE ID #<br><%=rs.getLong("replaceid")%></td>
			<td>REPLACE DATE #<br><%=rs.getString("replacedate")%></td>
			<td>PRODUCT NAME #<br><%=rs.getString("prodnm")%></td>
			<td>REPLACE STATUS<br><%=rs.getString("replacestatus")%></td>
			<td>REASON<br><%=rs.getString("reason")%></td>
		</tr>
	
		<%
    	}
    	%>
		</table>
		<%
	}
}
catch(Exception ex){
	out.print("Error: "+ex.getMessage());
}
%>
</body>
</html>