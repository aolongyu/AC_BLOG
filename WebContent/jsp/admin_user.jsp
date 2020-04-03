<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.dao.Dao" %>
 <%@ page import="com.bean.*" %>
  <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员界面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../bootstrap/css/bootstrap-4.2.1.css" rel="stylesheet">
<!-- <link href="../bootstrap/css/bootstrap.css" rel="stylesheet"> -->
<link href="../bootstrap/css/bootstrap-theme.css" rel="stylesheet">
<script src="../jquery/jquery.js"></script>
<script src="../bootstrap/js/bootstrap.js"></script>
<script>
	function ale(){
		alert("删除成功");
	}
</script>
</head>
<body>

 <%
  Dao Dao=new Dao();
  List<Users> list=Dao.findUsers();
  int i=1;
   %>


<h1 align= "center">管理用户</h1>
   <table align="center" class="table table-striped" style="width: 90%">
   <tr>
   <th text-align="center">序 号</th>
   <th align="center">昵称</th>
   <th align="center">密码</th>
   <th align="center">id</th>
   <th align="center">权限</th>
   <th align="center">性别</th>
   <th colspan="2" align="center">操 作</th>
   </tr>
   <%
   for(Users user:list){
    %>
    <tr align="center">
     <td align="center">
<%=i++ %>
    </td>
    <td align="center" nowrap="nowrap"><%=user.getName()%></td>
    <td align="center" nowrap="nowrap"><%=user.getPwd()%></td>
    <td align="center"><%=user.getId()%></td>
    <td align="center"><%=user.getAccess()%></td>
    <td align="center"><%=user.getSex()%></td>
    <td align="center" nowrap="nowrap">
    <a href="admin_user_pwd.jsp?id=<%=user.getId()%>">修改</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="../DeleteUser?id=<%=user.getId()%>"  onclick="ale()">删除</a>
    </td>
    </tr>    	 
    <%} %>
    

 	<table border="0" style = "position:relative;left:20%;top:100"><tr>
 <!-- <td><a href="addNews.jsp"><button>添加数据</NOtton></a></td> -->     
   <td> <form action="doFind.jsp" >	     
    	    <input type="text" name="id" class="search" placeholder="搜索">
    	    <input type="submit" value="查找" class="btn"></form></td> 
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
   </table>
 </div>

</body>
</html>