<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="java.sql.*,mybeans.*" %><%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String brand=request.getParameter("brand");
	String searchitem=request.getParameter("si");
	String totse=request.getParameter("totse");
	String bnd=request.getParameter("bnd");
	

ArrayList<Integer> prodid=new ArrayList<Integer>();
ArrayList<String> prodnm=new ArrayList<String>();
ArrayList<String> img=new ArrayList<String>();
ArrayList<Integer> mrp=new ArrayList<Integer>();
ArrayList<Integer> sellingprice=new ArrayList<Integer>();

	
	
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
		DBConnector dbc=new DBConnector();
		con=dbc.getDbconnection();
		
	
		if(totse.contains("Products"))
		{
			pst=con.prepareStatement("select * from products where brand=? and catid=(select catid from products where prodnm=?);");
			pst.setString(1, brand);
			pst.setString(2, searchitem);
			rs=pst.executeQuery();
			while(rs.next())
			{
				prodid.add(rs.getInt("prodid"));
	    		prodnm.add(rs.getString("prodnm"));
	    		mrp.add(rs.getInt("mrp"));
	    		sellingprice.add(rs.getInt("sp"));
	    		img.add(rs.getString("imgurl1"));
			}
			%>
			<div class="container">
	          <div class="row newarrivals">
	            <%
	            	for(int i=0;i<prodid.size();i++)
	            	{
	            		
	           
	            %>
	            <div style="background-color:whitesmoke;height: 300px"  class="col-xs-3 col-sm-2 col-md-2 col-lg-2">
	            <br>
	             <center>    <img src="<%=img.get(i) %>" height="150px" width="150px" alt="First slide">
	               
	               <a href="viewproductdetails.jsp?prodid=<%=prodid.get(i)%>"><% out.print(prodnm.get(i)); %></a></center>
	               <h6>Mrp Rs. <strike><% out.print(mrp.get(i)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(i));%></h6>
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
	       					<center><a onclick="javascript:myFunction(<%=prodid.get(i)%>,<%=session.getAttribute("userid").toString() %>,1,<% out.print(mrp.get(i)); %>)" class="btn btn-success">Add To Cart</a></center>
	       			<%
	               		}
	       			%>
	               Reviews 
	               
	            </div>
	           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <%
	            	}
		
	          %>
	        </div>
	        </div>
			<%
		}
		else if(totse.contains("Categories"))
		{
			pst=con.prepareStatement("select * from products where brand=? and catid=(select catid from prod_cat where catnm=?);");
			pst.setString(1, brand);
			pst.setString(2, searchitem);
			rs=pst.executeQuery();
			while(rs.next())
			{
				prodid.add(rs.getInt("prodid"));
	    		prodnm.add(rs.getString("prodnm"));
	    		mrp.add(rs.getInt("mrp"));
	    		sellingprice.add(rs.getInt("sp"));
	    		img.add(rs.getString("imgurl1"));
			}
			%>
			<div class="container">
	          <div class="row newarrivals">
	            <%
	            	for(int i=0;i<prodid.size();i++)
	            	{
	            		
	           
	            %>
	            <div style="background-color:whitesmoke;height: 300px"  class="col-xs-3 col-sm-2 col-md-2 col-lg-2">
	            <br>
	             <center>    <img src="<%=img.get(i) %>" height="150px" width="150px" alt="First slide">
	               
	               <a href="viewproductdetails.jsp?prodid=<%=prodid.get(i)%>"><% out.print(prodnm.get(i)); %></a></center>
	               <h6>Mrp Rs. <strike><% out.print(mrp.get(i)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(i));%></h6>
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
	       					<center><a onclick="javascript:myFunction(<%=prodid.get(i)%>,<%=session.getAttribute("userid").toString() %>,1,<% out.print(mrp.get(i)); %>)" class="btn btn-success">Add To Cart</a></center>
	       			<%
	               		}
	       			%>
	               Reviews 
	               
	            </div>
	           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <%
	            	}
		
	          %>
	        </div>
	        </div>
			<%
			
		}
		else
		{
			pst=con.prepareStatement("select * from products where brand=?;");
			pst.setString(1, brand);
			rs=pst.executeQuery();
			while(rs.next())
			{
				prodid.add(rs.getInt("prodid"));
	    		prodnm.add(rs.getString("prodnm"));
	    		mrp.add(rs.getInt("mrp"));
	    		sellingprice.add(rs.getInt("sp"));
	    		img.add(rs.getString("imgurl1"));
			}
			%>
			<div class="container">
	          <div class="row newarrivals">
	            <%
	            	for(int i=0;i<prodid.size();i++)
	            	{
	            		
	           
	            %>
	            <div style="background-color:whitesmoke;height: 300px"  class="col-xs-3 col-sm-2 col-md-2 col-lg-2">
	            <br>
	             <center>    <img src="<%=img.get(i) %>" height="150px" width="150px" alt="First slide">
	               
	               <a href="viewproductdetails.jsp?prodid=<%=prodid.get(i)%>"><% out.print(prodnm.get(i)); %></a></center>
	               <h6>Mrp Rs. <strike><% out.print(mrp.get(i)); %></strike>&nbsp;&nbsp;<%out.print(sellingprice.get(i));%></h6>
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
	       					<center><a onclick="javascript:myFunction(<%=prodid.get(i)%>,<%=session.getAttribute("userid").toString() %>,1,<% out.print(mrp.get(i)); %>)" class="btn btn-success">Add To Cart</a></center>
	       			<%
	               		}
	       			%>
	               Reviews 
	               
	            </div>
	           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          <%
	            	}
		
	          %>
	        </div>
	        </div>
			<%
			
		}
		
	%>
	</body>
</html>