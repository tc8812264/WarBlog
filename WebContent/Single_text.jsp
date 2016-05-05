<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>文章</title>
	
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
        <%ArrayList<HashMap<String,String>> list  = new ArrayList<HashMap<String,String>>();
	list = (ArrayList<HashMap<String,String>>)session.getAttribute("user"); 
		%>
		<%    ArrayList<HashMap<String,String>> text = (ArrayList<HashMap<String,String>>)session.getAttribute("singletext");
		ArrayList<HashMap<String,String>> huifu = (ArrayList<HashMap<String,String>>)session.getAttribute("huifu");
		ArrayList<HashMap<String,String>> dianzan = (ArrayList<HashMap<String,String>>)session.getAttribute("dianzan");
		%>
    <script src="js/jquery.js"></script>
		<script charset="utf-8" src="kd/kindeditor-min.js"></script>
		<script charset="utf-8" src="kd/lang/zh_CN.js"></script>
    <script type = "text/javascript" src = "js/upload.js"></script>
		<script>
			var editor;
			var huifu;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="huifu_content"]', {
					resizeType : 1,
					allowPreviewEmoticons : false,
					uploadJson : 'kd/upload_json.jsp',
					items : [
						'source','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link']
				});
			});
			var huifudehuifu_host = '<%=list.get(0).get("user_name")%>';
			var huifudehuifu_client = '<%=text.get(0).get("text_author")%>';
			function huifufun(i){
				$("#huifudehuifu").css("display","block");
				huifudehuifu_host = $("#huifuren"+i+"").val();
				huifudehuifu_client = $("#beihuifuren"+i+"").val();
				alert(huifudehuifu_host+" "+huifudehuifu_client);
			}
			$(function(){
				var now = parseInt(<%=text.get(0).get("text_comnum")%>);
				$("#btnBbooking").click(function(){
					$.post("reply_echo",{huifuren:huifudehuifu_host,beihuifuren:huifudehuifu_client,huifu_text:$("#text_id").val(),huifu_content:editor.html()},function(data){
						window.location.reload();
					},"json");
					
				});
				var Ifdianzan;
				if( parseInt(<%=dianzan.get(0).get("vote_tag")%>) == 1) {
					Ifdianzan = true;
				}else {
					Ifdianzan = false;
				}
				$("#dianzan_heart").click(function(){
					Ifdianzan = !Ifdianzan;
					if(Ifdianzan){
						$("#dianzan_heart").html("<img src=\"images/heart.png\">");
						$.post("update_vote",{dianzanren:$("#dianzanren").val(),beidianzanren:$("#beidianzanren").val(),dianzan_text:$("#dianzan_text").val(),dianzan_tag:"1",dianzan_type:"1"},function(data){
							alert(data);
						});
					}else {
						$("#dianzan_heart").html("<i class=\"fa fa-heart\"></i>");
						$.post("update_vote",{dianzanren:$("#dianzanren").val(),beidianzanren:$("#beidianzanren").val(),dianzan_text:$("#dianzan_text").val(),dianzan_tag:"0",dianzan_type:"1"},function(data){
							alert(data);
						});
					}
				});
			});
		</script>
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
					<li><a href="xiaohui"><i class="fa fa-home"></i><%out.print(list.get(0).get("user_nicheng")+",登出");%> </a></li>
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
			<li><a href="update_main?user_name=<%=list.get(0).get("user_name")%>">我的博客</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">个人中心<i class="fa fa-arrow-circle-o-down"></i>
			</a>
				<div class="dropdown-menu">
					<div class="dropdown-inner">
						<ul class="list-unstyled">
							<li><a
								href="find_user?name=<%out.print(list.get(0).get("user_name"));%>">个人资料</a>
							</li>
							<li><a
								href="friend_echo?name=<%out.print(list.get(0).get("user_name"));%>">好友列表</a>
							</li>
						</ul>
					</div>
				</div>
			</li>
			<li><a href="archive_echo?name=<%out.print(list.get(0).get("user_name"));%>"><i class="fa fa-cubes"></i>我的文章</a></li>
			<li><a href="new_reply?name=<%out.print(list.get(0).get("user_name"));%>"><i class="fa fa-cubes"></i>我的回复</a></li>
			<li><a href="photo_alum_echo?name=<%out.print(list.get(0).get("user_name"));%>"><i class="fa fa-cubes"></i>我的相册</a></li>
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
	
	<!-- /////////////////////////////////////////Content -->
	<div id="page-content" class="single-page container">
		<div class="row">
			<div id="main-content" class="col-md-8">
				<div class="box">
					<div class="wrap-vid">
						<img width="100%" height="400" src="images/<%=text.get(0).get("text_img") %>" >
					</div>
					<br>
					<div class="line"></div>
					<h1 class="vid-name"><a href="#"><%=text.get(0).get("text_name")%></a></h1>
					<div class="info">
						<h5>By <%
							DB b1 = new DB();
							String sql = "select * from userinfo where user_name ='"+text.get(0).get("text_author")+"'";
							ArrayList<HashMap<String,String>> nicheng = b1.query(sql);
							out.print(nicheng.get(0).get("user_nicheng"));
							%></h5>
						<span><i class="fa fa-calendar"></i><%=text.get(0).get("text_regTime")%></span> 
						<input type="hidden" id="dianzanren" value="<%=list.get(0).get("user_name")%>">
						<input type="hidden" id="beidianzanren" value="<%=text.get(0).get("text_author")%>">
						<input type="hidden" id="dianzan_text" value="<%=text.get(0).get("text_id")%>">
						<span id="dianzan_heart">
						<%if(dianzan.get(0).get("vote_tag").equals("0")){ %>
						<i class="fa fa-heart"></i>
						<%}else {%>
						<img src="images/heart.png">
						<%} %>
						</span>
						<span id="pinglunshu"><i class="fa fa-star"></i><%=text.get(0).get("text_comnum")%></span>
					</div>
					<p style="margin-top: 20px"><%=text.get(0).get("text_content")%></p>
					<div id="huifuneirong" class="line">
					<input type="hidden" id="text_id" value="<%=text.get(0).get("text_id")%>">
					<%for(int i = 0; i < huifu.size(); ++i) {%>
						<div style="border:1px solid #C7C7C7">
						<span><font size="3px"><%=huifu.get(i).get("reply_author")%>@<%=huifu.get(i).get("reply_textauthor")%>:<%=huifu.get(i).get("reply_content")%></font><br><i class="fa fa-calendar"></i><%=huifu.get(i).get("reply_regTime")%></span>
						<div style="float:right"><button onclick="huifufun(<%=i%>)">回复</button></div>
							<input type="hidden" id="huifuren<%=i%>" value="<%=list.get(0).get("user_name")%>">
							<input type="hidden" id="beihuifuren<%=i%>" value="<%=huifu.get(i).get("reply_author")%>">
						</div>
						<%} %>						
					</div>
					<br>
					<div class="comment">
						<h5>发表3评论</h5>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<input type="hidden" id="text_id" value="<%=text.get(0).get("text_id")%>">
										<textarea name="huifu_content" id="huifu_content" class="form-control" rows="4" cols="25"></textarea>
									</div>						
									<button type="submit" class="btn btn-4 btn-block" name="btnBooking" id="btnBbooking">
								评论</button>
								</div>
							</div>
					</div>
				</div>
				
				<div class="box">
					<div class="box-header header-natural">
						<h2>RELATED VIDEOS</h2>
					</div>
					<div class="box-content">
						<div class="row">
							<div class="col-md-4">
								<div class="wrap-vid">
									<div class="zoom-container">
										<div class="zoom-caption">
											<span>Youtube</span>
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
							</div>
							<div class="col-md-4">
								<div class="wrap-vid">
									<div class="zoom-container">
										<div class="zoom-caption">
											<span>Youtube</span>
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
							</div>
							<div class="col-md-4">
								<div class="wrap-vid">
									<div class="zoom-container">
										<div class="zoom-caption">
											<span>Youtube</span>
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
							</div>
						</div>
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
									<span>Youtube</span>
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
											<span>Youtube</span>
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
									<span>Youtube</span>
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
									<span>Youtube</span>
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
									<span>Youtube</span>
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
									<span>Youtube</span>
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
