<!-- 登录成功后重置right and left -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
   session.invalidate(); // 注销 session 
  %>
	<h4>Please Waiting...</h4>
	<a id="jump" href="login_no.jsp" target="right"></a>
	<a id="jump2" href="welcome.jsp" target="left"></a>
	<script>
		document.getElementById("jump").click();
		document.getElementById("jump2").click();
	</script>
</body>
</html>