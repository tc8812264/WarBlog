<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
	<script  >
var x = new Array(33);
x[0]="东城,西城,崇文,宣武,朝阳,丰台,石景山,海淀,门头沟,房山,通州,顺义,昌平,大兴,平谷,怀柔,密云,延庆";
x[1]="黄浦,卢湾,徐汇,长宁,静安,普陀,闸北,虹口,杨浦,闵行,宝山,嘉定,浦东,金山,松江,青浦,南汇,奉贤,崇明";
x[2]="和平,东丽,河东,西青,河西,津南,南开,北辰,河北,武清,红挢,塘沽,汉沽,大港,宁河,静海,宝坻,蓟县";
x[3]="万州,涪陵,渝中,大渡口,江北,沙坪坝,九龙坡,南岸,北碚,万盛,双挢,渝北,巴南,黔江,长寿,綦江,潼南,铜梁,大足,荣昌,壁山,梁平,城口,丰都,垫江,武隆,忠县,开县,云阳,奉节,巫山,巫溪,石柱,秀山,酉阳,彭水,江津,合川,永川,南川";
x[4]="石家庄,邯郸,邢台,保定,张家口,承德,廊坊,唐山,秦皇岛,沧州,衡水";
x[5]="太原,大同,阳泉,长治,晋城,朔州,吕梁,忻州,晋中,临汾,运城";
x[6]="呼和浩特,包头,乌海,赤峰,呼伦贝尔,阿拉善盟,通辽,兴安盟,乌兰察布,锡林郭勒盟,巴彦淖尔,鄂尔多斯";
x[7]="沈阳,大连,鞍山,抚顺,本溪,丹东,锦州,营口,阜新,辽阳,盘锦,铁岭,朝阳,葫芦岛";
x[8]="长春,吉林,四平,辽源,通化,白山,松原,白城,延边";
x[9]="哈尔滨,齐齐哈尔,牡丹江,佳木斯,大庆,绥化,鹤岗,鸡西,黑河,双鸭山,伊春,七台河,大兴安岭";
x[10]="南京,镇江,苏州,南通,扬州,盐城,徐州,连云港,常州,无锡,宿迁,泰州,淮安";
x[11]="杭州,宁波,温州,嘉兴,湖州,绍兴,金华,衢州,舟山,台州,丽水";
x[12]="合肥,芜湖,蚌埠,马鞍山,淮北,铜陵,安庆,黄山,滁州,宿州,池州,淮南,巢湖,阜阳,六安,宣城,亳州";
x[13]="福州,厦门,莆田,三明,泉州,漳州,南平,龙岩,宁德";
x[14]="南昌市,景德镇,九江,鹰潭,萍乡,新馀,赣州,吉安,宜春,抚州,上饶";
x[15]="济南,青岛,淄博,枣庄,东营,烟台,潍坊,济宁,泰安,威海,日照,莱芜,临沂,德州,聊城,滨州,菏泽";
x[16]="郑州,开封,洛阳,平顶山,安阳,鹤壁,新乡,焦作,濮阳,许昌,漯河,三门峡,南阳,商丘,信阳,周口,驻马店,济源";
x[17]="武汉,宜昌,荆州,襄樊,黄石,荆门,黄冈,十堰,恩施,潜江,天门,仙桃,随州,咸宁,孝感,鄂州";
x[18]="长沙,常德,株洲,湘潭,衡阳,岳阳,邵阳,益阳,娄底,怀化,郴州,永州,湘西,张家界";
x[19]="广州,深圳,珠海,汕头,东莞,中山,佛山,韶关,江门,湛江,茂名,肇庆,惠州,梅州,汕尾,河源,阳江,清远,潮州,揭阳,云浮";
x[20]="南宁,柳州,桂林,梧州,北海,防城港,钦州,贵港,玉林,南宁地区,柳州地区,贺州,百色,河池";
x[21]="海口,三亚"
x[22]="成都,绵阳,德阳,自贡,攀枝花,广元,内江,乐山,南充,宜宾,广安,达川,雅安,眉山,甘孜,凉山,泸州";
x[23]="贵阳,六盘水,遵义,安顺,铜仁,黔西南,毕节,黔东南,黔南";
x[24]="昆明,大理,曲靖,玉溪,昭通,楚雄,红河,文山,思茅,西双版纳,保山,德宏,丽江,怒江,迪庆,临沧";
x[25]="拉萨,日喀则,山南,林芝,昌都,阿里,那曲";
x[26]="西安,宝鸡,咸阳,铜川,渭南,延安,榆林,汉中,安康,商洛";
x[27]="兰州,嘉峪关,金昌,白银,天水,酒泉,张掖,武威,定西,陇南,平凉,庆阳,临夏,甘南";
x[28]="银川,石嘴山,吴忠,固原";
x[29]="西宁,海东,海南,海北,黄南,玉树,果洛,海西";
x[30]="乌鲁木齐,石河子,克拉玛依,伊犁,巴音郭勒,昌吉,克孜勒苏柯尔克孜,博尔塔拉,吐鲁番,哈密,喀什,和田,阿克苏";
x[31]="";
x[32]="";
x[33]="台北,高雄,台中,台南,屏东,南投,云林,新竹,彰化,苗栗,嘉义,花莲,桃园,宜兰,基隆,台东,金门,马祖,澎湖";

function test(a){
	alert(a.id);
	var b = document.getElementById("ns_city");
	var num,i;
	var x1 = new Array(10);
	num =a.selectedIndex;
	x1=x[num-1].split(",");
	b.options.length=x1.length+1;
	for(var i = 0; i < x1.length+1; ++i) {
		b.options[i].text =x1[i];
		b.options[i].value = x1[i];
	}
}
</script>
</head>
<body>
<select id="ns_sen" class="inp" id="ns_sen" onChange="test(this)">
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
</select> 
<select  id="ns_city" class="inp">
<option selected>请选择地区</option>
</select> 

</body>

</html>