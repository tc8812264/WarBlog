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
	<script type = "text/javascript" src = "js/upload.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#file").css({width:"70px",height:"30px"});
		});
	</script>
    </head>
    <body>
		<%
		String path = getServletContext().getRealPath("images");
		String name = request.getSession().getAttribute("user").toString();
		%>
		<%
		String message = (String)request.getAttribute("message");
		message = message == null ? "" : message;
		%>
        <div class="page-container">
            <h1 style="font-size:80px">War Bar</h1>
            <br><br>
            <div id="divPreview">
	     	<img id="imgHeadPhoto" src="images/male.png" style="width: 160px; height: 170px;border: solid 1px #d2e2e2;" alt="" />
			</div>
            <form  name="fm" id="fm" action="uploadimg"  method="post" enctype="multipart/form-data">
				<input id="file" type="file" name="file" onchange="PreviewImage(this, 'imgHeadPhoto', 'divPreview')"/>
				<button type="submit">上传头像</button>
				<button name="btn2" onclick="document.fm.action='main.jsp';">跳过，进入主页</button>
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
