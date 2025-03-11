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
	String sort=request.getParameter("sort");
	String brand,vehbrand,si,totse;
	
	si=request.getParameter("si");
	totse=request.getParameter("totse");
	brand=request.getParameter("brand");
	vehbrand=request.getParameter("vehbrand");
	
ArrayList<Integer> prodid=new ArrayList<Integer>();
ArrayList<String> prodnm=new ArrayList<String>();
ArrayList<String> img=new ArrayList<String>();
ArrayList<Integer> mrp=new ArrayList<Integer>();
ArrayList<Integer> sellingprice=new ArrayList<Integer>();


	
	PreparedStatement pst;
	ResultSet rs;
	
	String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "test";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);

	if(sort.equals("low"))
	{
		if(brand != null && brand.isEmpty() || vehbrand != null && vehbrand.isEmpty())
		{	
			try
			{
				
				pst=con.prepareStatement("select products.prodid,products.imgurl1,products.prodnm,products.mrp,products.sp,products.discount from products inner join prod_cat on products.catid=prod_cat.catid where products.prodnm like '"+si+"%' or products.brand like '%"+si+"%' or products.vehical_brand like '%"+si+"%' or prod_cat.catnm like '%"+si+"%' order by sp ASC;");
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
				con.close();	
			}
			catch(Exception ex)
			{
				System.out.println("EROOR: "+ex.getMessage());
			}
		}
		else 
		{
			try
			{
				
				pst=con.prepareStatement("select products.prodid,products.imgurl1,products.prodnm,products.mrp,products.sp,products.discount from products inner join prod_cat on products.catid=prod_cat.catid where products.prodnm like '"+si+"%' or products.brand like '%"+si+"%' or products.vehical_brand like '%"+si+"%' or prod_cat.catnm like '%"+si+"%' order by sp ASC;");
			//	pst.setString(1, si);
				
				rs=pst.executeQuery();
				while(rs.next())
				{
					prodid.add(rs.getInt("prodid"));
		    		prodnm.add(rs.getString("prodnm"));
		    		mrp.add(rs.getInt("mrp"));
		    		sellingprice.add(rs.getInt("sp"));
		    		img.add(rs.getString("imgurl1"));
				}
				con.close();	
			}
			catch(Exception ex)
			{
				System.out.println("EROOR: "+ex.getMessage());
			}
		
		}
	}
	else if(sort.equals("high"))
	{
		
		if(brand != null && brand.isEmpty() || vehbrand != null && vehbrand.isEmpty())
		{	
			try
			{
				
				pst=con.prepareStatement("select products.prodid,products.imgurl1,products.prodnm,products.mrp,products.sp,products.discount from products inner join prod_cat on products.catid=prod_cat.catid where products.prodnm like '"+si+"%' or products.brand like '%"+si+"%' or products.vehical_brand like '%"+si+"%' or prod_cat.catnm like '%"+si+"%' order by sp DESC;");
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
				con.close();	
			}
			catch(Exception ex)
			{
				System.out.println("EROOR: "+ex.getMessage());
			}
		}
		else 
		{
			try
			{
				
				pst=con.prepareStatement("select products.prodid,products.imgurl1,products.prodnm,products.mrp,products.sp,products.discount from products inner join prod_cat on products.catid=prod_cat.catid where products.prodnm like '"+si+"%' or products.brand like '%"+si+"%' or products.vehical_brand like '%"+si+"%' or prod_cat.catnm like '%"+si+"%' order by sp DESC;");
			//	pst.setString(1, si);
				
				rs=pst.executeQuery();
				while(rs.next())
				{
					prodid.add(rs.getInt("prodid"));
		    		prodnm.add(rs.getString("prodnm"));
		    		mrp.add(rs.getInt("mrp"));
		    		sellingprice.add(rs.getInt("sp"));
		    		img.add(rs.getString("imgurl1"));
				}
				con.close();	
			}
			catch(Exception ex)
			{
				System.out.println("EROOR: "+ex.getMessage());
			}
		
		}
	}
%>

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
</body>
</html>