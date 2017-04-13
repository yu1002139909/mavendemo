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
	<div id="contentWrap">
		<div class="pageTitle">学生管理系统>评分管理</div>
		<div class="pageColumn">
		<form action="${pageContext.request.contextPath }/courseservlet?method=marking" method="post">
			<table>
				<thead>
					<th>学生姓名</th>
					<th>所属学院</th>
					<th>评分</th>
					<th>操作</th>
				</thead>
				<thead>
				<%int courseid =(Integer)session.getAttribute("courseid");
    	%>
					<c:forEach var="stu" items="${requestScope.stulist}">
					<c:if test="${stu.couresId == courseid}">
					   <c:if test="${stu.score == 0 }">
						<tr>
							<th class="tdline"><a href="${pageContext.request.contextPath }/studentservlet?id=${stu.id}&method=stuview">${stu.name}</a></th>
							<th class="tdline">${stu.college}</th>
							<th class="tdline"><input name="score" id="score"
								value="" class="optional" /></th>
							 <th>
							    <input type="hidden"  name = "id" value="${stu.id}"/>
								<input type="submit" class="submit"   value="提     交" /> 
						    </th>
						</tr>
						  </c:if>
						</c:if>
					</c:forEach>
				</thead>
				<tbody>
				</tbody>
			</table>
			</form>
		</div>
	</div>
</body>
</html>
