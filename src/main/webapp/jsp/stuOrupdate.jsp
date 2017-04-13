<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


   function ajaxUpdate(){
	   $.ajax({
           //提交数据的类型 POST GET
           type:"POST",
           //提交的网址
           url:"patient.do?method=updatePatient",
           //提交的数据
           data:$('#form1').serialize(),
           //返回数据的格式
           datatype: "html",//"xml", "html", "script", "json", "jsonp", "text".
           //成功返回之后调用的函数             
           success:function(data){
    
          	parent.document.getElementById('webox').style.display='none'; 
          	parent.document.getElementById('background').style.display='none'; 
        	   //$('.webox').css({display:'none'});
			   //$('.background').css({display:'none'});   
			   parent.document.location.reload();   
           } ,
           //调用出错执行的函数
           error: function(){
               //请求出错处理
           }         
        });
	}

</script>

<link title="style1" rel="stylesheet" href="css/style1.css" type="text/css" />
<link title="style2" rel="alternate stylesheet" href="css/style2.css" type="text/css" />
<link title="style3" rel="alternate stylesheet" href="css/style3.css" type="text/css" />
</head>
<body>
   
	<div class="form_content" align="center">
    <form id="form1" action="${pageContext.request.contextPath}/studentservlet?method=update" method="post">
     <input  type="hidden"  id="userid" name="userid" value="${student.id}" />
    <fieldset>
        <legend>系统账号注册</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">帐  号:</label></div>
            <div class="field-widget">
            <p>${student.loginId}</p>
            <input type="hidden" name ="loginId" value="${student.loginId}"/>
            </div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field7">密  码 :</label></div>
            <div class="field-widget"><input type="password" name="password" value="${student.pwd}" id="password" class="optional"/></div>
        </div>
        
        
    </fieldset>
    <fieldset>
        <legend>学生信息</legend>
        
        <div class="form-row">
            <div class="field-label"><label for="field4">姓   名:</label></div>
            <div class="field-widget"><input name="name" id="name" value="${student.name}" class="optional"  /></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field5">年  龄 :</label></div>
            <div class="field-widget"><input name="age" id="age" value="${student.age}" class="optional" /></div>
        </div> 
        
        <div class="form-row">
            <div class="field-label"><label for="field6">性  别 :</label></div>
            <div class="field-widget">
                <select name="gender" class="validate-selection" >
                    		<option selected = "selected" value="">${student.gender}</option>
							<option value="男">男</option>
							<option value="女">女</option>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="field-label"><label for="field5">籍  贯 :</label></div>
            <div class="field-widget"><input name="address" id="address" class="optional" value="${student.address}" /></div>
        </div> 
              <div class="form-row">
            <div class="field-label"><label for="field5">班级</label></div>
            <div class="field-widget"><input name="grade" id="address" class="optional" value="${student.grade}" /></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">学院 :</label></div>
               <select name="college" style="width:80px">
                           <option value="">${student.college}"</option>
                                <c:forEach var="college" items="${requestScope.collegelist}">
			   						<option value="${college.name}">
			   					    	${college.name}
			   						</option>
						   </c:forEach>
                            </select>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">家庭住址</label></div>
            <div class="field-widget"><input name="homeadderss" id="homeadderss" class="optional" value="${student.homeadderss}" /></div>
        </div> 
      
    </fieldset>  
    <fieldset>
        <legend class="optional">所选课程</legend>
        <div class="form-row">
            <div class="field-label"><label for="field5">课程信息</label>
              <input name="couresId" id="couresId" class="optional" value="${student.couresId}" />
            </div>
        </div> 
      
   </fieldset> 
    <fieldset>
        <legend class="optional">学生情况</legend>
      
        <div class="form-row">
            <div class="field-label"><label for="field12">获奖史</label></div>
            <div class="field-widget"><textarea name="award" id="award" class="optional"  >${student.award}</textarea></div>
        </div>

		<div class="form-row">
            <div class="field-label"><label for="field12">是否处分</label></div>
            <div class="field-widget"><textarea name="punishment" id="punishment" class="optional" >${student.punishment}</textarea></div>
        </div>
        
    </fieldset>
				<input type="submit" class="submit" onclick="ajaxUpdate()" value="提     交" /> 
    	
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