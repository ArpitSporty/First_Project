 
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
            <h1 style="color: #269abc">Sign In</h1>
            <form name="frm" method="post" action="Log.jsp" class="form-group">
                <table class="table">
                    <tr>
                        <td>E-mail ID</td>
                        <td><input type="email" name="email" autocomplete="off" placeholder="E-mail id" class="form-control" required></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" autocomplete="off" class="form-control" placeholder="Enter Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast 1 number, 1 upper case and 1 lower case letter, and atleast 8 or more characters." required></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" class="btn btn-success"></td>
                        <td><input type="reset" value="Clear" class="btn btn-warning"></td>
                    </tr>
                    <tr>
                        <td><a href="Forget.jsp">Forgot password...</a></td>
                        <td><a href="Register.jsp">New Register.? Click Here..</a></td>
                    </tr>
                </table>
            </form>
        </center>
        </div>
    </body>
</html>
