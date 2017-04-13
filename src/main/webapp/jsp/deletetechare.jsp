<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script type="text/javascript" src="javascript/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="javascript/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="javascript/jquery.form.js"></script>
<script src="javascript/jquery-webox.js"></script>
<style type="text/css">
body {
	background:#E6F4FA;
}
</style>
<script> 
function setImagePreview() { 
var docObj=document.getElementById("doc"); 
var imgObjPreview=document.getElementById("preview"); 
if(docObj.files && docObj.files[0]){ 
//火狐下，直接设img属性 
imgObjPreview.style.display = 'block'; 
//imgObjPreview.style.width = '300px'; 
//imgObjPreview.style.height = '220px'; 
//imgObjPreview.src = docObj.files[0].getAsDataURL(); 
//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]); 
}else{ 
//IE下，使用滤镜 
docObj.select(); 
var imgSrc = document.selection.createRange().text; 
var localImagId = document.getElementById("localImag"); 
//必须设置初始大小 
localImagId.style.width = "500px"; 
localImagId.style.height = "500px"; 
//图片异常的捕捉，防止用户修改后缀来伪造图片 
try{ 
localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)"; 
localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc; 
}catch(e){ 
alert("您上传的图片格式不正确，请重新选择!"); 
return false; 
} 
imgObjPreview.style.display = 'none'; 
document.selection.empty(); 
} 
return true; 
} 


function ajaxUpdate(){
	$("#form1").ajaxSubmit({
	     type: "post",
	     dataType: "json",
	     success: function(result){
		parent.document.getElementById('webox').style.display='none'; 
       	parent.document.getElementById('background').style.display='none'; 
     	   //$('.webox').css({display:'none'});
			   //$('.background').css({display:'none'});   
			   parent.document.location.reload();   
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
    <form id="form1" name="form1" action="${pageContext.request.contextPath}/techaerservlet?id=${techaer.id}&method=delete" method="post">
    <fieldset>
        <legend>系统账号注册</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">帐  号:</label></div>
            <div class="field-widget"><p>${techaer.loginId}</p></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field7">密  码 :</label></div>
            <div class="field-widget"><p>${techaer.pwd}</p></div>
        </div>
        
        
    </fieldset>
    <fieldset>
        <legend>教师信息</legend>
        
        <div class="form-row">
            <div class="field-label"><label for="field4">姓   名:</label></div>
            <div class="field-widget"><p>${techaer.name}</p></div>
        </div>


		<div class="form-row">
            <div class="field-label"><label for="field5">身份证号 :</label></div>
            <div class="field-widget"><p>${techaer.idcard}</p></div>
        </div> 
        
		<div class="form-row">
            <div class="field-label"><label for="field5">联系电话:</label></div>
            <div class="field-widget"><p>${techaer.tel}</p></div>
        </div>

		<div class="form-row">
            <div class="field-label"><label for="field5">电子邮箱:</label></div>
            <div class="field-widget"><p>${techaer.eml}</p></div>
        </div>

        <div class="form-row">
            <div class="field-label"><label for="field5">年  龄 :</label></div>
            <div class="field-widget"><p>${techaer.age}</p></div>
        </div> 
      <div class="form-row">
            <div class="field-label"><label for="field5">性 别 :</label></div>
            <div class="field-widget"><p>${techaer.gender}</p></div>
        </div> 
 		<div class="form-row">
            <div class="field-label"><label for="field5">民  族:</label></div>
            <div class="field-widget"><p>${techaer.family}</p></div>
        </div> 

	<div class="form-row">
            <div class="field-label"><label for="field5">婚姻状况:</label></div>
            <div class="field-widget"><p>${techaer.marriage}</p></div>
        </div> 
   	<div class="form-row">
            <div class="field-label"><label for="field5">学 位:</label></div>
            <div class="field-widget"><p>${techaer.degree}</p></div>
        </div>      
	<div class="form-row">
            <div class="field-label"><label for="field5">所属学院</label></div>
            <div class="field-widget"><p>${techaer.college}</p></div>
        </div> 
        
	<div class="form-row">
            <div class="field-label"><label for="field5">编制状态:</label></div>
            <div class="field-widget"><p>${techaer.compile}</p></div>
        </div> 
        
        <div class="form-row">
            <div class="field-label"><label for="field5">工作年份:</label></div>
            <div class="field-widget"><p>${techaer.workdate}</p></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">出生日期 :</label></div>
            <div class="field-widget"><p>${techaer.birth}</p></div>
        </div> 

		<div class="form-row">
            <div class="field-label"><label for="field5">家庭地址 :</label></div>
            <div class="field-widget"><p>${techaer.homeaddress}</p></div>
        </div> 
    </fieldset>  
				<input type="submit" class="submit" onclick="ajaxUpdate()" value="删   除" /> 
    </form>
    </div>
</body>
</html>