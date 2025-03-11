<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%@page import="mybeans.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/global.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/dropdownmenu.js" type="text/javascript"></script>
        <script src="js/jquery-3.3.1.slim.min.js"></script>
  <script src="js/popper.min.js"></script>
  <link rel="stylesheet" href="css/popup.css">
  <script src="js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
    <jsp:include page="header.jsp"></jsp:include>
        <center>
        <br>
        <br>
        <br>
        <%
             String mobile,pass,cpass;
             int cnt;
             
                  PreparedStatement pst;
                  ResultSet rs;
                  
                      mobile=request.getParameter("mobile");
                      pass=request.getParameter("pass");
                      cpass=request.getParameter("cpass");
                      
                  try
                  {
	                     String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);        
	                      
	                   if(pass.equals(cpass))
	                   {
		                   pst=con.prepareStatement("select * from users where mobile=?;");
		                   pst.setString(1,mobile);
		                   rs=pst.executeQuery();
								if(rs.next())
								{
				                                    pst=con.prepareStatement("update users set password=? where mobile=?;");
				                                    pst.setString(1,pass);
				                                    pst.setString(2,mobile);
				                                    cnt=pst.executeUpdate();
				                                    
				                                    if(cnt>0)
				                                    {
				                                    	%>
				                                    	<script>alert("Password Changed Successfully..");</script>
				                                    	<a href="CustHome.jsp" role="button" class="btn btn-primary">Done</a>
				                                    	<%
				                                    }
				                                    else{
				                     			       	%>
				                     			       	<script>alert("Password not Changed..");</script>
				                     			       	<a href="ChangePass.jsp" role="button" class="btn btn-primary">Back</a>
				                     			       	<%
				                                    }
				               	}
		                        else
		                       	{
		                        	%><script>alert("Something went wrong... Please try again..");</script><%;
		                        }
	                                
	                   
	                   }  
	                   else
	                   {
	                    response.sendRedirect("Fail.jsp");
	                   }
                  }
                  catch(Exception ex)
                  {
                  	System.out.println("Error :"+ex.getMessage());
                  }
        %>
        <br>
        <br>
</center>
        
        <jsp:include page="footer.jsp"></jsp:include>
        
    </body>
</html>
