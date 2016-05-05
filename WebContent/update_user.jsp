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
<script src="js/jquery.js"></script>
<script type="text/javascript">
	function update_user() {
		$("#phoneerror").html("");
		$("#emailerror").html("");
		var user_echo = new Array(10);
		$(".user_echo").each(function(i) {
			user_echo[i] = $(this).text();
		});
		$(".user>input[type!=radio]").each(function(i) {
			$(this).val(user_echo[i]);
		});
		$("#sex_echo").css("display", "none");
		$(".sex").css("display", "block");
		$(".xx").css("display", "none");
		$(".up_xx").css("display", "block");
		$(".user_echo").css("display", "none");
		$(".user").css("display", "block");
		$("#update_but").css("display", "none");
		$("#updated_but").css("display", "block");
		$("#but1")
				.click(
						function() {
							var phone = $("#phone>input").val();
							var email = $("#email>input").val();
							if (!phone
									.match(/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/)) {
								$("#phoneerror").html("修改失败，手机格式有误。");
							} else {
								if (!email
										.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.([a-zA-Z0-9_-])+)+$/)) {
									$("#emailerror").html("修改失败，邮箱格式有误。");
								} else {
									$
											.post(
													"update_user",
													{
														user_name : $(
																"#user_name")
																.text(),
														user_qianming : $(
																"#qianming>input")
																.val(),
														user_nicheng : $(
																"#nicheng>input")
																.val(),
														user_sex : $(
																'input[name="user_sex"]:checked')
																.val(),
														user_phone : $(
																"#phone>input")
																.val(),
														user_email : $(
																"#email>input")
																.val(),
														user_xingzuo : $(
																'#xingzuo_sel option:selected')
																.text(),
														user_shengxiao : $(
																'#shengxiao_sel option:selected')
																.text(),
														user_zhiye : $(
																'#zhiye_sel option:selected')
																.text(),
														user_sheng : $(
																'#ns_sen option:selected')
																.text(),
														user_shi : $(
																'#ns_city option:selected')
																.text()
													},
													function(data) {
														var user = data;
														$("#qianming_echo")
																.text(user[0].user_qianming);
														$("#nicheng_echo")
																.text(user[0].user_nicheng);
														$("#sex_echo")
																.text(user[0].user_sex);
														$("#phone_echo")
																.text(user[0].user_phone);
														$("#email_echo")
																.text(user[0].user_email);
														if (user[0].user_xingzuo == "请选择星座") {
															$("#xingzuo_echo")
																	.text("快选择自己的星座吧");
														} else {
															$("#xingzuo_echo")
																	.text(user[0].user_xingzuo);
														}
														if (user[0].user_shengxiao == "请选择生肖") {
															$("#shengxiao_echo")
																	.text("快选择自己的生肖吧");
														} else {
															$("#shengxiao_echo")
																	.text(user[0].user_shengxiao);
														}
														if (user[0].user_zhiye == "请选择职业") {
															$("#zhiye_echo")
																	.text("从事什么呢?");
														} else {
															$("#zhiye_echo")
																	.text(user[0].user_zhiye);
														}
														if (user[0].user_sheng == "请选择省市" || user[0].user_shi == "请选择地区") {
															$("#dizhi_echo")
																	.text("住哪里呢?");
														} else {
															$("#dizhi_echo")
																	.text(user[0].user_sheng+"省"+user[0].user_shi+"市");
														}
													}, "json");
								}
							}
							$("#sex_echo").css("display", "block");
							$(".sex").css("display", "none");
							$(".user_echo").css("display", "block");
							$(".user").css("display", "none");
							$("#update_but").css("display", "block");
							$("#updated_but").css("display", "none");
							$(".xx").css("display", "block");
							$(".up_xx").css("display", "none");

						});
		$("#but2").click(function() {
			$("#sex_echo").css("display", "block");
			$(".sex").css("display", "none");
			$(".user_echo").css("display", "block");
			$(".user").css("display", "none");
			$("#update_but").css("display", "block");
			$("#updated_but").css("display", "none");
			$(".xx").css("display", "block");
			$(".up_xx").css("display", "none");
		});
	}
	var x = new Array(33);
	x[0] = "东城,西城,崇文,宣武,朝阳,丰台,石景山,海淀,门头沟,房山,通州,顺义,昌平,大兴,平谷,怀柔,密云,延庆";
	x[1] = "黄浦,卢湾,徐汇,长宁,静安,普陀,闸北,虹口,杨浦,闵行,宝山,嘉定,浦东,金山,松江,青浦,南汇,奉贤,崇明";
	x[2] = "和平,东丽,河东,西青,河西,津南,南开,北辰,河北,武清,红挢,塘沽,汉沽,大港,宁河,静海,宝坻,蓟县";
	x[3] = "万州,涪陵,渝中,大渡口,江北,沙坪坝,九龙坡,南岸,北碚,万盛,双挢,渝北,巴南,黔江,长寿,綦江,潼南,铜梁,大足,荣昌,壁山,梁平,城口,丰都,垫江,武隆,忠县,开县,云阳,奉节,巫山,巫溪,石柱,秀山,酉阳,彭水,江津,合川,永川,南川";
	x[4] = "石家庄,邯郸,邢台,保定,张家口,承德,廊坊,唐山,秦皇岛,沧州,衡水";
	x[5] = "太原,大同,阳泉,长治,晋城,朔州,吕梁,忻州,晋中,临汾,运城";
	x[6] = "呼和浩特,包头,乌海,赤峰,呼伦贝尔,阿拉善盟,通辽,兴安盟,乌兰察布,锡林郭勒盟,巴彦淖尔,鄂尔多斯";
	x[7] = "沈阳,大连,鞍山,抚顺,本溪,丹东,锦州,营口,阜新,辽阳,盘锦,铁岭,朝阳,葫芦岛";
	x[8] = "长春,吉林,四平,辽源,通化,白山,松原,白城,延边";
	x[9] = "哈尔滨,齐齐哈尔,牡丹江,佳木斯,大庆,绥化,鹤岗,鸡西,黑河,双鸭山,伊春,七台河,大兴安岭";
	x[10] = "南京,镇江,苏州,南通,扬州,盐城,徐州,连云港,常州,无锡,宿迁,泰州,淮安";
	x[11] = "杭州,宁波,温州,嘉兴,湖州,绍兴,金华,衢州,舟山,台州,丽水";
	x[12] = "合肥,芜湖,蚌埠,马鞍山,淮北,铜陵,安庆,黄山,滁州,宿州,池州,淮南,巢湖,阜阳,六安,宣城,亳州";
	x[13] = "福州,厦门,莆田,三明,泉州,漳州,南平,龙岩,宁德";
	x[14] = "南昌市,景德镇,九江,鹰潭,萍乡,新馀,赣州,吉安,宜春,抚州,上饶";
	x[15] = "济南,青岛,淄博,枣庄,东营,烟台,潍坊,济宁,泰安,威海,日照,莱芜,临沂,德州,聊城,滨州,菏泽";
	x[16] = "郑州,开封,洛阳,平顶山,安阳,鹤壁,新乡,焦作,濮阳,许昌,漯河,三门峡,南阳,商丘,信阳,周口,驻马店,济源";
	x[17] = "武汉,宜昌,荆州,襄樊,黄石,荆门,黄冈,十堰,恩施,潜江,天门,仙桃,随州,咸宁,孝感,鄂州";
	x[18] = "长沙,常德,株洲,湘潭,衡阳,岳阳,邵阳,益阳,娄底,怀化,郴州,永州,湘西,张家界";
	x[19] = "广州,深圳,珠海,汕头,东莞,中山,佛山,韶关,江门,湛江,茂名,肇庆,惠州,梅州,汕尾,河源,阳江,清远,潮州,揭阳,云浮";
	x[20] = "南宁,柳州,桂林,梧州,北海,防城港,钦州,贵港,玉林,南宁地区,柳州地区,贺州,百色,河池";
	x[21] = "海口,三亚"
	x[22] = "成都,绵阳,德阳,自贡,攀枝花,广元,内江,乐山,南充,宜宾,广安,达川,雅安,眉山,甘孜,凉山,泸州";
	x[23] = "贵阳,六盘水,遵义,安顺,铜仁,黔西南,毕节,黔东南,黔南";
	x[24] = "昆明,大理,曲靖,玉溪,昭通,楚雄,红河,文山,思茅,西双版纳,保山,德宏,丽江,怒江,迪庆,临沧";
	x[25] = "拉萨,日喀则,山南,林芝,昌都,阿里,那曲";
	x[26] = "西安,宝鸡,咸阳,铜川,渭南,延安,榆林,汉中,安康,商洛";
	x[27] = "兰州,嘉峪关,金昌,白银,天水,酒泉,张掖,武威,定西,陇南,平凉,庆阳,临夏,甘南";
	x[28] = "银川,石嘴山,吴忠,固原";
	x[29] = "西宁,海东,海南,海北,黄南,玉树,果洛,海西";
	x[30] = "乌鲁木齐,石河子,克拉玛依,伊犁,巴音郭勒,昌吉,克孜勒苏柯尔克孜,博尔塔拉,吐鲁番,哈密,喀什,和田,阿克苏";
	x[31] = "";
	x[32] = "";
	x[33] = "台北,高雄,台中,台南,屏东,南投,云林,新竹,彰化,苗栗,嘉义,花莲,桃园,宜兰,基隆,台东,金门,马祖,澎湖";

	function test(a) {
		alert(a.id);
		var b = document.getElementById("ns_city");
		var num, i;
		var x1 = new Array(10);
		num = a.selectedIndex;
		x1 = x[num - 1].split(",");
		b.options.length = x1.length + 1;
		for ( var i = 0; i < x1.length + 1; ++i) {
			b.options[i].text = x1[i];
			b.options[i].value = x1[i];
		}
	}
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
					<li><a href="xiaohui"><i class="fa fa-home"></i> <%ArrayList<HashMap<String,String>> list  = new ArrayList<HashMap<String,String>>();
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
			<li><a href="contact.html"><i class="fa fa-envelope"></i>联系我们</a></li>
		</ul>
		<%
		System.out.println("-----");
		%>
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
						<div style="float: right">
							<div style="display: none" id="updated_but"><button id="but1"><b>保存</b></button><button id="but2"><b>取消</b></button></div>
							<div style="display: block" id="update_but">
								<button id="update_user" onclick="update_user()"><b>修改资料</b></button></div>
						</div>
						<br>
						<div>
							<img src="images/hengxian.png">
						</div>
						<br> <b>个性签名：</b><br>
						<div id="qianming" class="user" style="display: none; width:400px"><input name="update_qianming" style="width:400px"></div>
						<label id="qianming_echo" class="user_echo" style="diplay: block;"><font size="3px"><b><% out.print(list.get(0).get("user_qianming"));%></b> </font> </label>
						<table style="text-align: center; width: 700px; height: 300px; font-weight: bold;">
							<div id="user_name" style="display: none"><%out.print(list.get(0).get("user_name"));%></div>
							<tr>
								<td>昵称：</td>
								<td><div id="nicheng" class="user" style="display: none;"><input name="update_nicheng"></div> <label id="nicheng_echo" class="user_echo"
									style="diplay: block;"><font size="3px"><b><%out.print(list.get(0).get("user_nicheng"));%></b></font></label></td>
								<td>性别：</td>
								<td><div class="sex" style="display: none;"><input type="radio" id="user_sex" name="user_sex" value="男"checked>男 <input type="radio" id="user_sex" name="user_sex" value="女">女</div> <label id="sex_echo" style="diplay: block;"><font
										size="3px"><b><%out.print(list.get(0).get("user_sex"));%></b></font></label></td>
							</tr>
							<tr>
								<td>电话：</td>
								<td><div id="phone" class="user" style="display: none;"><input name="update_phone"></div><label id="phone_echo" class="user_echo"
									style="diplay: block;"><font size="3px"><b><%out.print(list.get(0).get("user_phone"));%></b></font></label><p id="phoneerror" style="color: red; font-size: 5px;"></p></td>
								<td>邮箱：</td>
								<td><div id="email" class="user" style="display: none;"><input name="update_phone"></div> <label id="email_echo" class="user_echo"
									style="diplay: block;"><font size="3px"><b><%out.print(list.get(0).get("user_email"));%></b></font></label><p id="emailerror" style="color: red; font-size: 5px;"></p></td>
							</tr>
						</table>
						<%
		System.out.println("11111111");
		%>
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
									<div id="xingzuo" class="up_xx" style="display: none;">
										<select id="xingzuo_sel" class="xingzuo" id="xingzuo_sel">
											<option selected>请选择星座</option>
											<option value="0">白羊座</option>
											<option value="1">金牛座</option>
											<option value="2">双子座</option>
											<option value="3">巨蟹座</option>
											<option value="4">狮子座</option>
											<option value="5">处女座</option>
											<option value="6">天秤座</option>
											<option value="7">天蝎座</option>
											<option value="8">射手座</option>
											<option value="9">摩羯座</option>
											<option value="10">水瓶座</option>
											<option value="11">双鱼座</option>
										</select>
									</div><label id="xingzuo_echo" class="xx" style="diplay: block;"><font
										size="3px"><b><%if(list.get(0).get("user_xingzuo") != null && !list.get(0).get("user_xingzuo").equals("请选择星座")){
								out.print(list.get(0).get("user_xingzuo"));
								}else {
									out.print("快选择自己的星座吧！");
								}%> </b></font></label></td>
								<td>生肖：</td>
								<td>
									<div class="up_xx" style="display: none;">
										<select id="shengxiao_sel" id="shengxiao_sel">
											<option selected>请选择生肖</option>
											<option value="0">鼠</option>
											<option value="1">牛</option>
											<option value="2">虎</option>
											<option value="3">兔</option>
											<option value="4">龙</option>
											<option value="5">蛇</option>
											<option value="6">马</option>
											<option value="7">羊</option>
											<option value="8">猴</option>
											<option value="9">鸡</option>
											<option value="10">狗</option>
											<option value="11">猪</option>
										</select>
										<%
		System.out.println(list.get(0));
		%>
									</div> <label id="shengxiao_echo" class="xx" style="diplay: block;"><font
										size="3px"><b> <%if(list.get(0).get("user_shengxiao") != null && list.get(0).get("user_shengxiao").equals("请选择生肖")){
								out.print(list.get(0).get("user_shengxiao"));
								}else {
									out.print("快选择自己的生肖吧！");
								}%> </b></font></label></td>
							</tr>
							<tr>
								<td>职业：</td>
								<td>
									<div class="up_xx" style="display: none;">
										<select id="zhiye_sel" id="zhiye_sel">
											<option selected>请选择职业</option>
											<option value="0">学生</option>
											<option value="1">歌手</option>
											<option value="2">演员</option>
											<option value="3">IT人士</option>
											<option value="4">公务员</option>
											<option value="5">个体经营</option>
											<option value="6">军人</option>
										</select>
									</div> <label id="zhiye_echo" class="xx" style="diplay: block;"><font
										size="3px"><b> <%if(list.get(0).get("user_zhiye") != null && list.get(0).get("user_zhiye").equals("请选择职业")){
								out.print(list.get(0).get("user_zhiye"));
								}else {
									out.print("从事什么呢?");
								}%> </b></font></label></td>
<%
		System.out.println("--32222---");
		%>
								<td>个人地址：</td>
								<td>
									<div class="up_xx" style="display: none;">
										<select id="ns_sen" class="inp" id="ns_sen"
											onChange="test(this)">
											<option selected>请选择省市</option>
											<option value="0">北京</option>
											<option value="1">上海</option>
											<option value="2">天津</option>
											<option value="3">重庆</option>
											<option value="4">河北</option>
											<option value="5">山西</option>
											<option value="6">内蒙古</option>
											<option value="7">辽宁</option>
											<option value="8">吉林</option>
											<option value="9">黑龙江</option>
											<option value="10">江苏</option>
											<option value="11">浙江</option>
											<option value="12">安徽</option>
											<option value="13">福建</option>
											<option value="14">江西</option>
											<option value="15">山东</option>
											<option value="16">河南</option>
											<option value="17">湖北</option>
											<option value="18">湖南</option>
											<option value="19">广东</option>
											<option value="20">广西</option>
											<option value="21">海南</option>
											<option value="22">四川</option>
											<option value="23">贵州</option>
											<option value="24">云南</option>
											<option value="25">西藏</option>
											<option value="26">陕西</option>
											<option value="27">甘肃</option>
											<option value="28">宁夏</option>
											<option value="29">青海</option>
											<option value="30">新疆</option>
											<option value="31">香港</option>
											<option value="32">澳门</option>
											<option value="33">台湾</option>
										</select> <select id="ns_city" class="inp">
											<option selected>请选择地区</option>
										</select>
									</div> <label id="dizhi_echo" class="xx" style="diplay: block;"><font
										size="3px"><b> <%if(list.get(0).get("user_sheng") != null){
									out.print(list.get(0).get("user_sheng")+"省"+list.get(0).get("user_shi")+"市");
								}else {
									out.print("住哪里？");
								}%> </b></font></label></td>
							</tr>
							<tr>
								<td>身份证：</td>
								<td>
									<%out.print(list.get(0).get("user_idcard"));%>
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
