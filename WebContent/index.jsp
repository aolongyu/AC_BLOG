<!-- 主页面 -->
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
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="index.jsp"><img alt="logo"
				src="images/logo.jpg" style="width: 50px; height: 50px"></a> <a
				class="navbar-brand" href="index.jsp">AC-BOLG</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
		</nav>
		<table class="table table-bordered" style="height: 100%; width: 100%">
			<tr>
				<td style="width: 15%; height: 593px"><iframe class="iframe"
						name="left" id="left" src="welcome.jsp"
						style="width: 100%; height: 500px; border: 0; scrolling: no">
						<!-- left框架 -->
					</iframe></td>
				<td><iframe class="iframe" name="right" id="right"
						src="login_no.jsp"
						style="width: 100%; height: 563px; border: 0; scrolling: no">
						<!-- right框架 -->
					</iframe></td>
			</tr>
		</table>
	</div>
</body>
</html>