<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'MyJsp.jsp' starting page</title>
  </head>
  <script type="text/javascript">
  function check()
  {
  var bb = document.getElementById("ID").value;//txt_id为文本框的ID
  if(isdate(bb)){
	  alert("格式正确");
  }
  else{
	  alert("格式不合法请重新输入");
  }
  //ismobile 代表以下任何一个函数名称
  }
  function isdate(str){
	  var result=str.match(/^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
	  if(result==null) return false;
	  var d=new Date(result[1], result[3]-1, result[4]);
	  return (d.getFullYear()==result[1] && d.getMonth()+1==result[3] && d.getDate()==result[4]);
	  }
  </script>
  <body>
	<input type="text"  id ="ID">
	<input type="submit" value="提交" onclick="check()">
  </body>
</html>
