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
<script>

	function ale(){
		alert("修改成功");
	}

</script>
</head>
<body>
	<center>
		<div style="width:30%">
		<hr/>
			<h2>用户密码修改</h2>
			<hr/>
			<form action="../UpdateUserPwd">
				<div class="form-group">
					<label for="pwd1">旧密码</label> <input type="password"
						class="form-control" id="pwd1" name = "pwd1">
				</div>
				
				<div class="form-group">
					<label for="pwd2">新密码</label> <input type="password" name="pwd2"
						class="form-control" id="pwd2">
				</div>
				<div class="form-group">
					<label for="pwd3">重复新密码</label> <input type="password"
					name="pwd3"	class="form-control" id="pwd3">
				</div>
				<button type="submit" class="btn btn-default" onclick="ale()">确认修改</button>
			</form>
		</div>
	</center>
</body>
</html>