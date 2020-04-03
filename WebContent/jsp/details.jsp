<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.Dao"%>
<%@ page import="com.bean.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AC-BLOG</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../bootstrap/css/bootstrap-4.2.1.css" rel="stylesheet">
<link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet">
<script src="../jquery/jquery.js"></script>
<script src="../bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<%
	Dao Dao = new Dao();
	String blog_id=null;
	List<Comment> list;
	if(request.getParameter("blog_id")!=null){

		blog_id = request.getParameter("blog_id");
		list = Dao.findComment(blog_id);
		session.setAttribute("blog_id", blog_id);
	}else{
		blog_id =session.getAttribute("blog_id").toString();
		list = Dao.findComment(blog_id);
	}
	Message message = Dao.queryMessageById(blog_id);
	if(Dao.updateBrowse(message)){
		System.out.println("成功");
	}else{
		System.out.println("失败");
	}
	%>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="jumbotron">
					<!-- 文章标题 -->
					<h1 class="text-center"><%=message.getTitle()%></h1>

					<!-- 文章内容 -->
					<p class="text-center"><%=message.getContent()%>
					</p>


					<!-- 评论展示-->
						<%
							for (Comment comment : list) {
						%>
					<div style="backgroud-color: blue; height: 100px; width: 200px">
					
						<%
							System.out.println("2");
						%>
						<h4>
							<a href="#"><%=comment.getUser_name()%></a>
						</h4>
						<p><%=comment.getText()%></p>
						
					</div>
					<%
							}
						%>
					<!-- 评论书写框 -->
					<div>
						<h3>评论</h3>
						<form action="../CommentAC_Servlet" method="post">
							<fieldset>
								<br style="clear: both" />
								<textarea cols="50" rows="10" name="text">Write hear</textarea>
								<br style="clear: both" /> <input type="submit" name="submit"
									class="button" value="Submit" />
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>