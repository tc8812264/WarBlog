<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
    <head>
        <meta charset="UTF-8">
        <title>欢迎来到War bar！</title>
		<meta name="keywords" />
		<meta name="description" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

	<script src="js/jquery.js"></script>
	<script type="text/javascript">
	$(function() {
		timer=null;
		var con = new Array("<br><br>welcome to War Bar","<br><br>ようこそWar Bar","<br><br>오신 것을 환영합니다 War Bar","<br><br>欢迎来到War Bar");
		var i =0;
		timer = setInterval(function() {
			$(".connect p").html(con[i]);
			i++;
			if(i == 4) {
				i = 0;
			}
		},4500);

	});
    function check(form) {
        if(form.password.value != form.checked.value){
              $(".connect font").html("两次输入的密码不一致!");
              return false;
         }else {
             return true;
         }
       }
	</script>
    </head>

    <body>
	<%
		String message = (String)request.getAttribute("message");
		message = message == null ? "" : message;
		%>
        <div class="page-container">
            <h1 style="font-size:80px">War Bar</h1>
            <br><br>
            <form action="register" method="post" >
                <input type="text" name="username" class="username" placeholder="用户名">
                <input type="password" name="password" class="password" placeholder="密码">
                <input type="password" name="checked" class="password" placeholder="确认密码">
                <button type="submit" onclick="return check(this.form)">注册</button>
                <br><br>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
                 <font color="red"><%out.print(message); %><br></font>
                <p>
                <br><br>
                    欢迎来到War Bar
                </p>
            </div>
        </div>
		
        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>

    </body>

</html>


