<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="java.sql.*,mybeans.*,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="js/jquery-3.3.1.slim.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <link href="fontawesome-free-5.6.3-web/css/all.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/mega-menu.css">
<link rel="stylesheet" href="css/search-bar.css">
<link rel="stylesheet" href="css/newarrivals.css">
<link rel="stylesheet" href="css/popup.css">
<title>Insert title here</title>
</head>
<body>
<div id="modal-wrapper" class="modal">
  <form class="modal-content animate" action="Log.jsp">
    <div class="imgcontainer">
      <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
      <img src="1.png" alt="Avatar" class="avatar">
      <h1 style="text-align:center">LOGIN</h1>
    </div>

    <div class="container">
      <input type="text" placeholder="Enter E-mail ID or Mobile no." name="emailmobile" required>
      <input type="password" placeholder="Enter Password" name="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast 1 number, 1 upper case and 1 lower case letter, and atleast 8 or more characters." required>        
      <button type="submit">Login</button>
      &nbsp;&nbsp;&nbsp;&nbsp;<a role="button" onclick="document.getElementById('modal').style.display='block'" style="margin:26px 30px; margin-top: 34px;">New User?</a>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a role="button" onclick="document.getElementById('m').style.display='block'" style="text-decoration:none; margin-right:34px; margin-top:26px;">Forgot Password?</a>
    
    </div>
  </form>
  
  
  <div id="modal" class="modal">
  <form class="modal-content animate" action="Reg.jsp">
    <div class="imgcontainer">
      <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
      <h1 style="text-align:center;color: #269abc">REGISTRATION FORM</h1>
    </div>

    <div class="container">
      <input type="text" placeholder="Enter Your Name" name="name" required>
      <input type="email" placeholder="Enter Your E-mail ID" name="email" required>
      <input type="text" placeholder="Enter Your Mobile no." name="mobile" required>
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
window.onclick = function(event) {
    if (event.target === mo) {
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



<%
//String searchitem="";
	String s=request.getParameter("searchitem");
	String searchitem;
	if(s.indexOf("in")>0)
	{
		int ioin=s.indexOf("in");
		searchitem=s.substring(0,ioin-1);
		//out.print(searchitem);
	}
	else
	{
		searchitem=request.getParameter("searchitem");
	}


Statement st;
PreparedStatement pst;
ResultSet rs;

ArrayList<Integer> Tenderid=new ArrayList<Integer>();
ArrayList<String> Tendernm=new ArrayList<String>();
ArrayList<String> Location=new ArrayList<String>();
ArrayList<String> img=new ArrayList<String>();
ArrayList<Integer> mrp=new ArrayList<Integer>();


try
{
	if(!searchitem.equals(""))
	{
		String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
		st=con.createStatement();
		rs=st.executeQuery("select tenders.Tenderid,tenders.imgurl1,tenders.Tendernm,tenders.mrp,tenders.Location from tenders inner join prod_cat on tenders.catid=prod_cat.catid where tenders.Tendernm like '"+searchitem+"%' or Tenders.mrp like '%"+searchitem+"%' or tenders.Location like '%"+searchitem+"%' or prod_cat.catnm like '%"+searchitem+"%';");
		while(rs.next())
		{
			Tenderid.add(rs.getInt("Tenderid"));
    		Tendernm.add(rs.getString("Tendernm"));
    		mrp.add(rs.getInt("mrp"));
    		Location.add(rs.getString("Location"));
    		img.add(rs.getString("imgurl1"));
		}
		}	
}
catch(Exception ex)
{
	System.out.println("EROOR: "+ex.getMessage());
}

	
%>
<jsp:include page="header.jsp"></jsp:include><br/>
<h5 align="center">Search result for "<%=s %>"</h5>
<!-- <h5 align="right">Sort : <select id="sort" onchange="sortProducts(this.options[this.selectedIndex].value)"><option selected>--sort--</option><option value="low">Low To High</option><option value="High">High To Low</option><option value="new">New Arrivals</option></select></h5> -->
<br/><br/>
<div class="container">
	<div  class="row">
	<div class="col-md-3">
		
	</div>
	<div id="filter" class="col-md-9">
          <div class="row newarrivals">
            <%
            	for(int i=0;i<Tenderid.size();i++)
            	{
            		
           
            %>
            <div style="background-color:whitesmoke;height: 320px"  class="col-xs-3 col-sm-2 col-md-2 col-lg-2">
            <br>
             <center>    <img src="<%=img.get(i)%>" height="150px" width="150px" alt="First slide">
               
               <a href="viewproductdetails.jsp?Tenderid=<%=Tenderid.get(i)%>"><% out.print(Tendernm.get(i)); %></a>
               <h6>Bid Amount :<% out.print(mrp.get(i)); %></h6>
                <b>Location<% out.print(Location.get(i)); %></b></center>
               <%
               		if(session.getAttribute("userid")==null)
               		{
               %>
               			<center><a onclick="document.getElementById('modal-wrapper').style.display='block'" class="btn btn-success">Add To Cart</a></center>
      			<%
               		}
               		else
               		{	
       			%>
       					<center><a onclick="javascript:myFunction(<%=Tenderid.get(i)%>,<%=session.getAttribute("userid").toString() %>,1,<% out.print(mrp.get(i)); %>)" class="btn btn-success">Intrested</a></center>
       			<%
               		}
       			%>
              
               
            </div>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <%
            	}
          %>
        </div>
        </div>
        </div>
        </div>
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

//filter products on radio btn------- Product brands

function radioChanged(brand)
{
	var totse=document.getElementById("se").value;
	var si=document.getElementById("search").value;
	http.open('get', 'FilterProducts.jsp?brand='+brand+'&si='+si+'&totse='+totse);
	http.onreadystatechange = filterResponse;
	http.send(null);
}
function filterResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById("filter").innerHTML = response;
    }
}


//filter products on radio btn ---- vehical Brands

function radioChangedVeh(brand)
{
	var totse=document.getElementById("se").value;
	var si=document.getElementById("search").value;
	http.open('get', 'FilterProductsOnVehBrand.jsp?brand='+brand+'&si='+si+'&totse='+totse);
	http.onreadystatechange = filterResponse;
	http.send(null);
}
function filterResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById("filter").innerHTML = response;
    }
}


//Sort Products//////

function sortProducts(s)
{
	var totse=document.getElementById("se").value;
	var si=document.getElementById("search").value;
	var brand=document.getElementById("fil").value;
	var vehbrand=document.getElementById("veh").value;
	http.open('get', 'SortProducts.jsp?sort='+s+'&si='+si+'&totse='+totse+'&brand='+brand+'&vehbrand='+vehbrand);
	http.onreadystatechange = sortResponse;
	http.send(null);
}
function sortResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById("filter").innerHTML = response;
    }
}


</script>
        
  <br>
      <br>
<hr>
    
   <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>