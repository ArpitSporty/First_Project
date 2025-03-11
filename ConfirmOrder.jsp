<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script language="Javascript" type="text/javascript">
<!--
function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest() {
    no=document.frm.num.value;
    http.open('get', 'Customer/FinalCart.jsp');
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('Cart').innerHTML = response;
    }
}

-->
</script>
<title>Insert title here</title>
</head>
<body onpageshow="makeGetRequest()">
	
	<div id="Cart"></div>
	
</body>
</html>