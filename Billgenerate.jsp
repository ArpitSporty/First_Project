<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="java.sql.* "%>
        <%@page import="mybeans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div class="panel panel-default">
          <div class="container">
        <h2 class="text-danger">Your order has been placed successfully !!</h2><br>
        <h4 class="text-muted">Your Order Summery </h4>
        <% 
 		long id=Long.valueOf(session.getAttribute("userid").toString());
        double price=0.0,total=0.0;
        long proid=0;
		 
	     PreparedStatement pst;
	     ResultSet rs;
		 try
		 {

           String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
             
             pst=con.prepareStatement("select userid,name,address,landmark,city,pincode from users where userid=?;");
             pst.setLong(1,id);

             rs=pst.executeQuery();
         	while(rs.next())
         	{%>
                 
  
  </div>
   <div class="container">
     <div class="panel panel-info">
      <div class="panel-body">
      <div class="row">
          <table>
         <tr><td class="text-success font-weight-bold">Shipping to :</td><td class="text-success"><%=rs.getString("name")%>,</td>
         <td class="text-success"><%=rs.getString("address") %></td>
         <td class="text-success"><%=rs.getString("landmark") %></td>
         <td class="text-success"><%=rs.getString("city")%></td>
         <td class="text-success"><%=rs.getInt("pincode") %></td>
         </tr>
         
          </table>
      </div><br>
     <hr>
  <%} 
   pst=con.prepareStatement("select products.prodnm,cart.quantity,cart.price,orders.delieverydate from products inner join cart where products.prodid=cart.prodid inner join orders where cart.userid=? and products.prodid=cart.prodid and orders.prodid=products.prodid;");
             pst.setLong(1,id);
             rs=pst.executeQuery();
         	while(rs.next())
         	{%>
                 
   
    <div class="container">
      <div class="row">
          <table>
          <tr>
          <td class="text-primary">PRODUCT NAME: <%=rs.getString("prodnm") %></td>
          </tr>
          <tr>
          <td class="text-primary">QUANTITY: <%=rs.getInt("quantity") %></td>
          </tr>
          <tr>
          <td class="text-primary">PRICE: <%=rs.getDouble("price") %></td>
          </tr>
          <% 
           price=rs.getDouble("price");
           total=total+price;
          %>
          <tr>
          <td class="text-danger">Estimated Delivery: <%=rs.getString("delieverydate")%></td>
          </tr>
          </table>
         
      </div><hr>

      </div>
      <%} %>
       <div class="container">
      <div class="row">
      <table >
          <tr>
          <td class="text-danger">TOTAL :     </td><td class="text-danger"><%=total %></td>
          </tr>
      
      </table>
      
  </div>
  </div>
   </div> 
</div>
</div>
<% 
pst=con.prepareStatement("select prodid from cart where userid=?;");
pst.setLong(1,id);
while(rs.next())
	{
	proid=rs.getLong(1);
	}

pst=con.prepareStatement("delete from cart where userid=? and prodid=?;");
pst.setLong(1, id);
pst.setLong(2, proid);
pst.executeUpdate();
}
catch(Exception ex)
{
	 out.print("Error:"+ex.getMessage());
} 

%>


</body>
</html>