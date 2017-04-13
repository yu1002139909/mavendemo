<%--
  Created by IntelliJ IDEA.
  User: yuyu
  Date: 2017/4/11
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<html>
<head>
</head>
<body>
    <h1>用户列表</h1>
     <table border="1px">
         <tr>
             <td>账户</td>
             <td>姓名</td>
             <td>年薪</td>
             <td>性别</td>
             <td>操作</td>
         </tr>
         <c:forEach var="emp" items="${requestScope.list}" >
         <tr>
         <td>${emp.eid}</td>
             <td>${emp.ename}</td>
             <td>${emp.esal}</td>
             <td>${emp.esex}</td>
             <td><a href="#">删除</a></td>
             <td><a href="${pageContext.request.contextPath}/eidemp.action?eid=${emp.eid}">修改</a></td>
         </tr>
         </c:forEach>
     </table>
</body>
</html>
