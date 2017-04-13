<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>员工注册</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/regest.action" method="POST"  enctype="multipart/form-data">
    <table border="2" align="center">
        <tr>
            <th>登录名</th>
            <td><input type="text" name="eid"></td>
        </tr>

        <tr>
            <th>密码</th>
            <td><input type="password" name="eid"></td>
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