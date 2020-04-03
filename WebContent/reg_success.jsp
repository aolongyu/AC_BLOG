<!-- 目前无用 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>欢迎加入AC-BOLG</p>
	<p>5s后跳转到首页</p>
	<script type="text/javascript">
		function jump() {
			window.location.href = 'login_no.jsp';
		}
		setTimeout(jump, 5000);
	</script>
</body>
</html>