<!-- 登录成功后重置right and left -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>Please Waiting...</h4>
	
	<!-- 右iframe跳转 -->
	<a id="jump" href="admin.jsp" target="right"></a>
	
	<!-- 左iframe跳转 -->
	<a id="jump2" href="message_show.jsp" target="left"></a>
	
	<!-- 执行自动点击超链接 -->
	<script>
		document.getElementById("jump").click();
		document.getElementById("jump2").click();
	</script>
</body>
</html>