<%-- 
    Document   : Log
    Created on : May 3, 2019, 11:48:03 PM
    Author     : W10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%@page import="mybeans.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       
            String emailmobile,pass,type;
           
            
                  
                  PreparedStatement pst;
                  ResultSet rs;
              try
              {
            	  emailmobile=request.getParameter("emailmobile");
                   pass=request.getParameter("pass");
                   String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);

                   
                   //DBConnector dbc=new DBConnector();.
                   
                   
                  // con=dbc.getDbconnection();
                   
                   pst=con.prepareStatement("select * from users where email=? or mobile=? and password=?;");
                   pst.setString(1,emailmobile);
                   pst.setString(2,emailmobile);
                   pst.setString(3,pass);
                   
                   rs=pst.executeQuery();
				if(rs.next())
				{
					type=rs.getString("usertype");
					HttpSession ses=request.getSession(true);
                                        ses.setAttribute("name", rs.getString("name"));
                                        ses.setAttribute("userid",rs.getLong("userid"));
                                        
                                        
					if(type.equals("customer"))
						response.sendRedirect("CustHome.jsp");
					
					else if(type.equals("admin"))
						response.sendRedirect("Admin/adminhomepage.jsp");
                  }
                  else
                  {
                      response.sendRedirect("Sorry.jsp");
                  }
                      con.close();
                  
              }
              catch(Exception ex)
              {
              		System.out.println("Error :"+ex.getMessage());
              }


            
        %>
    </body>
</html>
