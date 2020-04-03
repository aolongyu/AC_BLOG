<%@page import="com.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bean.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome AC-BLOG</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../bootstrap/css/bootstrap-4.2.1.css" rel="stylesheet">
<!-- <link href="../bootstrap/css/bootstrap.css" rel="stylesheet"> -->
<link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet">
<script src="../jquery/jquery.js"></script>
<script src="../bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<center>
		<div style="width: 100%">
			<hr />
			<h4>个人信息</h4>
			<hr />
			<form>
				<div class="form-group">
					<label>用户ID：</label> <label><%=session.getAttribute("id").toString()%></label>
				</div>
				<div class="form-group">
					<%
						Dao dao = new Dao();
						Users user = dao.queryUserById(session.getAttribute("id").toString());
					%>
					<%
						session.setAttribute("user_name", user.getName());
					%>
					<label>用户名：</label> <label><%=user.getName()%></label>
				</div>

				<div class="form-group">
					<a href="user_pwd.jsp" target="right">修改密码</a>
				</div>
				<div class="form-group">
					<a href="../waiting_quit.jsp">退出登陆</a>
				</div>

			</form>
		</div>
	</center>

</body>
</html>