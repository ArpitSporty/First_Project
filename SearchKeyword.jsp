<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="java.sql.*,mybeans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

	String search=request.getParameter("search");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid, password);
Statement st;
PreparedStatement pst;
ResultSet rs;
try
{
	if(!search.equals(""))
	{
		
		
		pst=con.prepareStatement("select catid from prod_cat where catnm like '%"+search+"%';");
		rs=pst.executeQuery();
		if(rs.next())
		{
			st=con.createStatement();
			rs=st.executeQuery("select catid,catnm from prod_cat where catnm like '%"+search+"%';");
			while(rs.next())
			{
			%>
				
			
				<option value="<%=rs.getString("catnm") %> in Categories">
			
			<%
			}
		}
		
		pst=con.prepareStatement("select Tenderid from tenders where Tendernm like '%"+search+"%';");
		rs=pst.executeQuery();
		if(rs.next())
		{
			st=con.createStatement();
			rs=st.executeQuery("select Tenderid,Tendernm from tenders where Tendernm like '%"+search+"%' limit 7;");
			while(rs.next())
			{
			%>
				
			
				<option value="<%=rs.getString("Tendernm") %> in Tenders">
			
			<%
			}
		}
		
		pst=con.prepareStatement("select Tenderid from tenders where Location like '%"+search+"%';");
		rs=pst.executeQuery();
		if(rs.next())
		{
			st=con.createStatement();
			rs=st.executeQuery("select Tenderid,Location from tenders where Location like '%"+search+"%' limit 1;");
			while(rs.next())
			{
			%>
				
			
				<option value="<%=rs.getString("Location") %> in Location">
			
			<%
			}
		}
		
		pst=con.prepareStatement("select Tenderid from tenders where mrp like '%"+search+"%';");
		rs=pst.executeQuery();
		if(rs.next())
		{
			st=con.createStatement();
			rs=st.executeQuery("select Tenderid,mrp from tenders where mrp like '%"+search+"%' limit 8;");
			while(rs.next())
			{
			%>
				
			
				<option value="<%=rs.getLong("mrp") %> Bid Amounts">
			
			<%
			}
		}
	}	
}
catch(Exception ex)
{
	System.out.println("EROOR: "+ex.getMessage());
}
finally
{
	if(con!=null)
		con.close();
}

%>
</body>
</html>