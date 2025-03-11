<%@page import="mybeans.*" %>
       
   <div class="fixheader" id="fixheader">
       <br>
   <hr>    
<div class="row header">
    <%
    	if(session.getAttribute("userid") != null)
    	{
    %>
    <div class=" col-xs-2 col-sm-2 col-md-2 col-lg-2">
    <center> <a href="CustHome.jsp"><img src="images/tender logo.jpg" height="70px" width="200px" alt="Tender"/></a>
    </center>
    </div>
     <%
    	}
    	else
    	{
    		%>
    		 <div class=" col-xs-2 col-sm-2 col-md-2 col-lg-2">
   			 <center> <a href="#"><img src="images/tender logo.jpg" height="70px" width="200px" alt="tender"/></a>
  			  </center>
   				 </div>
    		<%
    	}
     %>
   <div class="col-md-5">
      <form name="frm" method="post" action="SearchViaButton.jsp">
    <div class="input-group md-form form-sm form-2 pl-0">
       <input class="form-control my-0 py-1 red-border" type="text" list="ss" name="searchitem" placeholder="Search" onkeyup="javascript:searchKeyword(this.value)" aria-label="Search">
      <div class="input-group-append">
     <span class="input-group-text red lighten-3" id="basic-text1"><button type="submit"><i class="fas fa-search text-grey" aria-hidden="true"></i></button></span>
       
      </div>
    </div>
</form>
 
    <datalist id="ss">
    <div id="res"></div>
    </datalist>

  </div>
    

<div style="color:indianred" class="col-sm-2">
    <center> <h6> <i class="fas fa-phone"></i>  
    <a style="color:indianred" href="tel:1800-789-9045">Help Is Here<br>1800-789-9045</a>
  </h6></center>
</div>

<%
	if(session.getAttribute("name")==null)
	{
	%>
		
<div class="col-lg-1">
 <h6 style="color:indianred">
    <i class="fas fa-user"></i>
        <a style="color:indianred" href="#" onclick="document.getElementById('modal-wrapper').style.display='block'">Sign In<br/>New User?</a>
      </h6>
      </div>  
    
	<%	
	}
	else
	{
		%>
			
<!-- <div class="col-lg-1">
 <h6 style="color:indianred">
    <i class="fas fa-user"></i>
        <a style="color:indianred" href="">Welcome <%=session.getAttribute("name").toString() %><br/>New User?</a>
      </h6>
      </div> -->
  <div class="col-lg-1 nav-item dropdown">
 <h6 style="color:indianred">
   
    <a class="nav-link dropdown-toggle" style="color:indianred" data-toggle="dropdown" role="button" href="#"><i class="fas fa-user"></i></i>Welcome <%=session.getAttribute("name").toString() %></a>
                	<div class="dropdown-menu">
                	<h6><a class="dropdown-item" style="color:black;" href="MyAccount.jsp?userid="<%=session.getAttribute("userid") %>>My Account</a></h6>
                	
                       <h6><a class="dropdown-item" style="color:black;" href="MyOrders.jsp?userid="<%=session.getAttribute("userid") %>>My Bids</a></h6>
                           	
                       <h6><a class="dropdown-item" style="color:black;" href="ChangePass.jsp?userid="<%=session.getAttribute("userid") %>>Change Password</a></h6>
                 		 <h6><a class="dropdown-item" style="color:black;" href="logout.jsp">Logout</a></h6>
               		 </div>
               		 </h6>
                 </div>
		<%
	}
%>
        
<%
	if(session.getAttribute("name")==null)
	{
	%>
        
   <div style="color:indianred" class="col-lg-1">
        <h5></i>
            <a style="color:indianred" href="#" onclick="document.getElementById('modal-wrapper').style.display='block'">Intrested Tenders(0)</a>
          </h5>
          </div> 
    
    
	<%	
	}
	else
	{
		
		ShowCount sc=new ShowCount();
		//String uid=session.getAttribute("userid").toString();
		sc.setCustid(Long.valueOf((String.valueOf(session.getAttribute("userid")))));
		sc.execute();
		%>
			
        
    <div style="color:indianred" class="col-lg-1">
        <h5><i class="fas fa-shopping-cart"></i><a style="color:indianred" href="ShowCart.jsp?userid=<%=session.getAttribute("userid").toString()%>">Intrested Tenders</a>(<%=sc.getCartcounter() %>)</h5>
          </div>  
    
    
		<%
	}
%>
            
</div>

</div>
<hr>    

    
  
   <nav class="navbar navbar-expand-lg navbar-light  bg-light">
    <div class="container">
    <%
    if(session.getAttribute("userid")==null)
	{
    %>
    <a class="navbar-brand" href="index.jsp">Home</a>
    <%
	}
	else
	{
		%>
		 <a class="navbar-brand" href="CustHome.jsp">Home</a>
		<%
	}
 %>
  
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
     <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto w-10 justify-content-end">
     
          <li class="nav-item dropdown">
            <a style="color: black" class="nav-link dropdown-toggle navbar-brand" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Tenders By Category
            </a>
            <div class="dropdown-menu mega-menu" aria-labelledby="navbarDropdown">
              <% 
             ShopByCategory cat=new ShopByCategory();
              cat.getAllCategory();
              %>
              <div class="row">
                
                <div class="col-xs-12">
                  <ul style="list-style-type: none">
                   <% for(int i=0;i<cat.getCatnm().size();i++){ %>
                    <li><a href="SearchViaButton.jsp?searchitem=<%out.println(cat.getCatnm().get(i)); %> in Categories"><%out.println(cat.getCatnm().get(i)); %></a></li>
                   <%} %>
                  </ul>
                  
                </div>
                
              </div>
              
            </div>
          </li>
        </ul>
  
   
  
   <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">        
          <li>        
         <a class="navbar-brand" href="aboutus.jsp">About Us</a>
        </li>
  <li><a class="navbar-brand" href="contactus.jsp">Contact Us</a></li>
        </ul>  
    
  </div>
  
  
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
    </nav>
    
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

function searchKeyword(s) {
  //  prodid=document.frm.prodid.value;
    http.open('get', 'SearchKeyword.jsp?search='+s);
    http.onreadystatechange = getResponse;
    http.send(null);
}

function getResponse() {
    if(http.readyState === 4){
        var response = http.responseText;
       document.getElementById("res").innerHTML = response;
      //  document.getElementById("ss").autocomplete=+response;
    }
}

</script>
</div>
