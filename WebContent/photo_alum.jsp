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
	
    <title>我的相册!</title>
	
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
	function deleteAlbum(i){
		$.post("deleteAlbum",{album_id:$("#album_id"+i+"").val()},function(data){
			alert("删除成功！");
			window.location.reload();
		});
	}
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
	ArrayList<HashMap<String,String>> plist  = (ArrayList<HashMap<String,String>>)session.getAttribute("photo");
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
				<li><a href="update_main?user_name=<%=list.get(0).get("user_name")%>">我的博客</a></li>
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
				<li><a href="xiangce_echo?name=<%out.print(list.get(0).get("user_name"));%>"><i class="fa fa-cubes"></i>创建相册</a></li>
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
						<span><%=plist.get(i).get("photo_alum_id")%></span>
					</div>
					<img src="images/<%=plist.get(i).get("photo_content")%>" />
				</div>
			</div>
			<%} 
			
			}%>
			</div>
	</div>		
	
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
					<input id="album_id<%=i%>" type="hidden" value="<%=map.get("alum_id")%>">
						<a href="photo_echo?album_id=<%=map.get("alum_id")%>"><h1 class="vid-name"><%out.print(map.get("alum_name")); %></h1></a>
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
							<p><img style="width:500px; height:300px" src="images/<%out.print(map.get("alum_img"));%>" /><br><br>
							<button onclick="deleteAlbum(<%=i%>)">删除相册</button>
							</p>
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
					
					<!---- Start Widget ---->
					<div class="widget ">
						<div class="heading"><h4>最近发布</h4></div>
						<div class="content">
						<%if(!plist.isEmpty()) {
						 for(int i = 0; i < plist.size(); ++i) {%>
							<div class="wrap-vid">
								<div class="zoom-container">
									<div class="zoom-caption">
									</div>
									<img src="images/<%=plist.get(i).get("photo_content")%>" />
								</div>
								<div class="info">
									<span><i class="fa fa-calendar"></i><%=plist.get(i).get("photo_regTime")%></span> 
								</div>
							</div>
							<%}} %>
							
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
