<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
<script type="text/javascript">
function f() {
	var emailStr = 
    	/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
    var email = $("#user_email").val();
    if (!email.match(emailStr))
    {
        $("#error").text("输入的不是有效的邮件地址格式");
    }
    else {
        $("#error").text("输入的是有效的邮件地址格式");
    }	
}


</script>
</head>
<body>
<p id="error"></p>
	<input id="user_email">
	<button  onclick="f()">验证</button>
</body>
</html>