<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
        var xmlHttp;
        function creareXMLHttp(){
                if(window.XMLHttpRequest){
                	xmlHttp = new XMLHttpRequest();
                }else{
                	xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }	
        }
        
		function refImg(){
			document.getElementById("Kaptcha").src="<%=basePath%>Kaptcha.jpg?data="+Math.random();
		}
		
		function check(){
			return ;
		}
		
		function checkyzm(yzminput){
			createXMLHttp();
			xmlHttp.open("POST","YzmCheckServlet?kaptcha="+yzminput);
			xmlHttp.onreadystatechange = checkyzmCallback;
			xmlHttp.send(null);
			document.getElementById("yzmspan").innerHTML = "验证中..."
		}
		function checkyzmCallback(){
			if(xmlHttp.readyState ==4 ){
				if(xmlHttp.status ==200){
					if(text == "yes"){
						document.getElementById("yzmspan").innerHTML = "OK"
						return true;
					}else if(text == "no"){
						document.getElementById("yzmspan").innerHTML = "验证码错误！"
						return true;
					}
				}
			}
		}
		
		
</script>
<body>
<form action="loginservlet" method="post" onsubmit="return check()">
               账号：<input type="text" id="username" maxlength="20" onblur="checkusername()" required><span></span><br/>
               密码：<input type="password" id="password" maxlength="20" onblur = "checkpassword()" required><span id=""></span><br>
         验证码：<img id="Kaptcha" src="<%=basePath%>Kaptcha.jpg" onclick="refImg()" ><a href="javascript:void(0)" onclick="refImg()">看不清，点击刷新</a><br>
         <input type = "text" id="yzminput" onBlur="checkyzm(this.value)"  maxlength="4" required>
         <span id="yzmspan">  </span>
          <input type="submit" value="提交">
          <input type="button" onclick="window.location.href='register.jsp'" value="注册">
     </form>
</body>
</html>