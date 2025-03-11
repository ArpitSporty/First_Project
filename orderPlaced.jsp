<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.* "%>
     <%@page import="mybeans.*" %>
    <%@page import="java.util.Calendar"%>
<%@page import ="java.text.DateFormat"%>  
 <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
</head>
<body>
<% 
ArrayList<Long>Tenderid=new ArrayList<Long>();
ArrayList<Double>mrp=new ArrayList<Double>();
long id=Long.valueOf(session.getAttribute("userid").toString());
String nm=session.getAttribute("name").toString();
String Tendernm="null";
String deadline=null;
String city="null";
String Location=null;
int count=0;
int show=0;
int nxtdate,mnth,yr;
/*********get current data****/
String pat="yyyy-MM-dd";
SimpleDateFormat sd=new SimpleDateFormat(pat);
String caldate=sd.format(new Date()); 
Calendar cal = Calendar.getInstance();



/*******get current data****/

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "new";
String userid1 = "root";
String password = "";
Class.forName(driver);
Connection con = DriverManager.getConnection(connectionUrl+database, userid1, password);
CustomerData csd=new CustomerData();
PreparedStatement pst;
ResultSet rs;
String tomdate;
pst=con.prepareStatement("select city from users where userid=?;");
pst.setLong(1,id);
rs=pst.executeQuery();
while(rs.next())
{
city=rs.getString(1);	
}
if(city.equalsIgnoreCase("amravati"))
{
	
	cal.add(Calendar.DATE, 1);
	nxtdate=cal.get(Calendar.DATE);
	mnth=(cal.get(Calendar.MONTH)+1);
	yr=cal.get(Calendar.YEAR);
	  tomdate=String.valueOf((nxtdate) +"/"+ (mnth) +"/"+ (yr));
}
else{
	cal.add(Calendar.DATE, 2);
	nxtdate=cal.get(Calendar.DATE);
	mnth=(cal.get(Calendar.MONTH)+1);
	yr=cal.get(Calendar.YEAR);
    tomdate=String.valueOf((nxtdate) +"/"+ (mnth) +"/"+ (yr));
}

pst=con.prepareStatement("select intrested.Tenderid,intrested.mrp,tenders.Tendernm,tenders.Location,tenders.deadline from intrested inner join Tenders on intrested.Tenderid =tenders.tenderid where intrested.userid=?;");
pst.setLong(1,id);
rs=pst.executeQuery();
	while(rs.next())
	{
		++count;
	Tenderid.add(rs.getLong("Tenderid"));
	Location=rs.getString("Location");
	mrp.add(rs.getDouble("mrp"));
	Tendernm=rs.getString("Tendernm");
        deadline=rs.getString("deadline");
	}
	
	for(int i=0;i<count;i++)
	{
		pst=con.prepareStatement("insert into bids(userid,custnm,Tenderid,Tendernm,mrp,confirmation,biddate,deadline,Location) values(?,?,?,?,?,?,?,?,?);");
		pst.setLong(1,id);
		pst.setString(2,nm);
		pst.setLong(3,Tenderid.get(i));
		pst.setString(4,Tendernm);
		
		pst.setDouble(5,mrp.get(i));
		pst.setString(6,"confirmed");
	    pst.setString(7,caldate);
	    pst.setString(8, deadline);
	    pst.setString(9,Location);
	int tot=pst.executeUpdate();
	
	}
	
	%>
	<br><br><enter>	
<div class="panel panel-default">
          <div class="container">
        <h2 class="text-danger">You Successfully Bid the Tender !!</h2><br>	
</div>
   
     <hr>


      </div>
     

  </div>
   </div> 
</div>
</div>
<hr>
<a class="btn-btn-primary" href="CustHome.jsp">Go Back</a>
<% 
		
			Long tenderid=(Long)session.getAttribute("Tenderid");
		 pst=con.prepareStatement("delete from intrested where userid=? and Tenderid=?;");
		 pst.setLong(1, id);
		 pst.setLong(2, tenderid);
		 pst.executeUpdate();
		
		 
	
%>
</body>
</html>