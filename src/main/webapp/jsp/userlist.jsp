<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户信息展示</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
	<link href="bootstrap/css/bootstrap-responsive.min.css"
		rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/images/style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style_button1.css" />
		<link href="${pageContext.request.contextPath}/images/jquery-webox.css" rel="stylesheet" type="text/css">
			<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css"
				media="all" />
			<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery-1.4.2.min.js"></script>
			<script src="${pageContext.request.contextPath}/javascript/jquery-webox.js"></script>
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
		<div class="pageTitle">员工信息>员工信息</div>
		<div class="pageColumn">

			<div class="pageButton" align="center">
				<form name="form1" id="form1" action="${pageContext.request.contextPath }/studentservlet?method=findName" method="post"
					onsubmit="return validator(this)" al>
					姓名 <input type="text" name="name" id="name" value="" size="15"
						maxlength="15"
						style="border:#999999 1px solid; background-color:#FFFFEE">
							<button class="btn" onclick="javascript:subForm()">查&nbsp;&nbsp;询</button>
				</form>
							
			</div>
			<table>
				<thead>
				    <th>编号</th>
					<th>姓名</th>
					<th>系统账号</th>
					<th>部门</th>
					<th>性别</th>
					<th>emali</th>
					<th>备注</th>
					<th>生日</th>
					<th>状态</th>
					<th>操作</th>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty requestScope.userlist}">
							<c:forEach var="user" items="${requestScope.userlist}" >
								<tr>
									<td class="tdline">${user.id}</td>
									<td class="tdline">${user.namne}</td>
									<td class="tdline">${user.account}</td>
									<td class="tdline">
											${user.dept}
									</td>
									<td class="tdline">
										<c:if test="${user.state == true}">女</c:if>
										<c:if test="${user.state == false}">男</c:if></td>
									<td class="tdline">${user.email}</td>
									<td class="tdline">${user.memo}</td>
									<td class="tdline">
										<fmt:formatDate value="${user.birthday}" pattern="yyyy年MM月dd日"
										 dateStyle="full"
										/>
									</td>
									<td class="tdline">
										<c:if test="${user.state == 1}">正常</c:if>
										<c:if test="${user.state == 0}">失效</c:if>
									</td>
									 <td class="tdline"><a href="${pageContext.request.contextPath }/studentservlet?id=${stu.id}&method=deleteview">详情</a><a
										href="${pageContext.request.contextPath }/studentservlet?id=${stu.id}&method=updateview">修改</a></td>
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
	<div class="msdn">
					<tr>
  			<td colspan="3" align="center">
                当前第<c:choose>

				<c:when test="${requestScope.start==0}">
					${requestScope.start+1}页   &nbsp;&nbsp;
				</c:when>

				<c:otherwise>
					${requestScope.start}页   &nbsp;&nbsp;
				</c:otherwise>
			</c:choose>

  				<a href="${pageContext.request.contextPath }/userlist.action?start=0">首页</a>
  				<a href="${pageContext.request.contextPath }/userlist.action?start=${requestScope.start-1}">上一页 </a>
  				<a href="${pageContext.request.contextPath }/userlist.action?start=${requestScope.start+1}">下一页 </a>
  			</td>
  			   <td>  共有${requestScope.allcount}条数据</td>
  		</tr>
	</div>
	        <form action="${pageContext.request.contextPath}/studentservlet?method=addstuview" method="post"">
				<div class="pageButton" align="center">
               				<button class="btn" onclick="javascript:subForm()">增加学生</button>			
			   </div>
            </form>
</body>
</html>
