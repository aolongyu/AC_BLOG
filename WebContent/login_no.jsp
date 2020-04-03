<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bean.*"%>
<%@ page import="com.dao.Dao"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="bootstrap/css/bootstrap-4.2.1.css" rel="stylesheet">
<!-- <link href="../bootstrap/css/bootstrap.css" rel="stylesheet"> -->
<link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.hidden {
	width: 900px;
}
</style>

</head>
<body>
	<%
		Dao Dao = new Dao();
		List<Message> list = Dao.findMessages();
		int i = 1;
	%>
	<%
		for (Message message : list) {
	%>
	<table class="table table-striped" style="width: 100%; height: auto;">
		<tr>
			<td style="text-align: left;"><%=message.getTitle()%></td>
			<td style="text-align: right;"><%=message.getDate()%></td>
		</tr>
		<tr>
		<td nowrap="nowrap" colspan="2">
				<div class="hidden" id="<%=i%>" style="width:100%"><%=message.getContent()%></div>
				<script>
					var oBox = document.getElementById('<%=i++%>');
					var demoHtml = oBox.innerHTML.slice(0, 56) + '...';
					oBox.innerHTML = demoHtml;
				</script>
				
			</td>
		</tr>

		<hr>

		<%
			}
		%>

	</table>


</body>
</html>