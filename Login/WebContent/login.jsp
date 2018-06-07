<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<script type="text/javascript">
        var xmlHttp;
                if(window.XMLHttpRequest){
                	xmlHttp = new XMLHttpRequest();
                }else{
                	xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }	
        
    
		function refImg(){
			document.getElementById("Kaptcha").src="<%=basePath%>Kaptcha.jpg?data="+Math.random();
		}
		
		function check(){	
			return checkyzmCallback() && checkname() && checkpass();
		}
		
		function checkyzm(yzminput){
			//createXMLHttp();
			xmlHttp.open("POST","YzmCheckServlet?kaptcha="+yzminput);
			xmlHttp.onreadystatechange = checkyzmCallback;
			xmlHttp.send(null);
			document.getElementById("yzmspan").innerHTML = "验证中..."
		}
		function checkyzmCallback(){
			if(xmlHttp.readyState ==4 ){
				if(xmlHttp.status ==200){
					var text = xmlHttp.responseText;
					//window.alert(text);
					if(text == "yes"){
						document.getElementById("yzmspan").innerHTML = "OK"
						return true;
					}else if(text == "no"){
						document.getElementById("yzmspan").innerHTML = "验证码错误！"
						return false;
					}
				}
			}
		}
		function checkname(){
			var name = document.getElementById('name');
			var namespan = document.getElementById('namespan')
			var pattern = /^\w{3,16}$/;
			if(name.value.length==0){
				namespan.innerHTML = "用户名不能为空！"
				return false;
			}else if(!pattern.test(name.value)){
				namespan.innerHTML = "请输入3到16位的用户名！"
				return false;
			}else{
				namespan.innerHTML = "OK"
				return true;
			}
		}
		function checkpass(){
			var pass = document.getElementById('pass');
			var passspan = document.getElementById('passspan')
			var pattern = /^\w{5,16}$/;
			if(pass.value.length==0){
				passspan.innerHTML = "密码不能为空！"
				return false;
			}else if(!pattern.test(pass.value)){
				passspan.innerHTML = "请输入6到16位的密码！"
				return false;
			}else{
				passspan.innerHTML = "OK"
				return true;
			}
		}
		
</script>
<body>
<form action="loginservlet" method="post" onsubmit="return check()">
             用户名：<input type="text" id="name" maxlength="16" size="16" onBlur="checkname()" required><span id="namespan"></span><br/>
               密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" id="pass" size="17" maxlength="16" onblur = "checkpass()" required><span id="passspan"></span><br>
         验证码：<input type = "text" id="yzminput" onBlur="checkyzm(this.value)" size="4" maxlength="4" required>
         <span id="yzmspan">不分大小写</span><br>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <img id="Kaptcha" src="<%=basePath%>Kaptcha.jpg" onclick="refImg()" ><a href="javascript:void(0)" onclick="refImg()">看不清，点击刷新</a><br>
         <span>...........</span><br>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="submit" value="提交">
          <input type="button" onclick="window.location.href='register.jsp'" value="注册">
     </form>
</body>
</html>