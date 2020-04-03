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
</head>
<script>
	function ale(){
		alert("修改成功");
	}
</script>
<body>
<%session.setAttribute("upId", request.getParameter("id")); %>
	<form class="form-horizontal" action="../Admin_User_Password">
		<div class="form-group">
			<label for="newpwd" class="col-sm-2 control-label">新密码</label>
			<div class="col-sm-10" style="width:20%">
				<input type="text" class="form-control" id="newpwd" name="newpwd"
					placeholder="new password">
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<button type="submit" class="btn btn-default" onclick="ale()">修改</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>