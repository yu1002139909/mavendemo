<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="scriptaculous/lib/prototype.js" type="text/javascript"></script>
<script src="scriptaculous/src/effects.js" type="text/javascript"></script>
<script type="text/javascript" src="javascript/validation.js"></script>
<script type="text/javascript" src="javascript/jquery-1.4.2.min.js"></script>
<script src="javascript/jquery-webox.js"></script>
<style type="text/css">
body {
	background:#E6F4FA;
}
</style>
<script type="text/javascript">
//<![CDATA[
<!--
// Alternative Style: Working With Alternate Style Sheets
// http://www.alistapart.com/articles/alternate/
function setActiveStyleSheet(title) {
var i, a, main;
for(i=0; (a = document.getElementsByTagName("link")[i]); i++) {
if(a.getAttribute("rel").indexOf("style") != -1 && a.getAttribute("title")) {
a.disabled = true;
if(a.getAttribute("title") == title) a.disabled = false;
}
}
}
//-->
//]]>
</script>

<link title="style1" rel="stylesheet" href="css/style1.css" type="text/css" />
<link title="style2" rel="alternate stylesheet" href="css/style2.css" type="text/css" />
<link title="style3" rel="alternate stylesheet" href="css/style3.css" type="text/css" />
</head>
<body>
   
	<div class="form_content" align="center">
    <form id="form1" action="${pageContext.request.contextPath}/studentservlet?method=delete" method="post">
     <input  type="hidden"  id="userid" name="userid" value="${student.id }" />
    <fieldset>
        <legend>系统账号注册</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">帐  号:</label></div>
            <div class="field-widget"><p>${student.loginId }</p></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field7">密  码 :</label></div>
            <div class="field-widget"><p>${student.pwd}</p></div>
        </div>
        
        
    </fieldset>
    <fieldset>
        <legend>学生信息</legend>
        
        <div class="form-row">
            <div class="field-label"><label for="field4">姓   名:</label></div>
            <div class="field-widget"><p>${student.name}</p></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field5">年  龄 :</label></div>
            <div class="field-widget"><p>${student.age}</p></div>
        </div> 
        
      <div class="form-row">
            <div class="field-label"><label for="field5">性 别 :</label></div>
            <div class="field-widget"><p>${student.gender}</p></div>
        </div> 
        <div class="form-row">
            <div class="field-label"><label for="field5">籍  贯 :</label></div>
            <div class="field-widget"><p>${student.address}</p></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">学院 :</label></div>
            <div class="field-widget"><p>${student.college}</p></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">家庭住址</label></div>
            <div class="field-widget"><p>${student.homeadderss}</p></div>
        </div> 
      
    </fieldset>  
    <fieldset>
        <legend class="optional">所选课程</legend>
        <div class="form-row">
            <div class="field-label"><label for="field5">课程信息</label></div>
            <div class="field-widget"><p>${coures.name}</p></div>
        </div> 
       <div class="form-row">
            <div class="field-label"><label for="field5">分数</label></div>
            <div class="field-widget"><p>${student.score}</p></div>
        </div> 
      
   </fieldset> 
    <fieldset>
        <legend class="optional">学生情况</legend>
      
        <div class="form-row">
            <div class="field-label"><label for="field12">获奖史</label></div>
            <div class="field-widget"><p>${student.award}</p></div>
        </div>

		<div class="form-row">
            <div class="field-label"><label for="field12">是否处分</label></div>
            <div class="field-widget"><p>${student.punishment}</p></div>
        </div>
        
    </fieldset>
				<input type="submit" class="submit"   value="删除" /> 
    </form>
    </div>
    <script type="text/javascript">
        function formCallback(result, form) {
            window.status = "valiation callback for form '" + form.id + "': result = " + result;
        }
        
        var valid = new Validation('test', {immediate : true, onFormValidate : formCallback});
        Validation.addAllThese([
            ['validate-password', '> 6 characters', {
                minLength : 7,
                notOneOf : ['password','PASSWORD','1234567','0123456'],
                notEqualToField : 'field1'
            }],
            ['validate-password-confirm', 'please try again.', {
                equalToField : 'field8'
            }]
        ]);
    </script>

</body>
</html>