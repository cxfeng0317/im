<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'add.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<c:import url="common.jsp"></c:import>
</head>

<body>
	<c:import url="nav.jsp"></c:import>
	<center>
		<form action="addSave.action" method="post">
			<table class="form-group">
				<tr>
					<td>标题</td>
					<td>
						<input class="form-control" name="title" type="text" required="required" />
					</td>
				</tr>
				<tr>
					<td>概要</td>
					<td>
						<input class="form-control" name="summary" type="text" required="required" />
					</td>
				</tr>
				<tr>
					<td>作者</td>
					<td>
						<input class="form-control" name="author" type="text" required="required" />
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input class="btn" type="submit" value="提交">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
