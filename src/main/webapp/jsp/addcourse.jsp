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

function validate_form(thisform){
	var coursename=document.getElementById("coursename");
	 var college=document.getElementById("password");

	 if(coursename.value==""){
		 alert("课程名不能为空！");
		 coursename.focus();
		 return false;
	 }
	 else if(college.value==""){
		 alert("学院不能为空！");
		 college.focus();
		 return false;
	 }
	 else{
		 return true;
	 }
}
</script>

<link title="style1" rel="stylesheet" href="css/style1.css" type="text/css" />
<link title="style2" rel="alternate stylesheet" href="css/style2.css" type="text/css" />
<link title="style3" rel="alternate stylesheet" href="css/style3.css" type="text/css" />
</head>
<body>
   
	<div class="form_content" align="center">
    <form id="test" action="${pageContext.request.contextPath}/courseservlet?method=addcourse" method="post" onsubmit="return validate_form(this)" method="post">
    <fieldset>
        <legend>课程信息</legend>
        
        

           
        <div class="form-row">
            <div class="field-label"><label for="field5">课程名字</label></div>
            <div class="field-widget"><input name="coursename" id="coursename" class="optional"  /></div>
        </div> 
		<div class="form-row">
            <div class="field-label"><label for="field5">学院</label></div>
            <div class="field-widget">
                    <select name="college" class="validate-selection"  id="college">
                           <option value="">请选择...</option>
                            <c:forEach var="college" items="${requestScope.collegelist}">
			   						<option value="${college.name}">
			   					    	${college.name}
			   						</option>
						   </c:forEach>
                            </select>
            </div>
        </div> 

    </fieldset>  
    	<input type="submit" class="submit" value="提     交" /> 
    	     	<script type="text/javascript">
		//创建AJAX异步对象，即XMLHttpRequest
		function createAJAX(){
			var ajax = null;
			try{
				ajax = new ActiveXObject("microsoft.xmlhttp");
			}catch(e1){
				try{
					ajax = new XMLHttpRequest();
				}catch(e2){
					alert("你的浏览器不支持ajax，请更换浏览器");
				}
			}
			return ajax;
		}
	</script>
	
	
	<script type="text/javascript">
		//定位文本框，同时提供焦点失去事件
		document.getElementById("username").onblur = function(){
			//获取文本框中输入的值
			var username = this.value;
			if(username.length == 0){
		     	alert('用户名不能为空');
  			}
			else{
				var ajax =  createAJAX();
				var method ="post";
		 	    var uri = "${pageContext.request.contextPath}/studentservlet?method=verify";
                  ajax.open(method, uri);
          		ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
    			//NO3)
    			var content = "username=" + username;
    			ajax.send(content);
    			ajax.onreadystatechange = function(){
    				if(ajax.readyState == 4){
    					if(ajax.status == 200){
    						var tip = ajax.responseText;
    						alert(tip);
    					}
    				}
    			}
			}
		}
	</script>
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