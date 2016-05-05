<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
		<script charset="utf-8" src="kd/kindeditor-min.js"></script>
		<script charset="utf-8" src="kd/lang/zh_CN.js"></script>
		<script>
			var editor;
			var huifu;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					resizeType : 1,
					allowPreviewEmoticons : false,
					uploadJson : 'kd/upload_json.jsp',
					items : [
						'source','fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link']
				});
			});
			
			function fun() {
				huifu = editor.html();
				$("#content").append(huifu);
			}
		</script>
</head>
<body>
	<div id="content"></div>
	<textarea name="content"  rows="20" cols="150"></textarea>
	<input type="button"  value="发表" onclick="fun()">
</body>
</html>