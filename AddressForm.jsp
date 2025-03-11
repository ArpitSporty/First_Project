<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="mybeans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width" , initial-scale=1.0">
 <script src="js/jquery-3.3.1.slim.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

<link href="fontawesome-free-5.6.3-web/css/all.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/mega-menu.css">
<link rel="stylesheet" href="css/search-bar.css">
<link rel="stylesheet" href="css/newarrivals.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/popup.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<center>
	<div class="col-lg-4"></div>
	
	<%
	
	PreparedStatement pst;
	ResultSet rs;
	
	int userid=Integer.parseInt(request.getParameter("userid")); 
	try{
		String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid1 = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid1, password);
        pst=con.prepareStatement("select * from users where userid=?;");
        pst.setInt(1,userid);
        rs=pst.executeQuery();
        if(rs.next())
        {
	%>
        <div class="col-lg-4">
           <center>
           
                <h1 style="color: #269abc">ADDITIONAL DETAILS</h1>
                <form name="frm" method="post" action="OrderPlace.jsp?userid=<%=userid%>" class="form-group">
                    <table class="table">
                        <tr>
                        	<td>ADDRESS</td>
                        	<td><input type="text" name="address" class="form-control" value="<%=rs.getString("address") %>" required></td>
                        </tr>
                        <tr>
                        	<td>LANDMARK</td>
                        	<td><input type="text" name="landmark" class="form-control" value="<%=rs.getString("landmark")%>"></td>
                        </tr>
                        <tr>
                        	<td>CITY</td>
                        	<td><input type="text" name="city" class="form-control" value="<%=rs.getString("city")%>"></td>
                        </tr>
                        <tr>
                        	<td>PINCODE</td>
                        	<td><input type="number" name="pincode" class="form-control" value="<%=rs.getInt("pincode")%>"></td>
                        </tr>
                        
                        <tr>
                        	<td><input type="submit" value="Submit" class="btn btn-success"></td>
                        	<td><a onclick="history.back()" class="btn btn-primary" role="button">Back</a></td>
                        </tr>
                    </table>
                    <%
                    //long userid=Long.parseLong(request.getParameter("userid"));
                    //session.setAttribute("userid",userid);
                   // %>
               </form>
           </center>
        </div>
        <%
        }
	}
	catch(Exception ex){
		
	}
	
%>
</center>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>