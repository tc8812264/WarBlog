<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
    <head>
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
		var timer= null;
		var i = 0;
		timer = setInterval(function() {
			if(i == 0) {
				$(".page-container > p").html("注册成功！<br>系统正在为您跳转。。");
			}else if(i == 1) {
				$(".page-container > p").html("注册成功！<br>系统正在为您跳转。。。");
			}else if(i ==2) {
				clearInterval(timer);
				window.location.href='index.jsp';
			}
			i++;	
		}, 1000);
	});
	</script>
    </head>
    <body>
	
        <div class="page-container">
            <br><br>
			 <p style="font-size:20px">注册成功<br>系统正在为您跳转。</p>
            <div class="connect">
            </div>
        </div>
		
        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>

    </body>

</html>
