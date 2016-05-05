<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,database.*" %>
<%@ page import="javabean.PageBean" %>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>相册</title>
	
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
	ArrayList<HashMap<String,String>> vlist  = (ArrayList<HashMap<String,String>>)session.getAttribute("visitor");
	ArrayList<HashMap<String,String>> plist  = (ArrayList<HashMap<String,String>>)session.getAttribute("photo");
	ArrayList<HashMap<String,String>> list  = new ArrayList<HashMap<String,String>>();
	if(session.getAttribute("user")!=null) {
		list = (ArrayList<HashMap<String,String>>)session.getAttribute("user"); 
		out.print(list.get(0).get("user_nicheng")+",登出");
	}else {
		out.print("登录");
	}
	%>
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
				<li><a href="visitor_echo?visitor=<%=vlist.get(0).get("user_name")%>">他的博客</a></li>
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
<%if(!plist.isEmpty()) {%>	
	<div class="featured container">
		<div id="owl-demo" class="owl-carousel">
		<%
		
		for(int i = 0; i < plist.size(); ++i) {%>
			<div class="item">
				<div class="zoom-container">
					<div class="zoom-caption">
					</div>
					<img src="images/<%=plist.get(i).get("photo_content")%>" />
				</div>
			</div>
			<%} 
			
			}%>
			</div>
	</div>		
	
	<!-- Header -->
	
	<!-- /////////////////////////////////////////Content -->
	<%PageBean pb = (PageBean)request.getAttribute("pb"); 
		ArrayList<HashMap<String, Object>> tlist = pb.getList();
%>
	<div id="page-content" class="archive-page container">
		<div class="">
			<div class="row">
				<div id="main-content" class="col-md-8">
				<%for(int i = 0; i < tlist.size(); ++i) {
					HashMap<String,Object> map = tlist.get(i);
					%>
					<div class="box" style="text-align:center">

						<h1 class="vid-name"><%out.print(map.get("alum_name")); %></h1>
						<div class="info">
							<h5>By <%
							DB b1 = new DB();
							String sql = "select * from userinfo where user_name ='"+map.get("alum_author")+"'";
							ArrayList<HashMap<String,String>> nicheng = b1.query(sql);
							out.print(nicheng.get(0).get("user_nicheng"));
							%></h5>
							<span><i class="fa fa-calendar"></i><%out.print(map.get("alum_regTime")); %></span> 
							<ul class="list-inline">
							</ul>
						</div>
						<div class="wrap-vid">
							<div class="zoom-container" >
								<div class="zoom-caption">
								</div>
							</div>
							<p><img style="width:500px; height:300px" src="images/<%out.print(map.get("alum_img"));%>" /></p>
						</div>
					</div>
					<hr class="line">
					<%} %>
					<div class="box">
						<center>
						<ul class="pagination">
							<li>
							  <a href="photo_alum_echo?p=<%=pb.getPrevPage()%>&name=<%out.print(list.get(0).get("user_name"));%>"  aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							  </a>
							</li>
							<li><a><%=pb.getPage()%>/<%if(pb.getMaxPage() == 0){out.print("1");}else {out.print(pb.getMaxPage());}%></a></li>
							<li>
							  <a href="photo_alum_echo?p=<%=pb.getNextPage()%>&name=<%out.print(list.get(0).get("user_name"));%>" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							  </a>
							</li>
						</ul>
					</center>
					</div>
				</div>
				<div id="sidebar" class="col-md-4">
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
