<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="mybeans.*" %>
<%@page import="java.sql.*" %>
<html>
<head>
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

<title>TENDER MANAGEMENT SYSTEM</title>
    </head>
<body>  
<jsp:include page="header.jsp"></jsp:include>
    
        <center>
          ----------------------------------<h3>New Tenders</h3>----------------------------------
        </center>
            
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
       alert("Added To Intrested List!");
       window.location.reload();
    }
}


</script>

      

        <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");
        
      if(session.getAttribute("userid")==null)
        {
      	  response.sendRedirect("index.jsp");
        }
        

    
        
        try
        {
        	ArrayList<Integer> Tenderid=new ArrayList<Integer>();
        	ArrayList<String> Tendernm=new ArrayList<String>();
        	ArrayList<String> img=new ArrayList<String>();
        	ArrayList<Integer> mrp=new ArrayList<Integer>();
        	ArrayList<String> Location=new ArrayList<String>();
        String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
        Statement st=con.createStatement();
        PreparedStatement pst;
        
        long tenderid=0;
        ResultSet rs=st.executeQuery("select Tenderid,Tendernm,mrp,Location,imgurl1 from tenders order by Tenderid DESC LIMIT 10;");
        while(rs.next())
    	{
    		Tenderid.add(rs.getInt(1));
    		Tendernm.add(rs.getString(2));
    		mrp.add(rs.getInt(3));
    		
    		Location.add(rs.getString(4));
                img.add(rs.getString(5));
    	}
        	
        %>
        <div class="container">
          <div class="row newarrivals">
            
            <div style="background-color:whitesmoke;height: 330px"  class="col-xs-3 col-sm-2 col-md-2 col-lg-2">
            <br>
             <center>    <img src="<%=img.get(0)%>" height="150px" width="150px" alt="produt 1">
               
               <a href="viewproductdetails.jsp?Tenderid=<%=Tenderid.get(0)%>"><% out.print(Tendernm.get(0)); %></a></center>
               <h6>Bid Amount<% out.print(mrp.get(0)); %>&nbsp;&nbsp;</h6>
               <h6> <b>Location :<% out.print(Location.get(0)); %></b></h6><br>
            
               <center><a href="javascript:myFunction(<%=Tenderid.get(0)%>,<%=session.getAttribute("userid").toString() %>,1,<% out.print(mrp.get(0)); %>)" class="btn btn-success">Intrested</a></center>
             
            </div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height: 330px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
           <br>
            <center>
             <img src="<%=img.get(1) %>" height="150px" width="150px" alt="First slide">
           <a href="viewproductdetails.jsp?Tenderid=<%=Tenderid.get(1)%>"><% out.print(Tendernm.get(1)); %></a> </center>
            <h6>Bid Amount<% out.print(mrp.get(1)); %>&nbsp;&nbsp;</h6>
            <h6> <b>Location :<% out.print(Location.get(1)); %></b></h6><br>
            <center><a href="javascript:myFunction(<%=Tenderid.get(1)%>,<%=session.getAttribute("userid").toString() %>,1,<% out.print(mrp.get(1)); %>)" class="btn btn-success">Intrested</a></center>
               
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height: 330px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
           <br>
            <center>
             <img src="<%=img.get(2) %>" height="150px" width="150px" alt="First slide">
              <a href="viewproductdetails.jsp?Tenderid=<%=Tenderid.get(2)%>"> <% out.print(Tendernm.get(2)); %></a> </center>
              <h6>Bid Amount<% out.print(mrp.get(2)); %>&nbsp;&nbsp;</h6>
              <h6> <b>Location :<% out.print(Location.get(2)); %></b></h6><br>
              <center><a href="javascript:myFunction(<%=Tenderid.get(2)%>,<%=session.getAttribute("userid").toString() %>,1,<% out.print(mrp.get(2)); %>)" class="btn btn-success">Intrested</a></center>
                </div>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height:330px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
             <br>
              <center>
               <img src="<%=img.get(3) %>" height="150px" width="150px" alt="First slide">
              <a href="viewproductdetails.jsp?Tenderid=<%=Tenderid.get(3)%>"> <% out.print(Tendernm.get(3)); %></a> </center>
                 <h6>Bid Amount<% out.print(mrp.get(3)); %>&nbsp;&nbsp;</h6>
                 <h6> <b>Location :<% out.print(Location.get(3)); %></b></h6><br>
                 <center><a href="javascript:myFunction(<%=Tenderid.get(3)%>,<%=session.getAttribute("userid").toString() %>,1,<% out.print(mrp.get(3)); %>)" class="btn btn-success">Intrested</a></center>
               <br>
               
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height: 330px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
               <br>
                <center>
                 <img src="<%=img.get(4) %>" height="150px" width="150px" alt="First slide">
               <a href="viewproductdetails.jsp?Tenderid=<%=Tenderid.get(4)%>"><% out.print(Tendernm.get(4)); %></a> </center>
                  <h6>Bid Amount<% out.print(mrp.get(4)); %>&nbsp;&nbsp;</h6>
                   <h6> <b>Location :<% out.print(Location.get(4)); %></b></h6><br>
                  <center><a href="javascript:myFunction(<%=Tenderid.get(4)%>,<%=session.getAttribute("userid").toString() %>,1,<% out.print(mrp.get(4)); %>)" class="btn btn-success">Intrested</a></center>
               
              
        
          
        </div>
       <% }
        catch(Exception e)
        {
        	out.print(e);
        }
        
        %>
       
   </div>
         
         <br>
        <br>
          
          

        <%
        try
        {
      ArrayList<Integer> Tenderid=new ArrayList<Integer>();
        	ArrayList<String> Tendernm=new ArrayList<String>();
        	ArrayList<String> img=new ArrayList<String>();
        	ArrayList<Integer> mrp=new ArrayList<Integer>();
        	ArrayList<String> Location=new ArrayList<String>();
        String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
        Statement st=con.createStatement();
        PreparedStatement pst;
        
        long tenderid=0;
        ResultSet rs=st.executeQuery("select Tenderid,Tendernm,mrp,Location,imgurl1 from tenders order by Tenderid DESC LIMIT 10;");
        while(rs.next())
    	{
    		Tenderid.add(rs.getInt(1));
    		Tendernm.add(rs.getString(2));
    		mrp.add(rs.getInt(3));
    		
    		Location.add(rs.getString(4));
                img.add(rs.getString(5));
    	}
        %>
        <div class="container">
          <div class="row newarrivals">
            <%
            	for(int i=5;i<Tenderid.size();i++)
            	{
            %>
            <div style="background-color:whitesmoke;height: 320px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            <br>
             <center>    <img src="<%=img.get(i) %>" height="150px" width="150px" alt="First slide">
              
               <br>
               <a href="viewproductdetails.jsp?prodid=<%=Tenderid.get(i)%>"><% out.print(Tendernm.get(i)); %></a></center>
               <h6>Bid Amount <%out.print(mrp.get(i));%></h6>
               <h6> <b>Location :<% out.print(Location.get(i)); %></b></h6><br>
               <center><a href="javascript:myFunction(<%=Tenderid.get(i)%>,<%=session.getAttribute("userid").toString() %>,1,<% out.print(mrp.get(1)); %>)" width="100%" class="btn btn-success">Intrested</a></center>
                
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
           <%
            	}
           %>
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