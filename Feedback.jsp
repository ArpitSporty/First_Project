<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/global.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/dropdownmenu.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
<div class="col-lg-4"></div>
 <div class="col-lg-4">
            <center>
             <h1 style="color: #269abc">FEEDBACK FORM</h1>
	<form name="frm" method="post" action="Feed.jsp">
		<table class="table">
			<tr>
				<td>NAME</td>
				<td><input type="text" name="name" class="form-control" required></td>
			</tr>
			<tr>
				<td>E-MAIL ID</td>
				<td><input type="email" name="email" class="form-control" required></td>
			</tr>
			<tr>
				<td>COMMENT</td>
				<td><input type="textarea" name="comment" class="form-control" required></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit" class="btn btn-success"></td>
				<td><input type="button" value="Back" class="btn btn-warning"></td>
			</tr>
		</table>
	</form>
	</center>
	</div>
</body>
</html>