<%-- 
    Document   : Forget
    Created on : May 3, 2019, 11:47:51 PM
    Author     : W10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/global.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/dropdownmenu.js" type="text/javascript"></script>
        <title>JSP Page</title>
        
        <script lang="javascript">
        	function callPass()
        	{
        		var pass,cpass;
        		pass=document.frm.pass.value;
        		cpass=document.frm.cpass.value;
        		
        		if(pass==cpass)
        			return true;
        		else
        			return false;
        	}
        </script>
        
    </head>
    <body>
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <center>
                <h1 style="color: #269abc">Forgot Password</h1>
            <form name="frm" method="post" action="Change.jsp" class="form-group">
                <table class="table">
                    <tr>
                        <td>MOBILE</td>
                        <td><input type="number" name="mobile" autocomplete="off" placeholder="Enter mobile no." class="form-control" required></td>
                        <td></td>
                    </tr>
                    <tr>
                            <td>Enter OTP</td>
                            <td><input type="text" name="otp" autocomplete="off" class="form-control" placeholder="Enter OTP" required></td>
                            <td><a href="#">Send OTP</a></td>
                        </tr>
                    <tr>
                        <td>Enter Password</td>
                        <td><input type="password" name="pass" autocomplete="off" class="form-control" placeholder="Enter Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast 1 number, 1 upper case and 1 lower case letter, and atleast 8 or more characters." required></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Re-Enter Password</td>
                        <td><input type="password" name="cpass" autocomplete="off" class="form-control" placeholder="Re-Enter Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast 1 number, 1 upper case and 1 lower case letter, and atleast 8 or more characters." required></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Change" class="btn btn-success" onclick="return callPass()"></td>
                        <td><input type="button" value="Back" onclick="history.back()" class="btn btn-warning"></td>
                    </tr>
                </table>
            </form>    
                </div>
        
        
    </body>
</html>
