<%--
  Created by IntelliJ IDEA.
  User: yuyu
  Date: 2017/4/11
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑员工信息</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/regest.action" method="POST">
    <table border="2" align="center">
        <tr>
            <th>编号</th>
            <td><input type="text" name="eid" value="${emp.eid}"></td>
        </tr>
        <tr>
            <th>姓名</th>
            <td><input type="text" name="ename" value="${emp.ename}"></td>
        </tr>
        <tr>
            <th>薪水</th>
            <td><input type="text" name="esal" value="${emp.esal}"></td>
        </tr>
        <tr>
            <th>性别</th>
            <td>
                <input type="radio" name="esex" value="男" />男
                <input type="radio" name="esex" value="女" checked/>女
            </td>
        </tr>
        <tr>
            <th>头像</th>
            <td>
                <img src="${pageContext.request.contextPath}/${emp.img}"><br/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="注册"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
