<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<fieldset class="rating">     
        <input type="radio" name="stars" id="4_stars" value="4" >
        <label class="stars" for="4_stars">4 stars</label>
        <input type="radio" name="stars" id="3_stars" value="3" >
        <label class="stars" for="3_stars">3 stars</label>
        <input type="radio" name="stars" id="2_stars" value="2" >
        <label class="stars" for="2_stars">2 stars</label>
        <input type="radio" name="stars" id="1_stars" value="1" >
        <label class="stars" for="1_stars">1 star</label>
        <input type="radio" name="stars" id="0_stars" value="0" required>
        <label class="stars" for="0_stars">0 star</label>
        <span  class="label"> Rating: </span>
    </fieldset>
</body>
</html>