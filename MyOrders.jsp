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
<jsp:include page="header.jsp"></jsp:include>
<center>
<h1 style="color: #269abc">BIDS</h1>
<br>
<%

	PreparedStatement pst;
	ResultSet rs;
	
	String userid=session.getAttribute("userid").toString();
	%>
	<input type="hidden" id="userid" value="<%=userid%>">
	<div class="col-lg-8">
	<%
	try{
		String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid1 = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid1, password);
        pst=con.prepareStatement("select * from bids where userid=? ORDER BY bidid DESC;");
        pst.setString(1,userid);
        rs=pst.executeQuery();
        if(rs.next()){
        while(rs.next())
        {

%>			
			
			<table class="table table-striped">
				<tr>
					<td>TENDER BID ON <br><%=rs.getString("biddate")%></td>
					<td>BID AMOUNT<br><%=rs.getDouble("mrp")%></td>
					<td>BID ID # <%=rs.getLong("bidid")%></td>
				</tr>
			</table>
			<% session.setAttribute("bidid",rs.getLong("bidid")); %>
			<div id="ship">
			<h3 align=left>BID STATUS # <%=rs.getString("bidstatus") %></h3>
				<%
				if(rs.getString("bidstatus").equals("confirmed")||rs.getString("bidstatus").equals("pending")){
				%>
				<align=right><a href="CancelOrder.jsp?bidid=<%=rs.getLong("bidid")%>" role="button" class="btn btn-warning">Cancel BID</a></align>
				<br>
				<table align=left>
					<tr>
						<td><h4 align=left><%=rs.getString("Tendernm") %></h4></td>
						<td></td>
					</tr>
					<tr>
						<td><h5 align=left style="color: red;">Rs. <%=rs.getDouble("mrp")%></h5></td>
					</tr>
				</table>
				
				<%} 
				
        	}
        }
				else{
		        	%><h4>Not Bid any Tender yet ..</h4><%
		        }
				%>
			</div>
		<br/>
		<br/>
				
<%
        
        
	}
	catch(Exception ex){
		System.out.print("Error:"+ex.getMessage());
	}
	
%>	
<BR>
<BR>
<br>
<br>
<a role="button" value="Back" href="CustHome.jsp" class="btn btn-primary">Back</a>
</div>
</center>
<br>
<br>
<br>
<br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>