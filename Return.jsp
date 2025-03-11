<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.Date" %>
<%@page import="java.text.DateFormat,java.text.SimpleDateFormat" %>
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
<%
String orderid=session.getAttribute("orderid").toString();
//String orderid=request.getParameter("orderid");
;
PreparedStatement pst;
ResultSet rs;
Date today=new Date();

SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/YYYY");
String dateToStr=sdf.format(today);
//Date currentDate=new Date();
//String dateToStr=DateFormat.getInstance().format(currentDate);
String reason=request.getParameter("reason");
String userid=session.getAttribute("userid").toString();

try{
	String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid1 = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid1, password);
    pst=con.prepareStatement("select * from orders where orderid=?;");
    pst.setString(1,orderid);
    rs=pst.executeQuery();
    if(rs.next())
    {
    	pst=con.prepareStatement("insert into returnorder (returndate,returnstatus,reason,userid,prodid) values(?,default,?,?,?);");
    	pst.setString(1,dateToStr);
    	pst.setString(2,reason);
    	pst.setLong(3,rs.getLong("userid"));
    	pst.setLong(4,rs.getLong("prodid"));
    	int c=pst.executeUpdate();
    	if(c>0){
    		pst=con.prepareStatement("delete from orders where orderid=?");
    		pst.setString(1,orderid);
    		pst.executeUpdate();
    		out.print("Order return successfully....");
    		%>
    		<a href="MyOrders.jsp" role="button" class="btn btn-primary">Back</a>
    		<%
    	}
    	else{
    		out.print("Order not Returned...");
    	}
    }
    else{
    	out.print("Order");
    }
}
catch(Exception ex){
	System.out.print("Error: "+ex.getMessage());
}


%>
<br>
<br>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>