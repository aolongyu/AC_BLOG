<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bean.*" %>
<%@ page import=" java.text.DateFormat "%>
<%@ page import=" java.util.Date" %>
<%@ page import=" java.sql.*" %>
<%@ page import=" java.util.List" %>
<%@ page import=" com.dao.Dao" %>
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
</head>
<body>
 <%
  Dao dao=new Dao();
  String content = request.getParameter("content");
  List<Message> list= dao.findMessage(content);
  int i=1;
  if(list.isEmpty()){
	  response.sendRedirect("fail.jsp");
  }else{
   %>
	<p align="center">为您找到如下信息</p>
	<hr width="100% size="1" color="#00ffee"/>
   <table align="center" class="table table-striped" style="width: 90%">
   
   <tr>
   <th >序 号</th>
   <th >内 容</th>
   <th >标 题</th>
   <th >日 期</th>
   <th >报 道</th>
   <th >图 片</th>
   <th >i d</th>
   <th >点 赞</th>
   <th colspan="2">操 作</th>
   </tr>
   <%
   for(Message message:list){
    %>
    <tr align="center">
     <td align="center">
<%=i++ %>
    </td>
    <td align="center" nowrap="nowrap"><%=message.getTitle()%></td>
    <td align="center" nowrap="nowrap"><%=message.getContent()%></td>
    <td align="center"><%=message.getDate()%></td>
    <td align="center"><%=message.getUser_id()%></td>
    <td align="center"><%=message.getBlog_id()%></td>
    <td align="center" nowrap="nowrap">
	<td align="center" nowrap="nowrap">
				&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="../DeleteAUserBlog?blog_id=<%=message.getBlog_id()%>">删除</a></td>
    </td>
    </tr>   
    <%}}%>
</body>
</html>