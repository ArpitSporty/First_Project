<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
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
  <script src="js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/popup.css">
 
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

function makeGetRequest() {
    userid=document.getElementById("userid").value;
    //name=document.frm.name.value;
    name=document.getElementById("name").value;
    email=document.getElementById("email").value;
    mobile=document.getElementById("mobile").value;
    address=document.getElementById("address").value;
    
    city=document.getElementById("city").value;
    
    http.open('get', 'UpdateProfile.jsp?userid='+userid+'&name='+name+'&email='+email+'&mobile='+mobile+'&address='+address+'&city='+city);
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        alert("Profile Updated successfully...");
        window.location.reload();
        //document.getElementById('profile').innerHTML = response;
    }
}
</script>  
<script lang="javascript">
function calNum(mobile)
{
	if(isNaN(mobile))
		{
			alert("Enter number only...");
		}
}
</script>      
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<center>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");

if(session.getAttribute("userid")==null)
{
	  response.sendRedirect("index.jsp");
}


	String userid=session.getAttribute("userid").toString();
	%>
	<input type="hidden" id="userid" value="<%=userid%>">
	
	<%
	try{
            PreparedStatement pst;
	     ResultSet rs;
             String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid1 ="root";
String password ="";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid1, password);
        
        pst=con.prepareStatement("select * from users where userid=?;");
        pst.setString(1,userid);
        rs=pst.executeQuery();
        if(rs.next())
        {
%>
       <div class="col-lg-4" align="left"></div>
        <div class="col-lg-6" align="center">
            
                <h1 style="color: #269abc">Update Profile</h1>
            <form name="frm" class="form-group">
                <table class="table">
                	<tr>
                		<td>Your Name</td>
                		<td><input type="text" id="name" width="90%" autocomplete="off" value="<%=rs.getString("name") %>"  class="form-control" required></td>
                		<td>
                	</tr>
                	<tr>
                		<td>Your E-MAIL ID</td>
                		<td><input type="email" id="email" autocomplete="off" value="<%=rs.getString("email") %>"  class="form-control" required></td>
                		<td>
                	</tr>
                    <tr>
                        <td>Your Mobile no.</td>
                        <td><input type="text" id="mobile" onforminput="calNum(this.value)" autocomplete="off" value="<%=rs.getLong("mobile") %>" class="form-control" maxlength="10" required></td>
                        <td></td>
                    </tr>
                    
                    <tr>
                        <td>Your Address</td>
                        <td><input type="text" id="address" autocomplete="off" value="<%=rs.getString("address") %>" class="form-control" required></td>
                        <td></td>
                    </tr>
                   
                    <tr>
                        <td>City</td>
                        <td><input type="text" id="city" autocomplete="off" value="<%=rs.getString("city") %>" class="form-control" required></td>
                        <td></td>
                    </tr>
                    
                    <tr>
                        <td>Company Name</td>
                        <td><input type="text" id="pincode" autocomplete="off" value="<%=rs.getString("companyName") %>" class="form-control" required></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="button" onclick="makeGetRequest()" value="Update" class="btn btn-success"></td>
                        <td><a role="button" value="Back" href="CustHome.jsp" class="btn btn-primary">Back</a></td>
                    </tr>
                </table>
            </form>    
           </div>
		
	<%
        }
	}
	catch(Exception ex){
		System.out.print("Error:"+ex.getMessage());
	}
	
%>

</center>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>