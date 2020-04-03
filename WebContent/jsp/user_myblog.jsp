<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.Dao"%>
<%@ page import="com.bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../bootstrap/css/bootstrap-4.2.1.css" rel="stylesheet">
<!-- <link href="../bootstrap/css/bootstrap.css" rel="stylesheet"> -->
<link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet">
<script src="../jquery/jquery.js"></script>
<script src="../bootstrap/js/bootstrap.js"></script>

<style type="text/css">
.hidden {
	width: 100px;
}
</style>

<script>
	function del() {
		alert("删除成功");
	}
</script>

</head>
<body>
	<%
		Dao Dao = new Dao();
		String user_id = session.getAttribute("id").toString();
		System.out.println(user_id);
		List<Message> list = Dao.findMessages(user_id);
		int i = 1;
	%>


	<h1 align="center">
		我的博客<small><a href="user_write.jsp">写博客</a></small>
	</h1>
	<table align="center" class="table table-striped" style="width: 100%">
		<tr>
			<th text-align="center">序 号</th>
			<th align="center">标题</th>
			<th align="center">内容</th>
			<th align="center">日期</th>
			<th colspan="2" align="center">操 作</th>
		</tr>
		<%
			for (Message message : list) {
		%>
		<tr align="center">
			<td align="center"><%=i++%></td>
			<td align="center" nowrap="nowrap" style="width:100px"><%=message.getTitle()%></td>
			<td align="center" nowrap="nowrap">
				<div class="hidden" id="<%=i%>"  style="width:300px"><%=message.getContent()%></div>
				<script>
					var oBox = document.getElementById('<%=i%>');
					var demoHtml = oBox.innerHTML.slice(0, 20) + '  ...';
					oBox.innerHTML = demoHtml;
				</script></td>
			<td align="center"><%=message.getDate()%></td>
			<td align="center" nowrap="nowrap"><a
				href="user_update.jsp?blog_id=<%=message.getBlog_id()%>">修改</a>
				&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="../DeleteUserBlog?blog_id=<%=message.getBlog_id()%>"
				onclick="del()">删除</a></td>
		</tr>
		<%
			}
		%>

</body>
</html>