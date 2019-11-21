<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="common.jsp"></c:import>
<script type="text/javascript">
	function check() {
		var flas = false;
		var checkval = [];
		var checkbox = $("input[name=ids]");
		for (var i = 0; i < checkbox.length; i++) {
			console.log(checkbox[i].checked)
			if (checkbox[i].checked) {
				flas = true;
				checkval.push(checkbox[i].value);
			}
		}
		if (flas) {
			if (confirm("确定删除么" + checkval + "？")) {
				$("form").submit();
			}
		} else {
			alert("请选择删除的帖子");
		}
	}
	$(function() {
		$("#all").change(
				function() {
					if ($(this).is(":checked")) {
						var box = $("input[name=ids]");
						if (box.length == box.not(":checked").length) {
							$("input[name=ids]").prop('checked', true);
						} else {
							$("input[name=ids]").each(
									function() {
										$(this).prop(
												"checked",
												$(this).is(":checked") ? false
														: true);
									});
						}
					} else {
						$("input[name=ids]").prop("checked", false);
					}
				});
	});

	$(function() {
		//页面初始化 （显示第一页）
		selectPage(1);
		home();
		prev();
		next();
		goPage();
	});
	function selectPage(pageCode) {
		//分页查询 pageCode：页数
		$
				.ajax({
					type : "get",
					url : "getlist.action",
					data : {
						"currenPage" : pageCode
					},
					success : function(data) {
						var html = "<tr><th><input id='all' type='checkbox' /></th><th>id</th><th>title</th><th>summary</th><th>author</th><th>createdate</th><th>option</th></tr>";
						console.log(data)
						$("#tbody").html("");
						//总页数
						$("#countPage").text(data.totalPage);
						$
								.each(
										data.pageData,
										function(index, obj) {
											html += "<tr><td><input name='ids' type='checkbox' value="+obj.id+" /></td><td>"
													+ obj.id
													+ "</td><td>"
													+ obj.title
													+ "</td><td>"
													+ obj.summary
													+ "</td><td>"
													+ obj.author
													+ "</td><td>"
													+ obj.createdate
													+ "</td><td><input class='btn' onclick="
													+ "javascript:location.href='update.action?id="
													+ obj.id
													+ "' value='修改' type='button' /></td></tr>";
										})
						html += "<tr align='center'><td colspan='7'><input class='btn' onclick="+"javascript:location.href='add.action'"+" value='添加' type='button' /><input class='btn' value='删除' type='button' onclick='check()' /></td></tr> ";
						$("#table").html(html);
					}
				});
	}
	//第一页
	function home() {
		$("#homePage").on("click", function() {
			$("#paging").text(1);
			selectPage(1);
		})
	}

	//上一页
	function prev() {
		$("#prevPage").on("click", function() {
			var prevText = $("#paging").text();
			var prevNum = parseInt(prevText);
			prevNum = prevNum - 1;
			if (prevNum <= 1) {
				selectPage(1);
				$("#paging").text(1);
				$("#prevPage").css("color", "gainsboro");
				return;
			}
			$("#nextPage").css("color", "#337ab7");
			$("#paging").text(prevNum);
			selectPage(prevNum);
		})
	}
	//下一页
	function next() {
		$("#nextPage").on("click", function() {
			//获取文本的值 页数
			var prevText = $("#paging").text();
			//类型转换
			var prevNum = parseInt(prevText);
			//总页数
			var countText = $("#countPage").text();
			//类型转换
			var countNum = parseInt(countText);
			//页数加1
			prevNum = prevNum + 1;
			//判断超出了总页码
			if (prevNum >= countNum) {
				selectPage(countNum);
				$("#paging").text(countNum);
				$("#nextPage").css("color", "gainsboro");
				return;
			}
			$("#prevPage").css("color", "#337ab7");
			//设置网页增加的值
			$("#paging").text(prevNum);
			//调用分页查询
			selectPage(prevNum);
		})
	}
	//去到几页
	function goPage() {
		$("#goPage").on("click", function() {
			var pageNum = parseInt($("#pageNum").val());
			var countPage = parseInt($("#countPage").text())
			//判断超出了总页码
			if (pageNum >= countPage) {
				selectPage(countPage);
				$("#paging").text(countPage);
				$("#pageNum").val(countPage);
				return;
			}
			//判断低于了总页码
			if (pageNum <= 1) {
				selectPage(1);
				$("#paging").text(1);
				$("#pageNum").val(1);
				return;
			}
			selectPage(pageNum);
			$("#paging").text(pageNum);
		})
	}
</script>
</head>

<body>
	<c:import url="nav.jsp"></c:import>
	<form action="delete.action" method="post">
		<table id="table" class="table table-hover" style="width: 95%; margin: 0px auto;">
			<%-- 	<tr>
				<th>
					<input id="all" type="checkbox" />
				</th>
				<th>id</th>
				<th>title</th>
				<th>summary</th>
				<th>author</th>
				<th>createdate</th>
				<th>option</th>
			</tr>
			<c:forEach var="inv" items="${list }">
				<tr>
					<td>
						<input name="ids" type="checkbox" value="${inv.id }" />
					</td>
					<td>${inv.id }</td>
					<td>${inv.title }</td>
					<td>${inv.summary }</td>
					<td>${inv.author }</td>
					<td>${inv.createdate }</td>
					<td>
						<input class="btn" onclick="javascript:location.href='update.action?id=${inv.id }'" value="修改" type="button" />
					</td>
				</tr>
			</c:forEach>
			<tr align="center">
				<td colspan="7">
					<input class="btn" onclick="javascript:location.href='add.action'" value="添加" type="button" />
					<input class="btn" value="删除" type="button" onclick="check()" />
				</td>
			</tr> --%>
		</table>
		<center>
			第
			<span id="paging">1</span>
			页/ 共
			<span id="countPage">1</span>
			页/
			<a id="homePage" style="cursor: pointer;">首页</a>
			/
			<a id="prevPage" style="cursor: pointer;">上一页</a>
			/
			<a id="nextPage" style="cursor: pointer;">下一页</a>
			/ 转到第：
			<input type="text" style="width: 3em" id="pageNum">
			页
			<a id="goPage" style="cursor: pointer;">Go</a>
		</center>
	</form>
</body>
</html>