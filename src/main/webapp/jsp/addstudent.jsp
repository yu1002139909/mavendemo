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
<script> 
 function validate_form(thisform){
	 var sysname=document.getElementById("username");
	 var syspass=document.getElementById("password");
	 var name=document.getElementById("name");
	 var age=document.getElementById("age");
	 var gender=document.getElementById("gender");
	 var college=document.getElementById("college");
	 var address=document.getElementById("address");
	 var grade=document.getElementById("grade");
	 var homeaddress=document.getElementById("homeaddress");
	 if(sysname.value==""){
		 alert("账号不能为空！");
		 sysname.focus();
		 return false;
	 }else if(syspass.value == ""){
		 alert("密码不能为空！");
		 syspass.focus();
		 return false;
	 }else if(name.value == ""){
		 alert("姓名不能为空！");
		 name.focus();
		 return false;
	 }else if(address.value == ""){
		 alert("籍贯不能为空！");
		 address.focus();
		 return false;
	 }else if(grade.value == ""){
		 alert("班级不能为空！");
		 grade.focus();
		 return false;
	 }else if(age.value == ""){
		 alert("年龄不能为空！");
		 age.focus();
		 return false;
	 }else if(gender.value == ""){
		 alert("性别不能为空！");
		 gender.focus();
		 return false;
	 }else if(homeaddress.value == ""){
		 alert("家庭住址不能为空！");
		 homeaddress.focus();
		 return false;
	 }else if(college.value == ""){
		 alert("学院不能为空");
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
    <form id="test" action="${pageContext.request.contextPath}/studentservlet?method=addstu"  onsubmit="return validate_form(this)"  method="post">
    <fieldset>
        <legend>系统账号注册</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">账   号:</label></div>
            <div class="field-widget"><input name="username" id="username" class="optional" /><font color="red">*</font>
            </div>
             <span id="resID"  style="color:#F00"></span>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field7">密  码 :</label></div>
            <div class="field-widget"><input type="password" name="password" id="password" class="optional"/><font color="red">*</font></div>
        </div>
        
        
    </fieldset>
    <fieldset>
        <legend>学生信息</legend>
        
        <div class="form-row">
            <div class="field-label"><label for="field4">姓   名:</label></div>
            <div class="field-widget"><input name="name" id="name" class="optional"  /><font color="red">*</font></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field5">年  龄 :</label></div>
            <div class="field-widget"><input name="age" id="age" class="optional" /><font color="red">*</font></div>
        </div> 
        
        <div class="form-row">
            <div class="field-label"><label for="field6">性  别 :</label></div>
            <div class="field-widget">
                <select id="gender" name="gender" class="validate-selection"   >
                    <option value="">请选择...</option>
                    <option value="男">男</option>
					<option value="女">女</option>
                </select>
				<font color="red">*</font>
            </div>
        </div>

           
        <div class="form-row">
            <div class="field-label"><label for="field5">籍  贯 :</label></div>
            <div class="field-widget"><input name="address" id="adderss" class="optional"  /></div>
        </div> 
        
		<div class="form-row">
            <div class="field-label"><label for="field5">班级</label></div>
            <div class="field-widget"><input name="grade" id="grade" class="optional" /></div>
        </div> 
		<div class="form-row">
            <div class="field-label"><label for="field5">学院</label></div>
            <div class="field-widget">
                    <select name="college" style="width:80px">
                           <option value="">请选择...</option>
                            <c:forEach var="college" items="${requestScope.collegelist}">
			   						<option value="${college.name}">
			   					    	${college.name}
			   						</option>
						   </c:forEach>
                            </select>
            </div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">家庭住址</label></div>
            <div class="field-widget"><input name="homeadress" id="homeadress" class="optional" /></div>
        </div> 
      
      
    </fieldset>  
    <fieldset>
        <legend class="optional">学生情况</legend>
      
        <div class="form-row">
            <div class="field-label"><label for="field12">获奖史</label></div>
            <div class="field-widget"><textarea name="award" id="award" class="optional"></textarea></div>
        </div>

		<div class="form-row">
            <div class="field-label"><label for="field12">是否处分</label></div>
            <div class="field-widget"><textarea name="punishment" id="punishment" class="optional"></textarea></div>
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
    			//
    			ajax.onreadystatechange = function(){
    				if(ajax.readyState == 4){
    					if(ajax.status == 200){
    						var tip = ajax.responseText;
    						document.getElementById("resID").innerHTML = tip;
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