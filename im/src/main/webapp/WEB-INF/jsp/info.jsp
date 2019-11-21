<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="common.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<c:import url="nav.jsp"></c:import>
	<div style="margin: 0 5%">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">${invitation.title }</h3>
			</div>
			<div class="panel-body">${invitation.summary }</div>
		</div>
	</div>
</body>
</html>