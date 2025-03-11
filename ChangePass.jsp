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
<script lang="javascript">
        	function callPass()
        	{
        		var pass,cpass;
        		pass=document.frm.pass.value;
        		cpass=document.frm.cpass.value;
        		
        		if(pass===cpass)
        			return true;
        		else
        			return false;
        	}
        </script>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<center>
<div class="col-lg-4" align="left"></div>
        <div class="col-lg-6" align="center">
            <center>
                <h1 style="color: #269abc">Change Password</h1>
            <form name="frm" method="post" action="Change.jsp" class="form-group">
                <table class="table">
                    <tr>
                        <td>MOBILE No.</td>
                        <td><input type="number" name="mobile" autocomplete="off" placeholder="Enter mobile no." class="form-control" required></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Enter New Password</td>
                        <td><input type="password" name="pass" autocomplete="off" class="form-control" placeholder="Enter New Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast 1 number, 1 upper case and 1 lower case letter, and atleast 8 or more characters." required></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Re-Enter New Password</td>
                        <td><input type="password" name="cpass" autocomplete="off" class="form-control" placeholder="Re-Enter New Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast 1 number, 1 upper case and 1 lower case letter, and atleast 8 or more characters." required></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Change" class="btn btn-success" onclick="return callPass()"></td>
                        <td><input type="button" value="Back" onclick="history.back()" class="btn btn-warning"></td>
                    </tr>
                </table>
            </form>    
                </div>
</center>
</body>
</html>