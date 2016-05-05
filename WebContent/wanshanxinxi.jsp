<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
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
		    function check(form) {
		    	$("#sexerror").html("");
		    	$("#phoneerror").html("");
		    	var key = false;
		        if(form.usersex.value != "男" && form.usersex.value != "女"){
		              $("#sexerror").html("<br><b>性别格式有误！</b>");
			        	$("#usersex").focus();
			        	key = false;
		         }else {
		        	 if(form.userphone.value == "") {
			        	 $("#phoneerror").html("<br><b>手机号码不能为空！</b>");
			        	 $("#userphone").focus();
			        	key = false;
			        }else {
				        if(!form.userphone.value.match(/^(((13[0-9]{1})|159|153)+\d{8})$/)) {
				        	$("#phoneerror").html("<br><b>手机号码格式有误！</b>");
				        	 $("#userphone").focus();
				        	 key = false;
				        }else {
				             key = true;
				             }
				         }
			         }
		        return key;
		         }
		         
	    </script>
    </head>

    <body>
    <%		ArrayList<HashMap<String,String>> list = (ArrayList<HashMap<String,String>>)session.getAttribute("user");
    			
    %>
        <div class="page-container">
            <h1 style="font-size:20px">尊敬的&nbsp <% out.print(list.get(0).get("user_name")); %>&nbsp 你好!请完善您的个人信息</h1>
            <br><br>
            <form action="user_update" method="post">
            <input type="hidden" name="username"  value="<%out.print(list.get(0).get("user_name")); %>">
                <input type="text" name="usernicheng" class="username" placeholder="昵称">
                <input type="text" name="usersex"  id="usersex"  class="username" placeholder="性别"><p id="sexerror" style="color:red"></p>
                <input type="text" name="userphone"  id="userphone"  class="username" placeholder="电话"><p id="phoneerror" style="color:red"></p>
                <input type="text" name="useremail"   id="useremail"  name="useremail"  class="username" placeholder="邮箱：例807312447@qq.com" ><p id="emailerror" style="color:red"></p>
                <input type="text" name="userqianming" class="username" placeholder="个性签名">
                <input type="text" name="useridcard" class="username" placeholder="身份证">
                <button type="submit"  onclick="return check(this.form)">继续</button>
                <br><br>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
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