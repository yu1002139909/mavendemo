<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程安排</title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/style_button1.css" />
<link href="images/jquery-webox.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" media="all" />
<script type="text/javascript" src="javascript/jquery-1.4.2.min.js"></script>
<script src="javascript/jquery-webox.js"></script>
<style type="text/css">
body {
	background: #FFF
}
</style>
</head>


<body>
<form action="${pageContext.request.contextPath}/courseservlet?method=takecoures&name=${name}" method="post">
	<div id="contentWrap">
		<div class="pageTitle">学生管理系统>选择课程</div>
		<div class="pageColumn">
			<table>
				<thead>
					<th>教师姓名</th>
					<th>所属学院</th>
					<th>课程名字</th>
					<th>教室</th>
					<th>剩余人数</th>
					<th>操作</th>
				</thead>
				<thead>
					<c:forEach var="cou" items="${requestScope.coulist}">
						<tr>
							<th class="tdline">${cou.techaer}</th>
							<th class="tdline">${cou.college}</th>
							<th class="tdline">${cou.name}</th>
							<th class="tdline">${cou.classroom}</th>
							<th class="tdline">${cou.people}</th>
							<th>
							        <input type="hidden"  name = "id" value="${cou.id}"/>
							         <input type="hidden"  name = "techaer" value="${cou.techaer}"/>
							        <input type="hidden"  name = "people" value="${cou.people}"/>
							        <a href="${pageContext.request.contextPath}/courseservlet?method=takecoures&name=${name}&id=${cou.id}&techaer=${cou.techaer}&people=${cou.people}">选择</a>
						    </th>
						</tr>
					</c:forEach>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
		<div class="msdn">
		<%String name = (String)request.getAttribute("course");%>
		<%String classname = (String)request.getAttribute("classroom");%>
	</div>
		</form>
</body>
</html>
