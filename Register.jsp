<%-- 
    Document   : Register
    Created on : May 4, 2019, 10:53:04 AM
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
    </head>
    <body>
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <center>
                <h1 style="color: #269abc">REGISTRATION FORM</h1>
                <form name="frm" method="post" action="Reg.jsp" class="form-group">
                    <table class="table">
                        <tr>
                            <td>NAME</td>
                            <td><input type="text" name="name" autocomplete="off" placeholder="Enter name" class="form-control" required></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>E-MAIL ID</td>
                            <td><input type="email" name="email" autocomplete="off" placeholder="E-mail id" class="form-control" required></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>MOBILE</td>
                            <td><input type="text" name="mobile"  placeholder="MOBILE No." autocomplete="off" autocomplete="off" minlength="10" maxlength="10" class="form-control" REQUIRED></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>PASSWORD</td>
                            <td><input type="password" name="pass" autocomplete="off" placeholder="Enter password" class="form-control" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast 1 number, 1 upper case and 1 lower case letter, and atleast 8 or more characters." required></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Enter OTP</td>
                            <td><input type="text" name="otp" class="form-control" autocomplete="off" minlength="10" maxlength="10" placeholder="Enter OTP"></td>
                            <td><a href="#">Send OTP</a></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Login" class="btn btn-success"></td>
                            <td><input type="button" value="Back" onclick="history.back()" class="btn btn-warning"></td>
                        </tr>
                    </table>
                </form>
            </center>
        </div>
    </body>
</html>
