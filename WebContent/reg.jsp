<!-- 注册页面 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>用户注册</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet">
<script src="jquery/jquery.js" rel="stylesheet"></script>
<script src="bootstrap/js/bootstrap.js" rel="stylesheet"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
$(document).ready(function() {
 	$("#PK_ID").blur(function() {
		var name = this.value;
		if (name == null || name == "") {
			
		} else {
			$.ajax({
                "url"       : "RegFormServlet",   //要提交的URL路径
                "type"      : "POST",           //发送请求的方式
                "data"      : "name="+name,    //要发送到服务器的数据
                "dataType"  : "text",          //指定返回的数据格式
                "success"   : callBack,        //响应成功后要执行的代码
                "error"     : function() {     //请求失败后要执行的代码
                    alert("id验证时出现错误，请稍后再试或与管理员联系！");
                }
            });

			//响应成功时的回调函数
			function callBack(data) {
				if (data == "true") {
					$("#result").html("可用");
				} else {
					$("#result").html("请输入十一位手机号");
				}
			}//end of callBack()
		}
	}); 
	$("#pwd1").blur(function() {
		var pwd1 = this.value;
		if (pwd1 == null || pwd1 == "") {
		
		} else {
			$.ajax({
                "url"       : "RegPwdServlet",   //要提交的URL路径
                "type"      : "POST",           //发送请求的方式
                "data"      : "pwd1="+pwd1,    //要发送到服务器的数据
                "dataType"  : "text",          //指定返回的数据格式
                "success"   : callBack1,        //响应成功后要执行的代码
                "error"     : function() {     //请求失败后要执行的代码
                    alert("id验证时出现错误，请稍后再试或与管理员联系！");
                }
            });

			//响应成功时的回调函数
			function callBack1(data) {
				if (data == "true") {
					$("#result1").html("正确");
				} else {
					$("#result1").html("请输入六位以上密码");
				}
			}//end of callBack()
		}
	});//end of blur()

});
function pass2Blur(){
;
    var pass1 = document.getElementById("pwd1").value;
    var pass2 = document.getElementById("pwd2").value;
    if(pass1 == null || pass1 == ""){

    }
    else{
	    if (pass1 == pass2) {
	        $("#result2").html("正确");
	        return true;
	    } else {
	        $("#result2").html("第二次输入错误");
	        return false;
	    }
    }
}
</script>
<script type="text/javascript">
	function reg_check() {
		alert("注册成功");
	}
</script>
</head>
<body>
	<h2>注册属于自己的AC-BLOG</h2>
	<div id="result" ></div>
	<form action="RegAC_Servlet">
		<div style="width: 30%">

			<!-- tel:id=PK_ID -->
			<div>
				<label for="name"><span style="text-align: center">用户ID</span></label>
				<span style="text-align: center"> <input type="number"
					class="form-control" id="PK_ID" name="PK_ID" placeholder="ID (Tel)"
					required>
				</span>
				
			</div>

			<span style="text-align: center"> <!-- UserName:id=name -->
			</span>
			<div>
				<span style="text-align: center"> <label for="name">用户名</label>
					<input type="text" class="form-control" id="name" name="name"
					placeholder="UserName" required>
				</span>
			</div>
			
			<span style="text-align: center"> <!-- 密码1:id=pwd1 -->
			</span>
			<div id="result1" style="font-color:red"></div>
			<div>
				<span style="text-align: center"> <label for="pwd_one">密码</label>
					<input type="password" class="form-control" id="pwd1" name="pwd1"
					placeholder="Password_one" required>
				</span>
			</div>
			<div id="result2" style="font-color:red"></div>
			<span style="text-align: center"> <!-- 密码2:id=pwd2 -->
			</span>
			<div>
				<span style="text-align: center"> <label for="pwd_two">重复密码</label>
					<input type="password" class="form-control" id="pwd2" name="pwd2"
					onblur="pass2Blur()" placeholder="Password_two" required>
				</span>
			</div>

			<span style="text-align: center"> <!-- 性别 -->
			</span>
			<div>
				<span style="text-align: center"> <label class="radio-inline">
						<input type="radio" name="sex" id="sex" value="男" checked>男
				</label> <label class="radio-inline"> <input type="radio" name="sex"
						id="sex" value="女">女
				</label>
				</span>
			</div>

			<span style="text-align: center">
				<button type="submit" class="btn btn-default">注册</button>
			</span>
		</div>
	</form>
</body>
</html>