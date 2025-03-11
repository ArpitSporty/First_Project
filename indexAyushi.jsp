<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="mybeans.*" %>
<%@page import="java.sql.*" %>
<html>
<head>
<meta name="viewport" content="width=device-width" , initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
<link href="fontawesome-free-5.6.3-web/css/all.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/mega-menu.css">
<link rel="stylesheet" href="css/search-bar.css">
<link rel="stylesheet" href="css/newarrivals.css">
<link rel="stylesheet" href="css/global.css">

<title>KBA Automobiles</title>
    </head>
<body>  
<div class="fixheader" id="fixheader">
   <jsp:include page="header.jsp"></jsp:include>
  </div>
   <jsp:include page="carousel.jsp"></jsp:include>
    
        <center>
          ----------------------------------<h3>New Arrivals</h3>----------------------------------
        </center>
        
        <script type="text/javascript">
function myFunction(myMessage) {
	var cartcounter=document.getElementById("cartcounter").innerHTML;
	cartcounter++;
	document.getElementById("cartcounter").innerHTML=cartcounter;
    alert(myMessage);
    
    
}
</script>

        <%
        
        try
        {
        	ArrayList<Integer> prodid=new ArrayList<Integer>();
        	ArrayList<String> prodnm=new ArrayList<String>();
			ArrayList<String> img=new ArrayList<String>();
        	ArrayList<Integer> mrp=new ArrayList<Integer>();
        	ArrayList<Integer> sellingprice=new ArrayList<Integer>();
       String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select p.prodid,p.prodnm,p.mrp,p.sp,p.imgurl1 from products p,newarrivals n where p.prodid=n.prodid order by n.prodid DESC LIMIT 5;");
        	while(rs.next())
        	{
        		prodid.add(rs.getInt(1));
        		prodnm.add(rs.getString(2));
        		mrp.add(rs.getInt(3));
        		sellingprice.add(rs.getInt(4));
        		img.add(rs.getString(5));
        		
        	}
        	
        %>
        <div class="container">
          <div class="row newarrivals">
            
            <div style="background-color:whitesmoke;height: 300px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            <br>
             <center>    <img src="<%=img.get(0) %>" height="150px" width="150px" alt="First slide">
               <br>
               <a href="viewproductdetails.jsp?prodid=<%=prodid.get(0)%>"><% out.print(prodnm.get(0)); %></a></center>
               <h6>Mrp Rs. <strike><% out.print(mrp.get(0)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(0));%></h6>
               <center><a href="javascript:myFunction('Added to Cart')" class="btn btn-success">Add To Cart</a></center>
               Reviews
                
            </div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height: 300px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
           <br>
            <center>
             <img src="<%=img.get(1) %>" height="150px" width="150px" alt="First slide">
           <br>
           <a href="viewproductdetails.jsp?prodid=<%=prodid.get(1)%>">  <% out.print(prodnm.get(1)); %></a> </center>
            <h6>MRP Rs.<strike><% out.print(mrp.get(1)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(1));%></h6>
            <center><a href="javascript:myFunction('Added to Cart')" class="btn btn-success">Add To Cart</a></center>
               Reviews
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height: 300px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
           <br>
            <center>
             <img src="<%=img.get(2) %>" height="150px" width="150px" alt="First slide">
             <br>
              <a href="viewproductdetails.jsp?prodid=<%=prodid.get(2)%>"> <% out.print(prodnm.get(2)); %></a> </center>
              <h6>MRP Rs.<strike><% out.print(mrp.get(2)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(2));%></h6>
              <center><a href="javascript:myFunction('Added to Cart')" class="btn btn-success">Add To Cart</a></center>
               Reviews
              </div>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height:300px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
             <br>
              <center>
               <img src="<%=img.get(3) %>" height="150px" width="150px" alt="First slide">
              <br>
              <a href="viewproductdetails.jsp?prodid=<%=prodid.get(3)%>"> <% out.print(prodnm.get(3)); %></a> </center>
                 <h6>MRP Rs.<strike><% out.print(mrp.get(3)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(3));%></h6>
                 <center><a href="javascript:myFunction('Added to Cart')" class="btn btn-success">Add To Cart</a></center>
               Reviews
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height: 300px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
               <br>
                <center>
                 <img src="<%=img.get(4) %>" height="150px" width="120px" alt="First slide">
              <br>
               <a href="viewproductdetails.jsp?prodid=<%=prodid.get(4)%>"><% out.print(prodnm.get(4)); %></a> </center>
                  <h6>MRP Rs.<strike><% out.print(mrp.get(4)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(4));%></h6>
                  <center><a href="javascript:myFunction('Added to Cart')" class="btn btn-success">Add To Cart</a></center>
               Reviews
                  </div>
          </div>
          
        </div>
       <% }
        catch(Exception e)
        {
        	out.print(e);
        }
        
        %>
       
    <br>      
    
        <center>
          ----------------------------------<h3>Trending Products</h3>----------------------------------
        </center>
        
          
          

        <%
        
        try
        {
        	
        	ArrayList<Integer> prodid=new ArrayList<Integer>();
        	ArrayList<String> prodnm=new ArrayList<String>();
			ArrayList<String> img=new ArrayList<String>();
        	ArrayList<Integer> mrp=new ArrayList<Integer>();
        	ArrayList<Integer> sellingprice=new ArrayList<Integer>();
        String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid1 = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid1, password);
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select p.prodid,p.prodnm,p.mrp,p.sp,p.imgurl1 from products p,orders o where p.prodid=o.prodid order by o.orderid DESC LIMIT 5;");
        	while(rs.next())
        	{
        		prodid.add(rs.getInt(1));
        		prodnm.add(rs.getString(2));
        		mrp.add(rs.getInt(3));
        		sellingprice.add(rs.getInt(4));
        		img.add(rs.getString(5));
        		
        	}
        	
        %>
        <div class="container">
          <div class="row newarrivals">
            
            <div style="background-color:whitesmoke;height: 300px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            <br>
             <center>    <img src="<%=img.get(0) %>" height="150px" width="150px" alt="First slide">
              
               <br>
               <a href="viewproductdetails.jsp?prodid=<%=prodid.get(0)%>"><% out.print(prodnm.get(0)); %></a></center>
               <h6>Mrp Rs. <strike><% out.print(mrp.get(0)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(0));%></h6>
               <center><a href="javascript:myFunction('Added to Cart')" width="100%" class="btn btn-success">Add To Cart</a></center>
               Reviews
                
            </div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height: 300px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
           <br>
            <center>
             <img src="<%=img.get(1) %>" height="150px" width="150px" alt="First slide">
           <br>
           <a href="viewproductdetails.jsp?prodid=<%=prodid.get(1)%>">  <% out.print(prodnm.get(1)); %></a> </center>
            <h6>MRP Rs.<strike><% out.print(mrp.get(1)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(1));%></h6>
            <center><a href="javascript:myFunction('Added to Cart')" class="btn btn-success">Add To Cart</a></center>
               Reviews
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height: 300px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
           <br>
            <center>
             <img src="<%=img.get(2) %>" height="150px" width="150px" alt="First slide">
              <br>
            <a href="viewproductdetails.jsp?prodid=<%=prodid.get(2)%>"> <% out.print(prodnm.get(2)); %></a>
              </center>
              <h6>MRP Rs.<strike><% out.print(mrp.get(2)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(2));%></h6>
              <center><a href="javascript:myFunction('Added to Cart')" class="btn btn-success">Add To Cart</a></center>
               Reviews
              </div>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height:300px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
             <br>
              <center>
               <img src="<%=img.get(3) %>" height="150px" width="150px" alt="First slide">
              <br>
              
              <a href="viewproductdetails.jsp?prodid=<%=prodid.get(3)%>"><div class="text-wrap"> <% out.print(prodnm.get(3)); %></div></a> </center>
                 <h6>MRP Rs.<strike><% out.print(mrp.get(3)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(3));%></h6>
                 <center><a href="javascript:myFunction('Added to Cart')" class="btn btn-success">Add To Cart</a></center>
               Reviews
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height: 300px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
               <br>
                <center>
                 <img src="<%=img.get(4) %>" height="150px" width="150px" alt="First slide">
               <br>
               <a href="viewproductdetails.jsp?prodid=<%=prodid.get(4)%>"><% out.print(prodnm.get(4)); %></a> </center>
                  <h6>MRP Rs.<strike><% out.print(mrp.get(4)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(4));%></h6>
                  <center><a href="javascript:myFunction('Added to Cart')" class="btn btn-success">Add To Cart</a></center>
               Reviews
                  </div>
          </div>
          
        </div>
       <% }
        catch(Exception e)
        {
        	out.print(e);
        }
        
        %>
        
        
       
        
          
      <br>
      <br>
<hr>
    
   <jsp:include page="footer.jsp"></jsp:include>
 
    
</body>
</html>