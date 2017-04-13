<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生信息查询</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
	<link href="bootstrap/css/bootstrap-responsive.min.css"
		rel="stylesheet" media="screen">
		<link href="images/style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/style_button1.css" />
		<link href="images/jquery-webox.css" rel="stylesheet" type="text/css">
			<link rel="stylesheet" type="text/css" href="css/demo.css"
				media="all" />
			<script type="text/javascript" src="javascript/jquery-1.4.2.min.js"></script>
			<script src="javascript/jquery-webox.js"></script>
			<style type="text/css">
body {
	background: #FFF
}
</style>
</head>
<script type="text/javascript">
	function subForm() {
		if (document.getElementById("name").vaule == ""
				&& document.getElementById("username").value == "") {
			alert("请填写姓名或者账号！");
		} else {
			document.getElementById("form1").submit();
		}
	}

	function subFormPage(page) {
		document.getElementById("form1").action = "addstudent.jsp" + page;
		document.getElementById("form1").submit();
	}

	function openDetail(patientId, operator) {
		$.webox({
			height : 280,
			width : 600,
			bgvisibel : true,
			title : '患者详细信息',
			iframe : 'patient.do?method=patientDetailOrUpdate&operator='
					+ operator + '&patientId=' + patientId
		});
	}
	function ajaxDelete(url) {
		if (confirm("确定要删除该条数据吗？")) {
			$.ajax({
				type : "get",
				url : url,
				dataType : "json",
				success : function(result) {
					document.location.reload();
				}
			});
		}

	}
</script>
<body>
	<div id="contentWrap">
		<div class="pageTitle">学生管理系统>学生列表查询</div>
		<div class="pageColumn">

			<div class="pageButton" align="center">
				<form name="form1" id="form1" action="${pageContext.request.contextPath }/techaerservlet?method=findName" method="post"
					onsubmit="return validator(this)" al>
					姓名 <input type="text" name="name" id="name" value="" size="15"
						maxlength="15"
						style="border:#999999 1px solid; background-color:#FFFFEE">
							<button class="btn" onclick="javascript:subForm()">查&nbsp;&nbsp;询</button>
				</form>
							
			</div>
			<table>
				<thead>
					<th>姓名</th>
					<th>系统账号</th>
					<th>年龄</th>
					<th>性别</th>
					<th>学院</th>
					<th>地址</th>
					<th>操作</th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty requestScope.list}">
							<c:forEach var="tea" items="${requestScope.list}">
								<tr>
									<td class="tdline">${tea.name}</td>
									<td class="tdline">${tea.loginId}</td>
									<td class="tdline">${tea.age}</td>
									<td class="tdline">${tea.gender}</td>
									<td class="tdline">${tea.college}</td>
									<td class="tdline">${tea.homeaddress}</td>
									 <td class="tdline"><a href="${pageContext.request.contextPath}/techaerservlet?id=${tea.id}&method=deletetechaerview">详情</a><a
										href="${pageContext.request.contextPath }/techaerservlet?id=${tea.id}&method=updateview">修改</a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8">没有你要找找的数据，请先保存记录再查看！</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
