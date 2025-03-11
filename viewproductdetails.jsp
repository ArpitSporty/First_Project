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
    long Tenderid=Long.parseLong(request.getParameter("Tenderid"));

    session.setAttribute("Tenderid",Tenderid);
    
    String Tendercat="",Tendernm="",Location="",deadline="",imgpath1="",imgpath2="",imgpath3="",imgpath4="",desc="",prodcat="";
    int mrp=0,catid=0,count=0;
    try
    {
    	 String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
         PreparedStatement pst=con.prepareStatement("Select * from tenders where Tenderid=?");
         pst.setLong(1, Tenderid);
         ResultSet rs=pst.executeQuery();
         while(rs.next())
         {
        	 Tendernm=rs.getString("Tendernm");
        	 mrp=rs.getInt("mrp");
        	  Location=rs.getString("Location");
                  deadline=rs.getString("deadline");
        	 imgpath1=rs.getString("imgurl1");
        	 imgpath2=rs.getString("imgurl2");
        	 imgpath3=rs.getString("imgurl3");
        	 imgpath4=rs.getString("imgurl4");
        	 desc=rs.getString("proddisc");
        	 
        	// sub_category=rs.getString("subcat");
        	 
        	 catid=rs.getInt("catid");
         }
         
         
    }
    catch(Exception e)
    {
    	out.print(e);
    }
    
    
    %>
        
    <div class="row">
        
        <div class="col-md-1">
        </div>
        <div class="col-md-4">
        Home <%=Tendernm %>
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

        <br>
    <br>
    <h4><%=Tendernm %></h4>
    <h4>Bid Amount: Rs.<%=mrp %>&nbsp;&nbsp;</h4>




&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
<br>
Its a Minimum Amount to Bid the Tender
<br>
Location for the Project is:
<br>
<%=Location%> <br>
<span style="color:red">**Tenders Deadline is<%=deadline%>  </span>
<hr>

<h5 style="color:green"> </h5>
<%try
    {
    	 String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
         PreparedStatement pst=con.prepareStatement("Select * from prod_cat where catid=?");
         pst.setInt(1, catid);
         ResultSet rs=pst.executeQuery();
         while(rs.next())
         {
        	 prodcat=rs.getString("catnm");
        	 
        	  }
         
         
    }
    catch(Exception e)
    {
    	out.print(e);
    }

%>
<span style="color:green">**Tenders Category is :<%= prodcat%></span>

  <hr>           
<br>
	<%
		if(session.getAttribute("userid") != null)
		{
	%>
			<a href="javascript:myFunction(<%=Tenderid%>,<%=session.getAttribute("userid").toString() %>,1,<%=mrp%>)" class="btn btn-success">Intrested</a> &nbsp;&nbsp <a href="javascript:myFunction(<%=Tenderid%>,<%=session.getAttribute("userid").toString() %>,1,<%= mrp%>)" class="btn btn-danger">Bid</a>
	<%
		}
		else
		{
			%>
			<a href="javascript:showAlert()" class="btn btn-success">Intrested</a> &nbsp;&nbsp <a href="javascript:showAlert()" class="btn btn-danger">Bid</a>
			<%
		}
	%>

<br><br>100% Authentic Tenders.
<br>
<hr>
<br>

            <h4>Description</h4><br>
            
              
                    
<%=desc %>
                 
             
                  
        

             
                  
       
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
                Get tenders from right source.</p>
                <br>
           <p class="no-margin">
                <button type="button" class="btn btn-default btn-circle btn-lg"><i class="fa fa-plane"></i></button>
                Bidding Support.</p>
      
          
        
        </div>
        
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
		   
             <br>
            
           <br>
           <br>
             <p class="no-margin">
                <button type="button" class="btn btn-default btn-circle btn-lg"><i class="fa fa-star"></i></button>
                Free Registration.</p>
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
    if(http.readyState === 4){
        var response = http.responseText;
        //document.getElementById('msg').innerHTML = response;
       alert("Added To Intrested Tenders!");
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