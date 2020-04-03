<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script type="text/javascript">
    	function up()
    	{
    		alert("上传成功");
    	}
    </script>
</head>
<body>
<label>博客信息：</label>
<label>id <%=session.getAttribute("id").toString() %></label><!-- 用户id -->
<label>作者 <%=session.getAttribute("user_name").toString()  %></label><!-- 博客作者 -->
	<form action="../WriteBlog">
		<h3>标题</h3>
		<textarea class="form-control" rows="1" name="title" id="title" required></textarea>
		<h3>内容</h3>
		<textarea class="form-control" rows="16" name="content" id="content" required></textarea>
		<input type="submit" value="上传博客" onclick="up()"/>
	</form>
</body>
</html>