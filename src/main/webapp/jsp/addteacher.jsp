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

<script> 
 function validate_form(thisform){
	 var sysname=document.getElementById("username");
	 var syspass=document.getElementById("password");
	 var name=document.getElementById("name");
	 var idcard=document.getElementById("idcard");
	 var tle=document.getElementById("tle");
	 var eml=document.getElementById("eml");
	 var age=document.getElementById("age");
	 var gender=document.getElementById("gender");
	 var family=document.getElementById("family");
	 var marriage=document.getElementById("marriage");
	 var college=document.getElementById("college");
	 var compile=document.getElementById("compile");
	 var degree=document.getElementById("degree");
	 var workdate=document.getElementById("workdate");
	 var birth=document.getElementById("birth");
	 var homeaddress=document.getElementById("homeaddress");
	 if(sysname.value==""){
			document.getElementById("resID").innerHTML = "用户名必填";
		 sysname.focus();
		 return false;
	 }else if(syspass.value == ""){
		 alert("密码不能为空！");
		 syspass.focus();
		 return false;
	 }else if(name.value == ""){
		 name.focus();
		 return false;
	 }else if(idcard.value == ""){
		 alert("身份证号不能为空！");
		 idcard.focus();
		 return false;
	 }else if(tle.value == ""){
		 alert("联系电话不能为空！");
		 tle.focus();
		 return false;
	 }else if(eml.value == ""){
		 alert("邮箱不能为空！");
		 eml.focus();
		 return false;
	 }else if(age.value == ""){
		 alert("年龄不能为空！");
		 age.focus();
		 return false;
	 }else if(gender.value == ""){
		 alert("性别不能为空！");
		 gender.focus();
		 return false;
	 }else if(family.value == ""){
		 alert("民族不能为空！");
		 family.focus();
		 return false;
	 }else if(marriage.value == ""){
		 alert("婚姻状况不能为空！");
		 marriage.focus();
		 return false;
	 }else if(college.value == ""){
		 alert("学院不能为空");
		 college.focus();
		 return false;
	 }
	 else if(compile.value == ""){
		 alert("编制状态不能为空");
		 compile.focus();
		 return false;
	 }
	 else if(degree.value == ""){
		 alert("学历不能为空");
		 degree.focus();
		 return false;
	 }
	 else if(workdate.value == ""){
		 alert("入职时间不能为空");
		 workdate.focus();
		 return false;
	 }
	 else if(birth.value == ""){
		 alert("生日不能为空");
		 birth.focus();
		 return false;
	 }
	 else if(homeaddress.value== ""){
		 alert("家庭地址不能为空");
		 homeaddress.focus();
		 return false;
	 }
	 else{
		 return true;
	 }
}
 function check()
 {
 var bb = document.getElementById("workdate").value;//txt_id为文本框的ID
 if(isdate(bb)){
		
 }
 else{
	  alert("格式不合法请重新输入");
	  bb.focus();
 }
 //ismobile 代表以下任何一个函数名称
 }
 function isdate(str){
	  var result=str.match(/^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
	  if(result==null) return false;
	  var d=new Date(result[1], result[3]-1, result[4]);
	  return (d.getFullYear()==result[1] && d.getMonth()+1==result[3] && d.getDate()==result[4]);
 }
 /*function idcheck()
 {
 var bb = document.getElementById("idcard").value;//txt_id为文本框的ID
 if(isidcard(bb)){
	 alert("格式正确");
 }
 else{
	  alert("格式不合法请重新输入");
	  bb.focus();
 }
 function isidcard(str)
 {
 var result=str.match(/\d{15}|\d{18}/);
 if(result==null) return false;
 return true;
 }*/
</script> 

<link title="style1" rel="stylesheet" href="css/style1.css" type="text/css" />
<link title="style2" rel="alternate stylesheet" href="css/style2.css" type="text/css" />
<link title="style3" rel="alternate stylesheet" href="css/style3.css" type="text/css" />
</head>
<body>
   
	<div class="form_content" align="center">
    <form id="test" action="${pageContext.request.contextPath}/techaerservlet?method=addtechaer" onsubmit="return validate_form(this)"  method="post" >
    <fieldset>
        <legend>系统账号注册</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">账  号:</label></div>
            <div class="field-widget"><input name="loginId" id="username" class="optional" /><font color="red">*</font></div>
            <span id="resID"  style="color:#F00"></span>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field7">密  码 :</label></div>
            <div class="field-widget"><input type="password" name="password" id="password" class="optional"  onmouseout=""/><font color="red">*</font></div>
            <span id="password"  style="color:#F00"></span>      
</div>
        
        
    </fieldset>
    <fieldset>
        <legend>教师信息</legend>
        
        <div class="form-row">
            <div class="field-label"><label for="field4">姓   名:</label></div>
            <div class="field-widget"><input name="name" id="name" class="optional"  /><font color="red">*</font></div>
                <span id="name"  style="color:#F00"></span>      
        </div>


		<div class="form-row">
            <div class="field-label"><label for="field5">身份证号 :</label></div>
            <div class="field-widget"><input name="idcard" id="idcard" class="optional"   onmouseout="idcheck()"/><font color="red">*</font></div>
               <span id="idcard"  style="color:#F00"></span>      
        </div> 
        
		<div class="form-row">
            <div class="field-label"><label for="field5">联系电话:</label></div>
            <div class="field-widget"><input name="tle" id="tel" class="optional" /><font color="red">*</font></div>
            <span id="tle"  style="color:#F00"></span>      
        </div>

		<div class="form-row">
            <div class="field-label"><label for="field5">电子邮箱:</label></div>
            <div class="field-widget"><input name="eml" id="eml" class="optional" /><font color="red">*</font></div>
               <span id="eml"  style="color:#F00"></span>      
        </div>

        <div class="form-row">
            <div class="field-label"><label for="field5">年  龄 :</label></div>
            <div class="field-widget"><input name="age" id="age" class="optional" /><font color="red">*</font></div>
                 <span id="age"  style="color:#F00"></span>      
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
            <span id="gender"  style="color:#F00"></span>      
        </div>
 		<div class="form-row">
            <div class="field-label"><label for="field5">民  族:</label></div>
            <div class="field-widget">
			<select id="family" name="family" class="validate-selection"  >
                    <option value="">请选择...</option>
                    <option value="汉族">汉族</option>
					<option value="回族">回族</option>
					<option value="壮族">壮族</option>
                </select>
		<font color="red">*</font>
			</div>
			    <span id="family"  style="color:#F00"></span>      
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field6">婚姻状况 :</label></div>
            <div class="field-widget">
                <select id="marriage" name="marriage" class="validate-selection"  >
                    <option value="">请选择...</option>
                    <option value="未婚">未婚</option>
					<option value="已婚">已婚</option>
                </select>
		<font color="red">*</font>
            </div>
                <span id="marriage"  style="color:#F00"></span>      
        </div>


			<div class="form-row">
            <div class="field-label"><label for="field5">学院</label></div>
            <div class="field-widget">
                    <select name="college"class="validate-selection"  id="college">
                           <option value="">请选择...</option>
                            <c:forEach var="college" items="${requestScope.collegelist}">
			   						<option value="${college.name}">
			   					    	${college.name}
			   						</option>
						   </c:forEach>
                            </select>
            </div>
                <span id="college"  style="color:#F00"></span>      
        </div> 
        
		<div class="form-row">
            <div class="field-label"><label for="field5">学位</label></div>
            <div class="field-widget"><input name="degree" id="degree" class="optional"  /></div>
                  <span id="degree"  style="color:#F00"></span>      
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field6">编制状态 :</label></div>
            <div class="field-widget">
                <select id="compile" name="compile" class="validate-selection"  >
                    <option>请选择...</option>
                    <option value="正式编制">正式编制</option>
					<option value="实习编制">实习编制</option>
                </select>
            </div>
                <span id="compile"  style="color:#F00"></span>      
        </div>
        <div class="form-row">
            <div class="field-label"><label for="field5">工作年份:</label></div>
            <div class="field-widget"><input name="workdate" id="workdate" class="optional"  /></div>
                  <span id="workdate"  style="color:#F00"></span>      
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">出生日期 :</label></div>
            <div class="field-widget"><input name="birth" id="birth" class="optional" /></div>
               <span id="birth"  style="color:#F00"></span>      
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">家庭地址 :</label></div>
            <div class="field-widget"><input name="homeaddress" id="homeaddress" class="optional" /></div>
                 <span id="homeaddress"  style="color:#F00"></span>      
        </div> 
    </fieldset>  
      
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
				document.getElementById("resID").innerHTML = "用户名必填";
  			}
			else{
				var ajax =  createAJAX();
				var method ="post";
		 	    var uri = "${pageContext.request.contextPath}/techaerservlet?method=verify";
                  ajax.open(method, uri);
          	    	ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
    			//NO3)
    			var content = "username=" + username;
    			ajax.send(content);
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
    	<input type="submit" class="submit" value="提     交"  onclick="check()"/> 
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