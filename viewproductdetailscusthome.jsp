<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mybeans.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
       <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
<link href="fontawesome-free-5.6.3-web/css/all.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/mega-menu.css">
<link rel="stylesheet" href="css/search-bar.css">
<link rel="stylesheet" href="css/newarrivals.css">
<link rel="stylesheet" href="css/global.css">
    </head>
    <body>
  <jsp:include page="header.jsp"></jsp:include>
  
<br>
    <%
  //  long prodid=Long.parseLong(request.getParameter("prodid"));
  /*   HttpSession ses=request.getSession(true);
    ses.setAttribute("proid", prodid);
   */ 
   long id=0;
  int prodid=Integer.parseInt(request.getParameter("prodid"));
  id=(Long)session.getAttribute("userid");
   
   
    String prodcat="",prodnm="",imgpath1="",imgpath2="",imgpath3="",imgpath4="",desc="",brand="",dimension="",sub_category="",vehicle_brand="";
    int mrp=0,sp=0,discount=0,quantity=0,prodreview=0,no_of_parts=0,catid=0,count=0;
    try
    {
    	 String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
         PreparedStatement pst=con.prepareStatement("Select * from products where prodid=?");
         pst.setLong(1, prodid);
         ResultSet rs=pst.executeQuery();
         while(rs.next())
         {
        	 prodnm=rs.getString("prodnm");
        	 mrp=rs.getInt("mrp");
        	 sp=rs.getInt("sp");
        	 imgpath1=rs.getString("imgurl1");
        	 imgpath2=rs.getString("imgurl2");
        	 imgpath3=rs.getString("imgurl3");
        	 imgpath4=rs.getString("imgurl4");
        	 desc=rs.getString("proddisc");
        	 quantity=rs.getInt("quantity");
        	 discount=rs.getInt("discount");
        	 prodreview=rs.getInt("prodreview");
        	 no_of_parts=rs.getInt("no_of_parts");
        	 brand=rs.getString("brand");
        	 dimension=rs.getString("dimension");
        	 sub_category=rs.getString("subcat");
        	 vehicle_brand=rs.getString("vehical_brand");
        	 catid=rs.getInt("catid");
         }
         
       pst=con.prepareStatement("Select * from orders where prodid=? and userid=?");
         pst.setLong(1, prodid);
         pst.setLong(2,id);
         rs=pst.executeQuery();
         while(rs.next())
         {
        	++count; 
         }
       
         
    }
    catch(Exception e)
    {
    	out.print(e);
    }
    
    int usave=(mrp*discount)/100;
    %>
        
    <div class="row">
        
        <div class="col-md-1">
        </div>
        <div class="col-md-4">
        Home > <%=prodnm %>
    	<br>
            <br>
        <div class="product-image fluid-container" height="500px" width="400px"">
       <center>
<img src="<%=imgpath1%>" id="myImage" class="img-fluid" class="img" alt="Image not available">
<br>
<br>

  <button onclick="document.getElementById('myImage').src='<%=imgpath1%>'"><img src="<%=imgpath1%>" class="img-fluid" width="75px" height="75px"></button>
 
 <%if(!"images/".equals(imgpath2))
	 {%>
	 <button onclick="document.getElementById('myImage').src='<%=imgpath2%>'"><img src="<%=imgpath2%>" class="img-fluid" width="75px" height="75px"></button>
	 <%
	 }
 if(!"images/".equals(imgpath3))
	 {%>
                  
                  <button onclick="document.getElementById('myImage').src='<%=imgpath3%>'"><img src="<%=imgpath3%>" class="img-fluid" width="75px" height="75px"></button>
            <%} 
 if(!"images/".equals(imgpath4))
       	 {%>
         
         <button onclick="document.getElementById('myImage').src='<%=imgpath4%>'"><img src="<%=imgpath4%>" class="img-fluid" width="75px" height="75px"></button>
   <%} %>
            </center>

        </div>
    </div>
<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
<%if(count>0)
    {
   	 %>

<h5 class="text-primary">Please Rate this Product</h5>
   	<jsp:include page="review.html"></jsp:include>
   	<%} 
   	else
   	{
   		%>
   		<h5 class="text-primary"> Product Review</h5>
   		<jsp:include page="viewproductrating.jsp"></jsp:include>
   <% }%>

    <br>
    <h4><%=prodnm %></h4>
    <h4>MRP: Rs. <strike><%=mrp %></strike>&nbsp;&nbsp;<%=sp %></h4>

<%if(discount>0)
	{%>
You Save: <%=usave %> (<%=discount%>%)<br>
<%
	}
else
{
}
%>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Inclusive of all Taxes<br>
<br>
Delivery Charges: Rs. 40
<br>
<%=prodreview %> Stars out of 5<br>
<%try
    {
    	 DBConnector dbc=new DBConnector();
         Connection con=dbc.getDbconnection();
         PreparedStatement pst=con.prepareStatement("Select * from prod_cat where catid=?");
         pst.setInt(1, catid);
         ResultSet rs=pst.executeQuery();
         while(rs.next())
         {
        	 prodcat=rs.getString("isreturn");
        	 
        	  }
         
         
    }
    catch(Exception e)
    {
    	out.print(e);
    }
if(prodcat.equals("yes"))
{
%>
<span style="color:green">**Return is available for this product</span>
<%}
else
{%>
<span style="color:red">**Return is not available for this product</span>
<% }%>
<hr>
<% if(quantity>=1)
{%>
<h5 style="color:green"> In stock</h5>
<%}
else {%>
Item not available
<%} %>

<br>
	<%
		if(session.getAttribute("userid") != null)
		{
	%>
			<a href="javascript:myFunction(<%=prodid%>,<%=session.getAttribute("userid").toString() %>,1,<%=sp%>)" class="btn btn-success">Add to Cart</a> &nbsp;&nbsp <a href="javascript:myFunction(<%=prodid%>,<%=session.getAttribute("userid").toString() %>,1,<%=sp%>)" class="btn btn-danger">Buy Now</a>
	<%
		}
		else
		{
			%>
			<a href="javascript:showAlert()" class="btn btn-success">Add to Cart</a> &nbsp;&nbsp <a href="javascript:showAlert()" class="btn btn-danger">Buy Now</a>
			<%
		}
	%>
<hr>
Services: Cash on Delivery Available<br>
<%if(prodcat.equals("yes"))
{
%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7 day Return Policy

<%}
else
{%>
<% }%>

<br>
<hr>                     
<br>

Safe and Secure Payments.Easy returns.100% Authentic products.
<br>
<hr>
<br>
<h4>Additional Info</h4>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#details">Details</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="#description">Description</a>
                </li>
              </ul>
              
              <!-- Tab panes -->
              <div class="tab-content">
                <div class="tab-pane active" id="details">
                    
                    <table class="table table-bordered" style="background-color:white">
                        <tbody>
                            <tr>
                                    <td width="400px">No. of Parts in the Box</td>
                                    <td><%=no_of_parts %></td>
                            </tr>
                            <tr>
                                    <td width="400px">Product Brand</td>
                                    <td><%=brand %></td>
                            </tr>
                            <tr>
                                    <td>Dimension</td>
                                    <td><%=dimension %></td>
                            </tr>
                            <tr>
                                    <td>Category</td>
                                    <%if(sub_category.equals("2w"))
                                    {
                                    %>
                                    	<td>Two Wheeler</td>
                                    <%
                                    }
                                    else if(sub_category.equals("3w"))
                                    {
                                    	%><td>Three Wheeler</td>
                                    <%}
                                    else if(sub_category.equals("4w"))
                                    {
                                    %><td>Four Wheeler</td>
                                    <%
                                    }
                                    else if(sub_category.equals("2w&3w"))
                                    {
                                    %><td>Two Wheeler and Three Wheeler</td>
                                    <%
                                    }
                                    else if(sub_category.equals("3w&4w"))
                                    {
                                    %><td>Three wheeler and Four Wheeler</td>
                                    <%
                                    }
                                    else if(sub_category.equals("2w&4w"))
                                    {
                                    %><td>Two wheeler and Four Wheeler</td>
                                    <%
                                    }
                                    else if(sub_category.equals("2w&3w&4w"))
                                    {
                                    %><td>Two wheeler, Three wheeler and Four Wheeler</td>
                                    <%
                                    }
                                    %>
                                    
                                    
                            </tr>
                            <tr>
                                    <td>Suitable for</td>
                                    <td><%=vehicle_brand %></td>
                            </tr>
                           
                        </tbody>
                    </table>
                    


                </div>
                <div class="tab-pane container fade" id="description"><%=desc %></div>
                
              </div>
             
                  
        </div>
</div>
  
    </div>
    <div class="row">
        
        <div class="col-md-1">
        </div>
        <div class="col-md-4">
            <br>
            
           <br>
           <br>
           
           <p class="no-margin">
                <button type="button" class="btn btn-default btn-circle btn-lg"><i class="fas fa-shipping-fast"></i></button>
                Shipping would be charged extra for all orders.</p>
                <br>
           <p class="no-margin">
                <button type="button" class="btn btn-default btn-circle btn-lg"><i class="fa fa-plane"></i></button>
                Products would be delivered to you within 12 hours.</p>
      
          
        
        </div>
        
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
             <br>
            
           <br>
           <br>
             <p class="no-margin">
                <button type="button" class="btn btn-default btn-circle btn-lg"><i class="fa fa-star"></i></button>
                Actual Products may vary from the image shown.</p>
        <br>    
                <p class="no-margin">
            <button type="button" class="btn btn-default btn-circle btn-lg"><i class="fa fa-phone"></i></button>
            Please call us on +91 000000000 for more details.</p>
        
            
    </div>
    
</div>

  <jsp:include page="footer.jsp"></jsp:include>
  <script language="Javascript" type="text/javascript">

function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

	function myFunction(pid,uid,qty,pr) 
	{
	
    	http.open('get', 'AddToCart.jsp?prodid='+pid+'&userid='+uid+'&quantity='+qty+'&price='+pr);
    	http.onreadystatechange = processResponse;
    	http.send(null);
	}	


function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        //document.getElementById('msg').innerHTML = response;
       alert("Added To Cart!");
       window.location.reload();
    }
}

//alert

function showAlert()
{
	alert("Please Login First..");
		
}

</script>

    </body>
</html>