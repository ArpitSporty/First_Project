<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="mybeans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="fontawesome-free-5.6.3-web/css/all.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/mega-menu.css">
<link rel="stylesheet" href="../css/search-bar.css">
<link rel="stylesheet" href="../css/newarrivals.css">
   <link rel="stylesheet" href="css/style.css"/>


        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>

<title>Insert title here</title>
<script>
// If user clicks anywhere outside of the modal, Modal will close

var modal = document.getElementById('modal-wrapper');
window.onclick = function(event) {
if (event.target == modal) {
modal.style.display = "none";
}
}
</script>
</head>
<body>
<div class="row">
<div class="col-lg-4" align="left">
	<h2 style="color: #269abc">Tender</h2>
	<table class="table table-striped">
		<tr>
			<th>Tender Name</th>
			<th>Location</th>
			<th>Bid Amount</th>
		</tr>
	<%
		   
		    PreparedStatement pst;
		    ResultSet rs;    
		    String userid=session.getAttribute("userid").toString();
                    Long Tenderid=Long.parseLong(request.getParameter("Tenderid"));
                    session.setAttribute("Tenderid", Tenderid);
		try
		{String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid1 = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid1, password);
             pst=con.prepareStatement("select * from tenders where Tenderid=?");
             pst.setLong(1,Tenderid);
             
             rs=pst.executeQuery();
			while(rs.next())
			{
				%>
				<tr>
					<td><%=rs.getString("Tendernm") %></td>
					<td><%=rs.getString("Location") %></td>
					<td><%=rs.getDouble("mrp") %></td>
				</tr>
				<%
			}
			%>
			</table></div>
			
			<div class="col-lg-4" align="right">
			<h2 style="color: #269abc">Vendor Details</h2>
			<table class="table table-striped">
				<tr>
					<th>Name</th>
					<th>E-mail ID</th>
					<th>Mobile</th>
					<th>Address</th>
					<th>City</th>
					<th>Company Name</th>
				</tr>
			<%
			
			
			pst=con.prepareStatement("select * from users where userid=?;");
            pst.setString(1,userid);
            rs=pst.executeQuery();
			while(rs.next())
			{
				%>
				<tr>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("email") %></td>
					<td><%=rs.getLong("mobile") %></td>
					<td><%=rs.getString("address") %></td>
					
					<td><%=rs.getString("city") %></td>
					<td><%=rs.getString("companyName") %></td>
				</tr>
				<%
			}
			
			con.close();
		}
		catch(Exception ex)
		{
			 System.out.print("Error:"+ex.getMessage());
		}
	%>
	</tr>
	</table>
	</div>
	</div>
	</center>
	<h3>Confirmation</h3>
	<table class="table">
		
		<tr>
		<td><a href="#"  onclick="document.getElementById('modal-wrapper').style.display='block'" style="width:200px; margin-top:200px;">
Confirm to Bid Tender</a></td>
		</tr>
		

<td><h1 style="text-align:center; font-size:50px; color:#fff">Modal Popup Box Login Form</h1>


<div id="modal-wrapper" class="modal">

<form class="modal-content animate" action="orderPlaced.jsp">

<div class="imgcontainer">
<span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
</div>

<div class="container">
<center>
<h3 class="text-Info">Confirmation Code</h3>
<input type="text"  name="otp" placeholder="Enter 4 digit number for Confirmation">
<button type="submit">submit</button>
</center>
</div>

</form>

</div>
</table>
</body>
</html>