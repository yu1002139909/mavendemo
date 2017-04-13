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
<form action="${pageContext.request.contextPath}/courseservlet?method=update" method="post">
	<div id="contentWrap">
		<div class="pageTitle">学生管理系统>安排课程</div>
		<div class="pageColumn">
			<table>
				<thead>
					<th>教师姓名</th>
					<th>所属学院</th>
					<th>课程安排</th>
					<th>教室</th>
					<th>人数</th>
					<th>操作</th>
				</thead>
				<thead>
					<c:forEach var="techaer" items="${requestScope.teclist}">
					<c:if test="${techaer.course == 0 }">
						<tr>
							<th class="tdline">${techaer.name}</th>
							<th class="tdline">${techaer.college}</th>
							<th class="tdline">
							<select name="cou" style="width:80px">
							     <option value="">请选择</option>
									<c:forEach var="cou" items="${requestScope.coulist}">
									<c:if test="${cou.techaer == null}">
									   	<option value="${cou.id}">
										        ${cou.name}
										</option>
										</c:if>
									  </c:forEach>
							</select>
							</th>
							<th class="tdline"><input name="classroom" id="classroom"
								value="" class="optional" /></th>
							<th class="tdline"><input name="people" id="people" value=""
								class="optional" /></th>
							<th>
							   <input type="hidden"  name = "id" value="${techaer.id}"/>
								<input type="submit" class="submit"   value="提     交" /> 
						    </th>
						</tr>
						</c:if>
					</c:forEach>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
		</form>
</body>
</html>
