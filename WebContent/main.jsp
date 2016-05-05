<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>123</title>
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css">
	
	<!-- Owl Carousel Assets -->
    <link href="owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="owl-carousel/owl.theme.css" rel="stylesheet">
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
	 <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
	
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
<bgsound src="music/backgroundmusic.mp3" loop=”-1″>
<object data="music/backgroundmusic.mp3" type="application/x-mplayer2" width="0" height="0"> 
<param name="src" value="music/backgroundmusic.mp3"> 
<param name="autostart" value="1"> 
<param name="playcount" value="infinite"> 
</object> 
<script type="text/javascript">
		function update_qianming() {
			var s = $("#qianming_echo>font>b").text();
			$("#qianming>input").val(s);
			$("#qianming_echo").css("display","none");
			$("#qianming").css("display","block");
			$("#qianming>input").blur(function() {
				var qianming = $("#qianming>input").val();
				$.post("update_qianming",{user_name:$("#user_name").text(),user_qianming:qianming},function(data) {
					$("#qianming_echo").html("<font size=\"3px\"><b>"+data+"</b></font><br>");
				});
				$("#qianming_echo").css("display","block");
				$("#qianming").css("display","none");
			});
		}
		$(function() {
			$("#qianming_echo").mouseover(function() {
				$("#qianming_echo").css("border","1px solid black");
			});
			$("#qianming_echo").mouseout(function() {
				$("#qianming_echo").css("border","0px");
			});
			
		});

</script>
<style type="text/css">
.alertWindowContent h1,p{text-align: center;font-size: 18px;font-weight: bolder;}
.alertWindowContent input{width: 100px; height: 50px;cursor: pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}
</style>
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
	DBV2 b = new DBV2();
	ArrayList<HashMap<String,String>> list  = new ArrayList<HashMap<String,String>>();
	ArrayList<HashMap<String,Object>> tlist  = new ArrayList<HashMap<String,Object>>();
	ArrayList<HashMap<String,Object>> alist  = new ArrayList<HashMap<String,Object>>();
	ArrayList<HashMap<String,Object>> plist  = new ArrayList<HashMap<String,Object>>();
	ArrayList<HashMap<String,Object>> Allplist = b.query("select * from photos order by photo_regTime desc",null);
	ArrayList<HashMap<String,Object>> Allalist = b.query("select * from alum order by alum_regTime desc",null);
	ArrayList<HashMap<String,Object>> Alltlist = b.query("select * from texts order by text_regTime desc",null);
	if(session.getAttribute("user")!=null) {
		list = (ArrayList<HashMap<String,String>>)session.getAttribute("user"); 
		tlist = (ArrayList<HashMap<String,Object>>)session.getAttribute("text");
		alist = (ArrayList<HashMap<String,Object>>)session.getAttribute("alum");
		plist = (ArrayList<HashMap<String,Object>>)session.getAttribute("photo");
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
		<%if(!list.isEmpty()) {%>
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
				</ul>
			<%}%>
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
	<div class="featured container">
		<div class="row">
			<div class="col-sm-8">
				<!-- Carousel -->
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<%if(Alltlist.size()>= 3) { %>
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>
					<!-- Wrapper for slides -->
						<div class="carousel-inner">
						<div class="item active">
							<a href="single_text?text_id=<%=Alltlist.get(0).get("text_id")%>&dianzanren=<%=list.get(0).get("user_name")%>"><img src="images/<%=Alltlist.get(0).get("text_img")%>" alt="First slide"></a>
							<!-- Static Header -->
							<div class="header-text hidden-xs">
								<div class="col-md-12 text-center">
									<h2><%=Alltlist.get(0).get("text_name")%> </h2>
									<br>
									<h3><%=Alltlist.get(0).get("text_regTime")%></h3>
									<br>
								</div>
							</div><!-- /header-text -->
						</div>
						<div class="item">
							<a href="single_text?text_id=<%=Alltlist.get(1).get("text_id")%>&dianzanren=<%=list.get(0).get("user_name")%>"><img src="images/<%=Alltlist.get(1).get("text_img")%>" alt="First slide"></a>
							<!-- Static Header -->
							<div class="header-text hidden-xs">
								<div class="col-md-12 text-center">
									<h2><%=Alltlist.get(1).get("text_name")%></h2>
									<br>
									<h3><%=Alltlist.get(1).get("text_regTime")%></h3>
									<br>
								</div>
							</div><!-- /header-text -->
						</div>
						<div class="item">
							<a href="single_text?text_id=<%=Alltlist.get(2).get("text_id")%>&dianzanren=<%=list.get(0).get("user_name")%>"><img src="images/<%=Alltlist.get(2).get("text_img")%>" alt="First slide"></a>
							<!-- Static Header -->
							<div class="header-text hidden-xs">
								<div class="col-md-12 text-center">
									<h2><%=Alltlist.get(2).get("text_name")%></h2>
									<br>
									<h3><%=Alltlist.get(2).get("text_regTime")%></h3>
									<br>
								</div>
							</div><!-- /header-text -->
						</div>
					</div>
					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div><!-- /carousel -->
				<%} else{%>
				
				<%} %>
				<br>
			</div>
			<div class="col-sm-4"  style="text-align:center;">
			<%if(!list.isEmpty()) {%>
				<br><br>
				<div id="user_name" style="display:none"><% out.print(list.get(0).get("user_name"));%></div>
				<div style=" border-radius:70%; overflow:hidden; "><img   id="touxiang" src="images/<% out.print(list.get(0).get("user_touxiang"));%>"  style="width:100px; height:100px;"></div><br>
				 <font size="3px" ><b><% out.print(list.get(0).get("user_nicheng")); %></b></font><br><br>
				 <div><font size="1px"><b>我的等级：<% out.print(list.get(0).get("user_level")); %> 经验值：<% out.print(list.get(0).get("user_exe")); %></b></font></div>
				 <div><font size="1px"><b>文章数：<% out.print(list.get(0).get("user_textnum"));%> 评论数：<% out.print(list.get(0).get("user_comnum"));%></b></font></div>
				 <div id="qianming" style="display:none;"><input name="update_qianming" ></div>
				 <label id= "qianming_echo"onclick="update_qianming()" style="diplay:block;"><font size="1px"><b><% out.print(list.get(0).get("user_qianming")); %></b></font><br></label>
			<%}else  {out.print("<img src=\"images/WarBar.png\" style=\"width:\"370px; height:300px\">");}%>
			</div>
		</div>
	</div>
	
	<!-- /////////////////////////////////////////Content -->
	<div id="page-content" class="index-page container">
		<div class="row">
			<div id="main-content"><!-- background not working -->
				<div class="col-md-6">
						<div class="box">
						<div class="box-header header-vimeo">
							<h2>文章</h2>
						</div>
						</div>
				<%if(!list.isEmpty()) {
					ArrayList<HashMap<String,Object>> hot  = b.query("select * from texts where text_author = '"+list.get(0).get("user_name")+"' order by text_vote desc",null);
					for(int i = 0; i < hot.size(); ++i){
				%>
					<div class="box wrap-vid">
						<div class="zoom-container">
							<div class="zoom-caption">
								<span class="youtube"></span>
								<a href="single_text?text_id=<%=hot.get(i).get("text_id")%>&dianzanren=<%=list.get(0).get("user_name")%>">
									<i class="fa fa-play icon-play" style="color: #fff"></i>
								</a>
								<p><%=hot.get(i).get("text_name")%></p>
							</div>
							<img src="images/<%=hot.get(i).get("text_img")%>" />
						</div>
						<div class="info">
							<h5>By <%
							DB b1 = new DB();
							String sql = "select * from userinfo where user_name ='"+hot.get(i).get("text_author")+"'";
							ArrayList<HashMap<String,String>> nicheng = b1.query(sql);
							out.print(nicheng.get(0).get("user_nicheng"));
							%></h5>
							<span><i class="fa fa-calendar"></i><%=hot.get(i).get("text_regTime")%></span> 
							<span><i class="fa fa-heart"></i><%=hot.get(i).get("text_vote")%></span>
						</div>
					</div>
					<%}} else {
						ArrayList<HashMap<String,Object>> hot  = b.query("select * from texts order by text_vote desc",null);
						for(int i = 0; i < hot.size(); ++i){
					%>
					<div class="box wrap-vid">
						<div class="zoom-container">
							<div class="zoom-caption">
								<span class="youtube"></span>
								<a href="single.html">
									<i class="fa fa-play icon-play" style="color: #fff"></i>
								</a>
								<p><%=hot.get(i).get("text_name")%></p>
							</div>
							<img src="images/<%=hot.get(i).get("text_img")%>" />
						</div>
						<div class="info">
							<h5>By <a href="visitor_echo?visitor=<%=hot.get(i).get("text_author")%>">By <%
							DB b1 = new DB();
							String sql = "select * from userinfo where user_name ='"+hot.get(i).get("text_author")+"'";
							ArrayList<HashMap<String,String>> nicheng = b1.query(sql);
							out.print(nicheng.get(0).get("user_nicheng"));
							%></a></h5>
							<span><i class="fa fa-calendar"></i><%=hot.get(0).get("text_regTime")%></span> 
							<span><i class="fa fa-heart"></i><%=hot.get(0).get("text_vote")%></span>
						</div>
					</div>
					<%}} %>
					
			</div>
			<div id="sidebar">
				<div class="col-md-3">
					<!---- Start Widget ---->
					<div class="widget wid-vid">
						<div class="heading">
							<h4>热门</h4>
						</div>
						<div class="content">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#most">点赞最多</a></li>
								<li><a data-toggle="tab" href="#popular">评论最多</a></li>
								<li><a data-toggle="tab" href="#random">淘一淘</a></li>
							</ul>
							<div class="tab-content">
								<div id="most" class="tab-pane fade in active">
								<%ArrayList<HashMap<String,Object>> zanhot  = b.query("select * from texts  order by text_vote desc",null);
								for(int i = 0; i < 3 && i < zanhot.size(); ++i) {%>
									<div class="post wrap-vid">
										<div class="zoom-container">
											<div class="zoom-caption">
												<span class="youtube"><%=zanhot.get(i).get("text_name")%></span>
												<p><%=zanhot.get(i).get("text_name")%></p>
											</div>
											<img class="caijian" src="images/<%=zanhot.get(i).get("text_img")%>" />
										</div>
										<div class="wrapper">
											<h5 class="vid-name"><a href="single_text?text_id=<%=zanhot.get(i).get("text_id")%>&dianzanren=<%=list.get(0).get("user_name")%>"><%=zanhot.get(i).get("text_name")%></a></h5>
											<div class="info">
												<h6>By <a href="visitor_echo?visitor=<%=zanhot.get(i).get("text_author")%>"><%
							DB b1 = new DB();
							String sql = "select * from userinfo where user_name ='"+zanhot.get(i).get("text_author")+"'";
							ArrayList<HashMap<String,String>> nicheng = b1.query(sql);
							out.print(nicheng.get(0).get("user_nicheng"));
							%></a></h6>
												<span><i class="fa fa-heart"></i><%=zanhot.get(i).get("text_vote")%></span>
												<span><i class="fa fa-calendar"></i><%=zanhot.get(i).get("text_regTime")%></span>
											</div>
										</div>
									</div>
									<%} %>
								</div>
								<div id="popular" class="tab-pane fade">
									<%ArrayList<HashMap<String,Object>> comhot  = b.query("select * from texts  order by text_comnum desc",null);
								for(int i = 0; i < 3 && i < comhot.size(); ++i) {%>
									<div class="post wrap-vid">
										<div class="zoom-container">
											<div class="zoom-caption">
												<span class="youtube"><%=comhot.get(i).get("text_name")%></span>
												<p><%=comhot.get(i).get("text_name")%></p>
											</div>
											<img class="caijian" src="images/<%=comhot.get(i).get("text_img")%>" />
										</div>
										<div class="wrapper">
											<h5 class="vid-name"><a href="single_text?text_id=<%=comhot.get(i).get("text_id")%>&dianzanren=<%=list.get(0).get("user_name")%>"><%=comhot.get(i).get("text_name")%></a></h5>
											<div class="info">
												<h6>By <a href="visitor_echo?visitor=<%=comhot.get(i).get("text_author")%>"><%
							DB b1 = new DB();
							String sql = "select * from userinfo where user_name ='"+comhot.get(i).get("text_author")+"'";
							ArrayList<HashMap<String,String>> nicheng = b1.query(sql);
							out.print(nicheng.get(0).get("user_nicheng"));
							%></a></h6>
												<span><i class="fa fa-star"></i><%=comhot.get(i).get("text_comnum")%></span>
												<span><i class="fa fa-calendar"></i><%=comhot.get(i).get("text_regTime")%></span>
											</div>
										</div>
									</div>
									<%} %>
								</div>
								<div id="random" class="tab-pane fade">
								<%ArrayList<HashMap<String,Object>> ran  = b.query("SELECT t.*,RAND() AS n FROM texts AS t ORDER BY n ",null);
								for(int i = 0; i < 3 && i < ran.size(); ++i) {%>
									<div class="post wrap-vid">
										<div class="zoom-container">
											<div class="zoom-caption">
												<span class="youtube"><%=ran.get(i).get("text_name")%></span>
												<a href="single.html">
													<i class="fa fa-play-circle-o fa-3x" style="color: #fff"></i>
												</a>
												<p><%=ran.get(i).get("text_name")%></p>
											</div>
											<img class="caijian" src="images/<%=ran.get(i).get("text_img")%>" />
										</div>
										<div class="wrapper">
											<h5 class="vid-name"><a href="single_text?text_id=<%=ran.get(i).get("text_id")%>&dianzanren=<%=list.get(0).get("user_name")%>"><%=ran.get(i).get("text_name")%></a></h5>
											<div class="info">
												<h6>By <a href="visitor_echo?visitor=<%=ran.get(i).get("text_author")%>"><%
							DB b1 = new DB();
							String sql = "select * from userinfo where user_name ='"+ran.get(i).get("text_author")+"'";
							ArrayList<HashMap<String,String>> nicheng = b1.query(sql);
							out.print(nicheng.get(0).get("user_nicheng"));
							%></a></h6>
												<span><i class="fa fa-star"></i><%=ran.get(i).get("text_comnum")%></span>
												<span><i class="fa fa-calendar"></i><%=ran.get(i).get("text_regTime")%></span>
											</div>
										</div>
									</div>
									<%} %>
								</div>
							</div>
						</div>
					</div>
					<!---- Start Widget ---->
					<div class="widget wid-gallery">
						<div class="heading"><h4>好友</h4></div>
						<div class="content">
							<div class="col-md-4">
								<div class="row">
									<a href="#"><img src="images/14.jpg" /></a>
									<a href="#"><img src="images/15.jpg" /></a>
									<a href="#"><img src="images/20.jpg" /></a>
								</div>
							</div>
							<div class="col-md-4">
								<div class="row">
									<a href="#"><img src="images/16.jpg" /></a>
									<a href="#"><img src="images/17.jpg" /></a>
									<a href="#"><img src="images/21.jpg" /></a>
								</div>
							</div>
							<div class="col-md-4">
								<div class="row">
									<a href="#"><img src="images/18.jpg" /></a>
									<a href="#"><img src="images/19.jpg" /></a>
									<a href="#"><img src="images/14.jpg" /></a>
								</div>
							</div>
						</div>
					</div>
					<!---- Start Widget ---->
					
					<!---- Start Widget ---->
					
				</div>
				<div class="col-md-3">
					<!---- Start Widget ---->
					<div class="widget wid-tags">
						<div class="heading"><h4>文章名搜索</h4></div>
						<div class="content">
							<form role="form" class="form-horizontal" method="post" action="">
								<input type="text" placeholder="Enter Search Keywords" value="" name="v_search" id="v_search" class="form-control">
							</form>
						</div>
					</div>
					<!---- Start Widget ---->

					<!---- Start Widget ---->

					<!---- Start Widget ---->
					<div class="widget wid-banner">
						<div class="content">
							<img src="images/banner-2.jpg" class="img-responsive"/>
						</div>
					</div>
					<!---- Start Widget ---->
					<div class="widget wid-calendar">
						<div class="heading"><h4>日历</h4></div>
						<div class="content">
							<center><form action="" role="form">        
								<div class="">
									<div class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">                </div>
									<input type="hidden" id="dtp_input2" value="" /><br/>
								</div>
							</form></center>
						</div>
					</div>
					<!---- Start Widget ---->
					
					
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
      $("#owl-demo-1").owlCarousel({
        autoPlay: 3000,
        items : 1,
        itemsDesktop : [1199,1],
        itemsDesktopSmall : [400,1]
      });
	  $("#owl-demo-2").owlCarousel({
        autoPlay: 3000,
        items : 3
        
      });
    });
    </script>
	
	
	<script type="text/javascript" src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<script type="text/javascript">
	$(".caijian").css("height","70px");
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
</script>
</body>
</html>
