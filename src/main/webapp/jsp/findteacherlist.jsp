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
<title>教师信息查询</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen"/>
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen"/>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/style_button1.css" />
<link href="images/jquery-webox.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="css/demo.css" media="all" />
<script type="text/javascript" src="javascript/jquery-1.4.2.min.js"></script>
<script src="javascript/jquery-webox.js"></script>
<style type="text/css">
body {
	background: #FFF
}
</style>

</head>
<script type="text/javascript">
     function subForm(){
         if(document.getElementById("sysname").vaule=="" && document.getElementById("username").value==""){
                alert("请填写姓名或者账号！");
           }else{
        	   document.getElementById("form1").submit();
           }
     }

     function subFormPage(page){
        document.getElementById("form1").action="doctor.do?method=doctorListView&pageInt="+page;
        document.getElementById("form1").submit();
     }

     function openDetail(doctorId,operator){
    	 $.webox({
 			height:280,
 			width:600,
 			bgvisibel:true,
 			title:'医生详细信息',
 			iframe:'doctor.do?method=doctorDetailOrUpdate&operator='+operator+'&doctorId='+doctorId
 		});
     }
</script>

<body>
	<div id="contentWrap">
		<div class="pageTitle">学生管理系统>教师列表查询</div>
		<div class="pageColumn">
            <form action="">
			<div class="pageButton" align="center">
					姓名： <input type="text" name="username" id="username"
						value="" size="15" maxlength="15"
						style="border:#999999 1px solid; background-color:#FFFFEE"/>
					账号： <input type="text" name="sysname" id="sysname"
						value="" size="15" maxlength="15"
						style="border:#999999 1px solid; background-color:#FFFFEE"/>
					学院：<select id="subjectId" name="subjectId">
						<option value="">请选择...</option>
					</select>
					<button class="btn" onclick="javascript:subForm()">查&nbsp;&nbsp;询</button>
				</form>
			</div>
			<table>
				<thead>
					<th>姓名</th>
					<th>系统账号</th>
					<th>性别</th>
					<th>年龄</th>
					<th>婚姻状况</th>
					<th>民族</th>
					<th>联系电话</th>
					<th>联系邮箱</th>
					<th>所属学院</th>
					<th>工作年份</th>
					<th>家庭地址</th>
					<th>操作</th>
				</thead>
				<tbody>
								<c:choose>
						<c:when test="${not empty requestScope.findStu}">
							<c:forEach var="techaer" items="${requestScope.findStu}">
								<tr>
									<td class="tdline">${techaer.name}</td>
									<td class="tdline">${techaer.loginId}</td>
									<td class="tdline">${techaer.gender}</td>
									<td class="tdline">${techaer.age}</td>
									<td class="tdline">${techaer.marriage}</td>
									<td class="tdline">${techaer.family}</td>
									<td class="tdline">${techaer.tel}</td>
									<td class="tdline">${techaer.eml}</td>
									<td class="tdline">${techaer.college}</td>
									<td class="tdline">${techaer.workdate}</td>
									<td class="tdline">${techaer.homeaddress}</td>
									 <td class="tdline"><a href="${pageContext.request.contextPath}/techaerservlet?id=${techaer.id}&method=deletetechaerview">详情</a><a
										href="${pageContext.request.contextPath }/techaerservlet?id=${techaer.id}&method=updateview">修改</a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="12">没有你要找找的数据，请先保存记录再查看！</td>
							</tr>
						</c:otherwise>
					</c:choose>
			</table>
		</div>
	</div>

	<div class="msdn">
			<tr>
  			<td colspan="3" align="center">
  				当前${requestScope.pageBean.currentPage }/${requestScope.pageBean.totalPage }页     &nbsp;&nbsp;
  				
  				<a href="${pageContext.request.contextPath }/techaerservlet?method=pagelist&currentPage=1">首页</a>
  				<a href="${pageContext.request.contextPath }/techaerservlet?method=pagelist&currentPage=${requestScope.pageBean.currentPage-1}">上一页 </a>
  				<a href="${pageContext.request.contextPath }/techaerservlet?method=pagelist&currentPage=${requestScope.pageBean.currentPage+1}">下一页 </a>
  			</td>
  		<td>  共有${requestScope.pageBean.totalCount}条数据</td>
  		</tr>
	</div>
	    <form action="${pageContext.request.contextPath}/techaerservlet?method=addtecharview" method="post"">
				<div class="pageButton" align="center">
               				<button class="btn" onclick="javascript:subForm()">增加教师</button>			
			   </div>
            </form>
</body>
</html>
