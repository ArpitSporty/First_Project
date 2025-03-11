<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="mybeans.*" %>
<%@page import="java.sql.*" %>
<html>
<head>
  <script src="js/jquery-3.3.1.slim.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  
  <script language="Javascript" type="text/javascript">

/*function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest(id) {
  //  prodid=document.frm.prodid.value;
    http.open('get', 'Cookies.jsp?proid='+id);
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('cookie').innerHTML = response;
    }
}*/

</script>
  
<link href="fontawesome-free-5.6.3-web/css/all.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/mega-menu.css">
<link rel="stylesheet" href="css/search-bar.css">
<link rel="stylesheet" href="css/newarrivals.css">
<link rel="stylesheet" href="css/popup.css">
<title>TENDER MANAGEMENT</title>
    </head>
<body onpageshow="document.getElementById('modal-wrapper').style.display='block'">  
   <jsp:include page="header.jsp"></jsp:include>
  
   <jsp:include page="carousel.jsp"></jsp:include>
   
   <div id="modal-wrapper" class="modal">
  <form class="modal-content animate" action="Log.jsp">
    <div class="imgcontainer">
      <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
      <img src="1.png" alt="Avatar" class="avatar">
      <h1 style="text-align:center">LOGIN</h1>
    </div>

    <div class="container">
      <input type="text" autofocus="on" placeholder="Enter E-mail ID or Mobile no." name="emailmobile" required>
      <input type="password" placeholder="Enter Password" name="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast 1 number, 1 upper case and 1 lower case letter, and atleast 8 or more characters." required>        
      <button type="submit">Login</button>
      &nbsp;&nbsp;&nbsp;&nbsp;<a role="button" onclick="document.getElementById('modal').style.display='block'" style="margin:26px 30px; margin-top: 34px;">New Vendor?</a>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a role="button" onclick="document.getElementById('m').style.display='block'" style="text-decoration:none; margin-right:34px; margin-top:26px;">Forgot Password?</a>
    
    </div>
  </form>
       <a href="index.jsp"></a>
  
  
  <div id="modal" class="modal">
  <form class="modal-content animate" action="Reg.jsp">
    <div class="imgcontainer">
      <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
      <h1 style="text-align:center;color: #269abc">VENDOR REGISTRATION</h1>
    </div>

    <div class="container">
      <input type="text" placeholder="Enter Your Name" name="name" required>
      <input type="email" placeholder="Enter Your E-mail ID" name="email" required>
      <input type="text" placeholder="Enter Your Mobile no." name="mobile" required>
       <input type="text" placeholder="Enter Company Name" name="Company" required>
       <input type="text" placeholder="Enter Address" name="Address" required>
       <input type="text" placeholder="Enter City" name="City" >
      <input type="password" placeholder="Enter Password" name="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast 1 number, 1 upper case and 1 lower case letter, and atleast 8 or more characters." required>        
      <input type="text" placeholder="Enter OTP" name=""><a href="#">Send OTP</a>
      <button type="submit">SUBMIT</button>    
    </div>
  </form>
</div>
   
   <div id="m" class="modal">
  <form class="modal-content animate" action="Change.jsp">
    <div class="imgcontainer">
      <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
      <h1 style="text-align:center;color: #269abc">CHANGE PASSWORD</h1>
    </div>
   	<div class="container">
      <input type="text" placeholder="Enter Your Registered mobile no." name="mobile" required>
      <input type="text" placeholder="Enter OTP " name="otp" required><a href="#">Send OTP</a>
      <input type="password" placeholder="Enter Your New Password" name="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast 1 number, 1 upper case and 1 lower case letter, and atleast 8 or more characters." required>
      <input type="password" placeholder="Re-Enter Your new Password" name="cpass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast 1 number, 1 upper case and 1 lower case letter, and atleast 8 or more characters." required>        
      <button type="submit">SUBMIT</button>    
    </div>
  </form>
</div>
  
   <script>
// If user clicks anywhere outside of the modal, Modal will close

var mo = document.getElementById('modal');
window.onclick = function(event)
{
    if (event.target===mo)
    {
        mo.style.display = "none";
    }
}
</script>
  <script>
// If user clicks anywhere outside of the modal, Modal will close

var mo = document.getElementById('m');
window.onclick = function(event) {
    if (event.target === mo) {
        mo.style.display = "none";
    }
}
</script>
    
    <script>
// If user clicks anywhere outside of the modal, Modal will close

var mo = document.getElementById('modal-wrapper');
window.onclick = function(event) {
    if (event.target === mo) {
        mo.style.display = "none";
    }
}
</script>
</div>
   
   
    
        <center>
          ----------------------------------<h3>New Tenders</h3>----------------------------------
        </center>
       
       
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
        ResultSet rs=st.executeQuery("select Tenderid,Tendernm,mrp,Location,imgurl1 from tenders order by Tenderid DESC LIMIT 5;");
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
               <h6>Mrp Rs.<% out.print(mrp.get(0)); %>&nbsp;&nbsp;</h6>
               <h6> <b>Location :<% out.print(Location.get(0)); %></b></h6><br>
            
               <center><a href="" class="btn btn-success">Intrested</a></center>
             
            </div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height: 330px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
           <br>
            <center>
             <img src="<%=img.get(1) %>" height="150px" width="150px" alt="First slide">
           <a href="viewproductdetails.jsp?Tenderid=<%=Tenderid.get(1)%>"><% out.print(Tendernm.get(1)); %></a> </center>
            <h6>MRP Rs.<% out.print(mrp.get(1)); %>&nbsp;&nbsp;</h6>
            <h6> <b>Location :<% out.print(Location.get(1)); %></b></h6><br>
            <center><a href="" class="btn btn-success">Intrested</a></center>
               
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height: 330px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
           <br>
            <center>
             <img src="<%=img.get(2) %>" height="150px" width="150px" alt="First slide">
              <a href="viewproductdetails.jsp?Tenderid=<%=Tenderid.get(2)%>"> <% out.print(Tendernm.get(2)); %></a> </center>
              <h6>MRP Rs.<% out.print(mrp.get(2)); %>&nbsp;&nbsp;</h6>
              <h6> <b>Location :<% out.print(Location.get(2)); %></b></h6><br>
              <center><a href="" class="btn btn-success">Intrested</a></center>
                </div>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height:330px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
             <br>
              <center>
               <img src="<%=img.get(3) %>" height="150px" width="150px" alt="First slide">
              <a href="viewproductdetails.jsp?Tenderid=<%=Tenderid.get(3)%>"> <% out.print(Tendernm.get(3)); %></a> </center>
                 <h6>MRP Rs.<% out.print(mrp.get(3)); %>&nbsp;&nbsp;</h6>
                 <h6> <b>Location :<% out.print(Location.get(3)); %></b></h6><br>
                 <center><a href="" class="btn btn-success">Intrested</a></center>
               <br>
               
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div style="background-color:whitesmoke;height: 330px"  class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
               <br>
                <center>
                 <img src="<%=img.get(4) %>" height="150px" width="150px" alt="First slide">
               <a href="viewproductdetails.jsp?Tenderid=<%=Tenderid.get(4)%>"><% out.print(Tendernm.get(4)); %></a> </center>
                  <h6>MRP Rs.<% out.print(mrp.get(4)); %>&nbsp;&nbsp;</h6>
                   <h6> <b>Location :<% out.print(Location.get(4)); %></b></h6><br>
                  <center><a href="" class="btn btn-success">Intrested</a></center>
               
              
        
          
        </div>
       <% }
        catch(Exception e)
        {
        	out.print(e);
        }
        
        %>
       
   </div>
           
   <jsp:include page="footer.jsp"></jsp:include>
 
    
</body>
</html>