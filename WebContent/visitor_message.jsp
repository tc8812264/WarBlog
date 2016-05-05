<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="">
<meta name="author" content="">

<title>Newspaper</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">

<!-- Owl Carousel Assets -->
<link href="owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="owl-carousel/owl.theme.css" rel="stylesheet">

<!-- Custom Fonts -->
<link rel="stylesheet"
	href="font-awesome-4.4.0/css/font-awesome.min.css" type="text/css">

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

</head>

<body>
	<header> <!--Top--> <nav id="top">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<strong>欢迎来到War！</strong>
			</div>
			<div class="col-md-6">
				<ul class="list-inline top-link link">
					<li><a href="xiaohui"><i class="fa fa-home"></i> 
					<%ArrayList<HashMap<String,String>> list  = new ArrayList<HashMap<String,String>>();
					ArrayList<HashMap<String,String>> vlist  = (ArrayList<HashMap<String,String>>)session.getAttribute("visitor");
					list = (ArrayList<HashMap<String,String>>)session.getAttribute("user"); 
		out.print(list.get(0).get("user_nicheng")+",登出");
	%> </a></li>
					<li><a href="contact.html"><i class="fa fa-comments"></i>
							联系我们</a></li>
					<li><a href="#"><i class="fa fa-question-circle"></i> ？帮助</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</nav> <!--Navigation--> <nav id="menu" class="navbar container">
	<div class="navbar-header">
		<button type="button" class="btn btn-navbar navbar-toggle"
			data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<i class="fa fa-bars"></i>
		</button>
		<a class="navbar-brand" href="#">
			<div class="logo">
				<span>首页</span>
			</div> </a>
	</div>
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav">
			<li><a href="visitor_echo?visitor=<%=vlist.get(0).get("user_name")%>">他的博客</a></li>
		</ul>
		<ul class="list-inline navbar-right top-social">
			<li><a href="#"><i class="fa fa-facebook"></i> </a></li>
			<li><a href="#"><i class="fa fa-twitter"></i> </a></li>
			<li><a href="#"><i class="fa fa-pinterest"></i> </a></li>
			<li><a href="#"><i class="fa fa-google-plus-square"></i> </a></li>
			<li><a href="#"><i class="fa fa-youtube"></i> </a></li>
		</ul>
	</div>
	</nav> </header>
	<!-- Header -->
	<!-- /////////////////////////////////////////Content -->
	<div id="page-content" class="archive-page container">
		<div class="">
			<div class="row">
				<div id="main-content" class="col-md-8">
					<div class="box">
						<center>
							<div class="box-header">
								<h1 class="center">
									<img src="images/update_top.png">
								</h1>
							</div>
						</center>
						<br>
						<div style="font-size: 30px; float: left"><b>基本信息</b></div>
						<br>
						<div>
							<img src="images/hengxian.png">
						</div>
						<br> <b>个性签名：</b><br>
						
						<label id="qianming_echo" class="user_echo" style="diplay: block;"><font size="3px"><b><% out.print(vlist.get(0).get("user_qianming"));%></b> </font> </label>
						<table style="text-align: center; width: 700px; height: 300px; font-weight: bold;">
							<tr>
								<td>昵称：</td>
								<td><label id="nicheng_echo" class="user_echo"
									style="diplay: block;"><font size="3px"><b><%out.print(vlist.get(0).get("user_nicheng"));%></b></font></label></td>
								<td>性别：</td>
								<td><label id="sex_echo" style="diplay: block;"><font
										size="3px"><b><%out.print(vlist.get(0).get("user_sex"));%></b></font></label></td>
							</tr>
							<tr>
								<td>电话：</td>
								<td><label id="phone_echo" class="user_echo"
									style="diplay: block;"><font size="3px"><b><%out.print(vlist.get(0).get("user_phone"));%></b></font></label><p id="phoneerror" style="color: red; font-size: 5px;"></p></td>
								<td>邮箱：</td>
								<td><label id="email_echo" class="user_echo"
									style="diplay: block;"><font size="3px"><b><%out.print(vlist.get(0).get("user_email"));%></b></font></label><p id="emailerror" style="color: red; font-size: 5px;"></p></td>
							</tr>
						</table>
						<br>
						<div>
							<img src="images/hengxian.png">
						</div>
						<br>
						<div style="font-size: 30px; float: left">
							<b>详细信息</b>
						</div>
						<table
							style="text-align: center; width: 650px; height: 300px; font-weight: bold;">
							<tr>
								<td>星座：</td>
								<td>
								<label id="xingzuo_echo" class="xx" style="diplay: block;"><font
										size="3px"><b><%if(vlist.get(0).get("user_xingzuo") != null && !vlist.get(0).get("user_xingzuo").equals("请选择星座")){
								out.print(vlist.get(0).get("user_xingzuo"));
								}else {
									out.print("暂无");
								}%> </b></font></label></td>
								<td>生肖：</td>
								<td>
								<label id="shengxiao_echo" class="xx" style="diplay: block;"><font
										size="3px"><b> <%if(vlist.get(0).get("user_shengxiao") != null && vlist.get(0).get("user_shengxiao").equals("请选择生肖")){
								out.print(vlist.get(0).get("user_shengxiao"));
								}else {
									out.print("暂无");
								}%> </b></font></label></td>
							</tr>
							<tr>
								<td>职业：</td>
								<td>
								<label id="zhiye_echo" class="xx" style="diplay: block;"><font
										size="3px"><b> <%if(vlist.get(0).get("user_zhiye") != null && vlist.get(0).get("user_zhiye").equals("请选择职业")){
								out.print(vlist.get(0).get("user_zhiye"));
								}else {
									out.print("暂无");
								}%> </b></font></label></td>
								<td>个人地址：</td>
								<td>
								<label id="dizhi_echo" class="xx" style="diplay: block;"><font
										size="3px"><b> <%if(vlist.get(0).get("user_sheng") != null){
									out.print(vlist.get(0).get("user_sheng")+"省"+vlist.get(0).get("user_shi")+"市");
								}else {
									out.print("暂无");
								}%> </b></font></label></td>
							</tr>
							<tr>
								<td>身份证：</td>
								<td>
									<%out.print(vlist.get(0).get("user_idcard"));%>
								</td>
							</tr>
						</table>
						<br>
						<div>
							<img src="images/hengxian.png">
						</div>
						<div class="box-content">
							<div id="contact_form"></div>
						</div>
					</div>
				</div>

				<div id="sidebar" class="col-md-4">
					<!---- Start Widget ---->
					<div class="widget wid-follow">
						<div class="heading">
							<h4>Follow Us</h4>
						</div>
						<div class="content">
							<ul class="list-inline">
								<li><a href="facebook.com/">
										<div class="box-facebook">
											<span class="fa fa-facebook fa-2x icon"></span> <span>1250</span>
											<span>Fans</span>
										</div> </a>
								</li>
								<li><a href="facebook.com/">
										<div class="box-twitter">
											<span class="fa fa-twitter fa-2x icon"></span> <span>1250</span>
											<span>Fans</span>
										</div> </a>
								</li>
								<li><a href="facebook.com/">
										<div class="box-google">
											<span class="fa fa-google-plus fa-2x icon"></span> <span>1250</span>
											<span>Fans</span>
										</div> </a>
								</li>
							</ul>
							<img src="images/banner.jpg" />
						</div>
					</div>
					<!---- Start Widget ---->
					<div class="widget wid-post">
						<div class="heading">
							<h4>Category</h4>
						</div>
						<div class="content">
							<div class="post wrap-vid">
								<div class="zoom-container">
									<div class="zoom-caption">
										<span class="youtube">Youtube</span> <a href="single.html">
											<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
										</a>
										<p>Video's Name</p>
									</div>
									<img src="images/1.jpg" />
								</div>
								<div class="wrapper">
									<h5 class="vid-name">
										<a href="#">Video's Name</a>
									</h5>
									<div class="info">
										<h6>
											By <a href="#">Kelvin</a>
										</h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> <span><i
											class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="post wrap-vid">
								<div class="zoom-container">
									<div class="zoom-caption">
										<span class="vimeo">Vimeo</span> <a href="single.html"> <i
											class="fa fa-play-circle-o fa-5x" style="color: #fff"></i> </a>
										<p>Video's Name</p>
									</div>
									<img src="images/2.jpg" />
								</div>
								<div class="wrapper">
									<h5 class="vid-name">
										<a href="#">Video's Name</a>
									</h5>
									<div class="info">
										<h6>
											By <a href="#">Kelvin</a>
										</h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> <span><i
											class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="post wrap-vid">
								<div class="zoom-container">
									<div class="zoom-caption">
										<span class="youtube">Youtube</span> <a href="single.html">
											<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
										</a>
										<p>Video's Name</p>
									</div>
									<img src="images/3.jpg" />
								</div>
								<div class="wrapper">
									<h5 class="vid-name">
										<a href="#">Video's Name</a>
									</h5>
									<div class="info">
										<h6>
											By <a href="#">Kelvin</a>
										</h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> <span><i
											class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!---- Start Widget ---->
					<div class="widget ">
						<div class="heading">
							<h4>Top News</h4>
						</div>
						<div class="content">
							<div class="wrap-vid">
								<div class="zoom-container">
									<div class="zoom-caption">
										<span class="vimeo">Vimeo</span> <a href="single.html"> <i
											class="fa fa-play-circle-o fa-5x" style="color: #fff"></i> </a>
										<p>Video's Name</p>
									</div>
									<img src="images/1.jpg" />
								</div>
								<h3 class="vid-name">
									<a href="#">Video's Name</a>
								</h3>
								<div class="info">
									<h5>
										By <a href="#">Kelvin</a>
									</h5>
									<span><i class="fa fa-calendar"></i>25/3/2015</span> <span><i
										class="fa fa-heart"></i>1,200</span>
								</div>
							</div>
							<div class="wrap-vid">
								<div class="zoom-container">
									<div class="zoom-caption">
										<span class="vimeo">Vimeo</span> <a href="single.html"> <i
											class="fa fa-play-circle-o fa-5x" style="color: #fff"></i> </a>
										<p>Video's Name</p>
									</div>
									<img src="images/2.jpg" />
								</div>
								<h3 class="vid-name">
									<a href="#">Video's Name</a>
								</h3>
								<div class="info">
									<h5>
										By <a href="#">Kelvin</a>
									</h5>
									<span><i class="fa fa-calendar"></i>25/3/2015</span> <span><i
										class="fa fa-heart"></i>1,200</span>
								</div>
							</div>
							<div class="wrap-vid">
								<div class="zoom-container">
									<div class="zoom-caption">
										<span class="vimeo">Vimeo</span> <a href="single.html"> <i
											class="fa fa-play-circle-o fa-5x" style="color: #fff"></i> </a>
										<p>Video's Name</p>
									</div>
									<img src="images/3.jpg" />
								</div>
								<h3 class="vid-name">
									<a href="#">Video's Name</a>
								</h3>
								<div class="info">
									<h5>
										By <a href="#">Kelvin</a>
									</h5>
									<span><i class="fa fa-calendar"></i>25/3/2015</span> <span><i
										class="fa fa-heart"></i>1,200</span>
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
				autoPlay : 3000,
				items : 5,
				itemsDesktop : [ 1199, 4 ],
				itemsDesktopSmall : [ 979, 4 ]
			});

		});
	</script>

</body>
</html>
