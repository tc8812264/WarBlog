<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="database.DB" %>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>Newspaper1</title>
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css">
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
	
	<!-- Owl Carousel Assets -->
    <link href="owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="owl-carousel/owl.theme.css" rel="stylesheet">
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="font-awesome-4.4.0/css/font-awesome.min.css"  type="text/css">
	
	<!-- jQuery and Modernizr-->
	<script src="js/jquery-2.1.1.js"></script>
	
	<!-- Core JavaScript Files -->  	 
    <script src="js/bootstrap.min.js"></script>
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
    <script src="js/jquery.js"></script>
    <script type="text/javascript">
		$(function(){
			$("#accept_bt").click(function(){
				$.post("accept_friend",{friend_host:$("#friend_host").val(),friend_client:$("#friend_client").val(),group_id:$('#friendgroup_sel option:selected').val()},function(data){
					
				});
			});
			$("#refuse_bt").click(function(){
				$.post("refuse_friend",{friend_host:$("#friend_host").val(),friend_client:$("#friend_client").val()},function(data){
					
				});
			});
			$("#delete_bt").click(function(){
				$.post("delete_friend",{friendfirst:$("#del_fn1").val(),friendsecond:$("#del_fn2").val(),group_id:$("#del_groupid").val()},function(data){
					
				});				
			});
			$("#addgroup_bt").click(function(){
				$("#delgroup_div").css("display","none");
				$("#addgroup_div").css("display","block");
			});
			$("#group_add").click(function(){
				$.post("add_group",{group_name:$("#addgroup_name").val(),user_name:$("#user_name").val()},function(data){
					alert("添加分组成功！");	
					window.location.reload();
				});
			});
			$("#delgroup_bt").click(function(){
				$("#addgroup_div").css("display","none");
				$("#delgroup_div").css("display","block");
			});
			$("#group_del").click(function(){
				$.post("del_group",{group_name:$("#delgroup_name").val(),user_name:$("#user_name").val()},function(data){
					alert("删除分组成功！");	
					window.location.reload();
				});
			});			
		});
    </script>
</head>

<body>
<header>
	<!--Top-->
	<nav id="top">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<strong>欢迎来到War！</strong>
				</div>
				<div class="col-md-6">
					<ul class="list-inline top-link link">
						<li><a href="xiaohui"><i class="fa fa-home"></i>
	<% 
	ArrayList<HashMap<String,String>> list  = new ArrayList<HashMap<String,String>>();
	if(session.getAttribute("user")!=null) {
		list = (ArrayList<HashMap<String,String>>)session.getAttribute("user"); 
		out.print(list.get(0).get("user_nicheng")+",登出");
	}else {
		out.print("登录");
	}
	%>
	<input id="user_name" type="hidden" value="<%out.print(list.get(0).get("user_name"));%>">
						 </a></li>
						<li><a href="contact.html"><i class="fa fa-comments"></i> 联系我们</a></li>
						<li><a href="#"><i class="fa fa-question-circle"></i> ？帮助</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	
	<!--Navigation-->
    <nav id="menu" class="navbar container">
		<div class="navbar-header">
			<button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
			<a class="navbar-brand" href="#">
				<div class="logo"><span>首页</span></div>
			</a>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">我的博客</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">个人中心<i class="fa fa-arrow-circle-o-down"></i></a>
					<div class="dropdown-menu">
						<div class="dropdown-inner">
							<ul class="list-unstyled">
								<li><a href="find_user?name=<%out.print(list.get(0).get("user_name"));%>">个人资料</a></li>
								<li><a href="friend_echo?name=<%out.print(list.get(0).get("user_name"));%>">好友列表</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li><a href="archive_echo?name=<%out.print(list.get(0).get("user_name"));%>"><i class="fa fa-cubes"></i>我的文章</a></li>
				<li><a href="new_reply?name=<%out.print(list.get(0).get("user_name"));%>"><i class="fa fa-cubes"></i>我的回复</a></li>		
				<li><a href="photo_alum_echo?name=<%out.print(list.get(0).get("user_name"));%>"><i class="fa fa-cubes"></i>我的相册</a></li>
			</ul>
			<ul class="list-inline navbar-right top-social">
				<li><a href="#"><i class="fa fa-facebook"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter"></i></a></li>
				<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
				<li><a href="#"><i class="fa fa-google-plus-square"></i></a></li>
				<li><a href="#"><i class="fa fa-youtube"></i></a></li>
			</ul>
		</div>
	</nav>
</header>	
	
	<!-- /////////////////////////////////////////Content -->
	<%
	ArrayList<HashMap<String, String>> group = (ArrayList<HashMap<String, String>>)request.getSession().getAttribute("group");
	ArrayList<HashMap<String, String>> friend = (ArrayList<HashMap<String, String>>)request.getAttribute("friend");
	ArrayList<HashMap<String, String>> newfriend = (ArrayList<HashMap<String, String>>)request.getAttribute("newfriend");
%>
	<div id="page-content" class="archive-page container">
		<div class="">
			<div class="row">
				<div id="main-content" class="col-md-8">
				<%if(!newfriend.isEmpty()) {
					%>
					<div class="box">
					<div class="wrap-vid">
					<h6 style="color:red">您有新的好友申请!</h6><%
				for(int i = 0; i < newfriend.size(); ++i){
				DB b = new DB();
				ArrayList<HashMap<String, String>> message = b.query("select * from userinfo where user_name = '"+newfriend.get(i).get("friend_client")+"'");
				%>
					<div class="newfriends_echo">
							
					<img src="images/<%=message.get(0).get("user_touxiang")%>" style="width:50px; height:50px"><font size="5px">&nbsp<%=message.get(0).get("user_nicheng")%></font>
					
					<select id="friendgroup_sel">
					<%for(int j = 0; j < group.size(); ++j){ %>
						<option value="<%=group.get(j).get("group_id")%>"><%=group.get(j).get("group_name")%></option>
					<%} %>
					</select>
					<input id="friend_host" type="hidden" value="<%=list.get(0).get("user_name")%>">
					<input id="friend_client" type="hidden" value="<%=newfriend.get(i).get("friend_client")%>">
						<button id="accept_bt">同意</button>
						<button id="refuse_bt">拒绝</button>
					</div>
				<%}%> 
					</div>
					</div>	
				<%}%>			
				<%for(int i = 0; i < group.size(); ++i) {
					HashMap<String,String> map = group.get(i);
					%>
						<div class="box">
						<div class="wrap-vid">		
						<h6><%out.print(map.get("group_name"));%>(<%out.print(map.get("group_num"));%>)</h6>
					<%
					System.out.println(friend.size());
					if(!friend.isEmpty()){
					for(int j = 0; j < friend.size(); ++j){
						if(map.get("group_id").equals(friend.get(j).get("friend_group"))){
							DB b = new DB();
							ArrayList<HashMap<String, String>> message1 = b.query("select * from userinfo where user_name = '"+friend.get(j).get("friend_host")+"'");
							ArrayList<HashMap<String, String>> message2 = b.query("select * from userinfo where user_name = '"+friend.get(j).get("friend_client")+"'");
							if(!message1.isEmpty() && (!message1.get(0).get("user_name").equals(list.get(0).get("user_name")))){
						%>
							<div class="friends_echo">
							
							<img src="images/<%=message1.get(0).get("user_touxiang")%>" style="width:50px; height:50px"><font size="5px">&nbsp<%=message1.get(0).get("user_nicheng")%></font>&nbsp&nbsp&nbsp&nbsp<%=message1.get(0).get("user_qianming")%>
							</div>
							<div style="float:right">
							<input id="del_fn1" type="hidden" value="<%=list.get(0).get("user_name")%>">
							<input id="del_fn2" type="hidden" value="<%=message1.get(0).get("user_name")%>">
							<input id="del_groupid" type="hidden" value="<%=map.get("group_id")%>">
								<button id="delete_bt">删除</button>
							</div>
					<hr class="line">
					<%	}else if(!message1.isEmpty() && (!message2.get(0).get("user_name").equals(list.get(0).get("user_name")))){
						%>
							<div class="friends_echo">
							
							<img src="images/<%=message2.get(0).get("user_touxiang")%>" style="width:50px; height:50px"><font size="5px">&nbsp<%=message2.get(0).get("user_nicheng")%></font>&nbsp&nbsp&nbsp&nbsp<%=message2.get(0).get("user_qianming")%>
							</div>
							<div style="float:right">
							<input id="del_fn1" type="hidden" value="<%=list.get(0).get("user_name")%>">
							<input id="del_fn2" type="hidden" value="<%=message2.get(0).get("user_name")%>">
							<input id="del_groupid" type="hidden" value="<%=map.get("group_id")%>">
								<button id="delete_bt">删除</button>
							</div>
							<hr class="line">						
					<%}%>
					<%
						}
					}
					}
					%>
					</div>
					</div>
				<%
				}
				%>
				<div class="box">
				<div class="wrap-vid">
				<div id="addgroup_div" style="float:left;display:none;">
				添加分组名称：<input id="addgroup_name"><button id="group_add">确定</button>
				</div>
				<div id="delgroup_div" style="float:left;display:none;">
				删除分组名称：<input id="delgroup_name"><button id="group_add">确定</button>
				</div>

				<div style="float:right"><button id="addgroup_bt">添加分组</button><button id="delgroup_bt">删除分组</button></div>
				</div>
				</div>
				</div>
				<div id="sidebar" class="col-md-4">
					<!---- Start Widget ---->
					<div class="widget wid-follow">
						<div class="heading"><h4>Follow Us</h4></div>
						<div class="content">
							<ul class="list-inline">
								<li>
									<a href="facebook.com/">
										<div class="box-facebook">
											<span class="fa fa-facebook fa-2x icon"></span>
											<span>1250</span>
											<span>Fans</span>
										</div>
									</a>
								</li>
								<li>
									<a href="facebook.com/">
										<div class="box-twitter">
											<span class="fa fa-twitter fa-2x icon"></span>
											<span>1250</span>
											<span>Fans</span>
										</div>
									</a>
								</li>
								<li>
									<a href="facebook.com/">
										<div class="box-google">
											<span class="fa fa-google-plus fa-2x icon"></span>
											<span>1250</span>
											<span>Fans</span>
										</div>
									</a>
								</li>
							</ul>
							<img src="images/banner.jpg" />
						</div>
					</div>
					<!---- Start Widget ---->
					<div class="widget wid-post">
						<div class="heading"><h4>Category</h4></div>
						<div class="content">
							<div class="post wrap-vid">
								<div class="zoom-container">
									<div class="zoom-caption">
										<span class="youtube">Youtube</span>
										<a href="single.html">
											<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
										</a>
										<p>Video's Name</p>
									</div>
									<img src="images/1.jpg" />
								</div>
								<div class="wrapper">
									<h5 class="vid-name"><a href="#">Video's Name</a></h5>
									<div class="info">
										<h6>By <a href="#">Kelvin</a></h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="post wrap-vid">
								<div class="zoom-container">
											<div class="zoom-caption">
												<span class="vimeo">Vimeo</span>
												<a href="single.html">
													<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
												</a>
												<p>Video's Name</p>
											</div>
											<img src="images/2.jpg" />
										</div>
								<div class="wrapper">
									<h5 class="vid-name"><a href="#">Video's Name</a></h5>
									<div class="info">
										<h6>By <a href="#">Kelvin</a></h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="post wrap-vid">
								<div class="zoom-container">
									<div class="zoom-caption">
										<span class="youtube">Youtube</span>
										<a href="single.html">
											<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
										</a>
										<p>Video's Name</p>
									</div>
									<img src="images/3.jpg" />
								</div>
								<div class="wrapper">
									<h5 class="vid-name"><a href="#">Video's Name</a></h5>
									<div class="info">
										<h6>By <a href="#">Kelvin</a></h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!---- Start Widget ---->
					<div class="widget ">
						<div class="heading"><h4>Top News</h4></div>
						<div class="content">
							<div class="wrap-vid">
								<div class="zoom-container">
									<div class="zoom-caption">
										<span class="vimeo">Vimeo</span>
										<a href="single.html">
											<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
										</a>
										<p>Video's Name</p>
									</div>
									<img src="images/1.jpg" />
								</div>
								<h3 class="vid-name"><a href="#">Video's Name</a></h3>
								<div class="info">
									<h5>By <a href="#">Kelvin</a></h5>
									<span><i class="fa fa-calendar"></i>25/3/2015</span> 
									<span><i class="fa fa-heart"></i>1,200</span>
								</div>
							</div>
							<div class="wrap-vid">
								<div class="zoom-container">
									<div class="zoom-caption">
										<span class="vimeo">Vimeo</span>
										<a href="single.html">
											<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
										</a>
										<p>Video's Name</p>
									</div>
									<img src="images/2.jpg" />
								</div>
								<h3 class="vid-name"><a href="#">Video's Name</a></h3>
								<div class="info">
									<h5>By <a href="#">Kelvin</a></h5>
									<span><i class="fa fa-calendar"></i>25/3/2015</span> 
									<span><i class="fa fa-heart"></i>1,200</span>
								</div>
							</div>
							<div class="wrap-vid">
								<div class="zoom-container">
									<div class="zoom-caption">
										<span class="vimeo">Vimeo</span>
										<a href="single.html">
											<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
										</a>
										<p>Video's Name</p>
									</div>
									<img src="images/3.jpg" />
								</div>
								<h3 class="vid-name"><a href="#">Video's Name</a></h3>
								<div class="info">
									<h5>By <a href="#">Kelvin</a></h5>
									<span><i class="fa fa-calendar"></i>25/3/2015</span> 
									<span><i class="fa fa-heart"></i>1,200</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="copy-right">
			<p>Copyright &copy; 2016.Tc</p>
		</div>
	</footer>
	<!-- Footer -->
	
	<!-- JS -->
	<script src="owl-carousel/owl.carousel.js"></script>
    <script>
    $(document).ready(function() {
      $("#owl-demo").owlCarousel({
        autoPlay: 3000,
        items : 5,
        itemsDesktop : [1199,4],
        itemsDesktopSmall : [979,4]
      });

    });
    </script>
	
</body>
</html>
