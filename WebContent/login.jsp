<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Welcome AC-BLOG</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="bootstrap/css/bootstrap-4.2.1.css" rel="stylesheet">
<!-- <link href="bootstrap/css/bootstrap.css" rel="stylesheet"> -->
<link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<form action="LoginAC_Servlet">
		<div style="width: 100%; margin-top: 50px">
			<div class="form-group">
				<label for="id">用户ID</label>
				<input type="tel" class="form-control" id="id" name="id" placeholder="UserId(Tel number)">
			</div>
			<div class="form-group">
				<label for="pwd">密码</label>
				<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password">
			</div>
			<button type="submit" class="btn btn-default">登陆</button>
			<a href="welcome.jsp" target="left">返回</a>
			<br><br>
			<div><h6>没有账号？<a href="waiting_get.jsp">注册</a></h6></div>
		</div>
	</form>
</body>
</html>