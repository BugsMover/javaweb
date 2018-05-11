<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript">
		function refImg(){
			document.getElementById("Kaptcha").src="<%=basePath%>Kaptcha.jpg?data="+Math.random();
		}
		</script>
<body>
<form action="suc.jsp" method="post">
               账号：<input type="text" name="username"><br/>
               密码：<input type="password" name="password"><br>
          <input type="submit" value="提交">
         验证码：<img id="Kaptcha" src="<%=basePath%>Kaptcha.jpg" onclick="refImg()">
          <input type="button" onclick="window.location.href='register.jsp'" value="注册">
     </form>
</body>
</html>