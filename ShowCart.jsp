<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="mybeans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <script src="js/jquery-3.3.1.slim.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link href="fontawesome-free-5.6.3-web/css/all.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <link href="fontawesome-free-5.6.3-web/css/all.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/mega-menu.css">
        <link rel="stylesheet" href="css/search-bar.css">
        <link rel="stylesheet" href="css/newarrivals.css">
        <link rel="stylesheet" href="css/global.css">
        

       <script>
         function getTotal()
          { 
        var quant=parseInt(document.getElementById("ddquant").value);
         var itmprice=parseDouble(document.getElementsByid("txtPrice").value);
        var total=quant*itmprice;
        document.getElementsByid("txtPrice").value=total;
    
           }
        </script>

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

function makeGetRequest(pid,uid) {
	
	//var id=document.getElementById("apid").value;
	var r=confirm("Remove Tender!");
	if(r === true)
	{
    	http.open('get', 'DeleteFromCart.jsp?Tenderid='+pid+'&userid='+uid);
    	http.onreadystatechange = processResponse;
    	http.send(null);
	}	
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        //document.getElementById('msg').innerHTML = response;
       alert("Tender Removed!");
       window.location.reload();
    }
}

//increase quantity and price

function updateQty(qty,pid,uid)
{
	http.open('get', 'CartIncreaseQty.jsp?qty='+qty+'&uid='+uid+'&pid='+pid);
	http.onreadystatechange = increseValue;
	http.send(null);
}
function increseValue() {
    if(http.readyState == 4){
        var response = http.responseText;
        //document.getElementById('msg').innerHTML = response;
        window.location.reload();
      
    }
}








	
	
</script>


</head>
<body>
    <div class="fixheader" id="fixheader">
        <jsp:include page="header.jsp"></jsp:include>
       </div>
     
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");

if(session.getAttribute("userid")==null)
{
	  response.sendRedirect("index.jsp");
}
ShowCount sc=new ShowCount();
long uid=Long.valueOf(session.getAttribute("userid").toString());
sc.setCustid(uid);
sc.execute();

GetItemsFromCart get=new GetItemsFromCart();
get.setUserid(uid);

session.setAttribute("userid",uid);
%>
	
<br>

<div style="margin-left:50px;margin-right:50px">
<div class="row">

<br>


    <div class="col-lg-6">
        <h5>Your Intrested Tenders are[<%=sc.getCartcounter() %>]</h5>
   
    </div>
    
   
</div>

	<hr>
	<div class="row">

<br>


    <div class="col-lg-8">
     
	<table class="table table-bordered table-hover">
	<%
		for(int i=0;i<get.getTenderid().size();i++)
		{
	%>
	
	<tbody>
		<tr>
			<td><input type="hidden" value="<%=get.getTenderid().get(i)%>"/>
			<div class="row">
			 <div class="col-lg-3">
     
					<img src="Admin/<%=get.getImage().get(i)%>" height="125px" width="125px"/>
	</div>
			 <div class="col-lg-5">
     
	
				<%=get.getTendernm().get(i)%><br>
	
                  <script>
		//document.getElementById("ddquant<%//=i %>").value="<%//out.print(get.getQty().get(i));%>";
	</script>
				
                               <br>
                                
				Location:
				<lable name="price"><%=get.getLocation().get(i) %></lable> 
                                
                                <br>
                            
				Price:
				<lable name="price"><%=get.getMrp().get(i) %></lable>
			<br>
			<br>
				<a href="viewproductdetails.jsp?Tenderid=<%=get.getTenderid().get(i)%>" class="btn btn-primary">View Details</a>	
			</div>
			</div>
			</td>
			<td>
			<br>
                        
			<center><button onclick="javascript:makeGetRequest(<%=get.getTenderid().get(i)%>,<%=uid%>)" class="btn btn-danger"><i class="fas fa-trash"></i></button></center>
			</td>
                        <td><br>
                            <center>
                            <%
			if(sc.getCartcounter()>0)
			{
		%>
			<a href="FinalCart.jsp?Tenderid=<%=get.getTenderid().get(i)%>" role="button" class="btn btn-success">Bid Tender</a></td>
		<%
			}
			else
			{	
			%>
				<a href="javascript:cartEmpty()" role="button" class="btn btn-success">Bid Tender</a></td>
			<%
			}
		%>
                            </center>
                            </td>
		</tr>
	</tbody>
	<%
		}
	%>
</table>
	
	</div>
	
	</div>
	<br/><br/><br/><br/>

	<script type="text/javascript">
	var prc=document.getElementsByName("price");
	var sum=0;
	for(var i=0;i<prc.length;i++)
	{
			sum+=parseFloat(prc[i].innerHTML);
	}
	document.getElementById("carttot").innerHTML=sum;
	document.getElementById("total").innerHTML=sum+40;
	if(sum>499)
	{
		document.getElementById("charge").innerHTML="Free Delievery!";
	}
	else
	{
		document.getElementById("charge").style.color="crimson";
		document.getElementById("charge").innerHTML="Free Delivery on Order Above Rs.499/-";
	}
	
	//Cart is Empty
	
	function cartEmpty()
	{
		alert("Your Cart is Empty!");
	}
	
	</script>
	 
	
	
</center>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>