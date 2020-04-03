<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../bootstrap/css/bootstrap-4.2.1.css" rel="stylesheet">
<!-- <link href="../bootstrap/css/bootstrap.css" rel="stylesheet"> -->
<link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet">
<script src="../jquery/jquery.js"></script>
<script src="../bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<div>
		<a href="admin_user.jsp" target="admin">管理用户</a>
		<a href="admin_message.jsp" target="admin">管理文章</a>
	</div>
	<hr>
	<iframe class="iframe" name="admin" src="admin_user.jsp"
		style="width: 100%; height: 600px; border: 0; scrolling: no"></iframe>
</body>
</html>