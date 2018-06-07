<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<script type="text/javascript">
        var xmlHttp ;
        function createXMLHttp() {
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}else{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
        function checkForm() {
        	var checkusernameCallback = checkusernameCallback();
        	var checkpassword = checkpassword();
        	var checkrepassword = checkrepassword();
        	var checkphonenumber = checkphonenumber();
        	var checkemail = checkemail();
        	var checkkaptchaCallback = ccheckkaptchaCallback();
		return checkusernameCallback && checkpassword && checkrepassword && checkphonenumber && checkemail && checkkaptchaCallback;
	}  
               
      function checkusername(username){
        	  createXMLHttp();
        	  xmlHttp.open("POST","CheckServlet?username="+username);
    		  xmlHttp.onreadystatechange = checkusernameCallback;
    		  xmlHttp.send(null);
    		  usernamespan.innerHTML = "正在验证...";
      }
     
    	  function checkusernameCallback(){
    		  if(xmlHttp.readyState == 4){
    			  if(xmlHttp.status ==200){
    				  var text = xmlHttp.responseText;
    				 // window.alert(text); 
    				  if(text =="true"){//用户已经存在
    					 document.getElementById("usernamespan").innerHTML = "用户名重复，无法使用！";
    					 return false ;
    				  }else if(text =="false"){ 
    					  document.getElementById("usernamespan").innerHTML = "OK";
    					  return true ;
    				  }else if(text =="length"){
    					  document.getElementById("usernamespan").innerHTML = "用户名不规范，请输入3-16位用户名！";
    					  return false ;
    				  }
    			    }
    			  }
    		  }
    	  
    
      function checkpassword(){
    	  var password = document.getElementById('password');
    	  var passwordspan = document.getElementById('passwordspan');
    	  var pattern = /^\w{6,16}$/; //密码格式正则表达式；密码六位到十六位
    	  if(password.value.length == 0){
    		  passwordspan.innerHTML = "密码不能为空！"
    		  return false;
    	  }else if(!pattern.test(password.value)){
    		  passwordspan.innerHTML="密码不规范！"
    		  return false;
    	  }else{
    		  passwordspan.innerHTML="OK"
    		  return true;
    	  }
      }
      function checkrepassword(){
    	  var repassword = document.getElementById('repassword');
    	  var password = document.getElementById('password');
    	  var repasswordspan = document.getElementById('repasswordspan');
    	  if(repassword.value.length == 0){
    		  repasswordspan.innerHTML = "不能为空！"
    		  return false;
    	  }else if(password.value != repassword.value ){
    		  repasswordspan.innerHTML = "上下密码不正确！"
    		  return false;
    	  }else{
    		  repasswordspan.innerHTML = "OK"
    		  return true;
    	  }
      }
      function checkphonenumber(){
    	  var phonenumber = document.getElementById('phonenumber');
    	  var phonenumberspan = document.getElementById('phonenumberspan');
    	  var pattern = /^1[34578]\d{9}$/; //验证手机号码正则表达式
    	  if(!pattern.test(phonenumber.value)){
    		  phonenumberspan.innerHTML = "手机号码不规范"
    		  return false;
    	  }else{
    		  phonenumberspan.innerHTML ="OK"
    		  return true;
    	  }
      }
      function checkemail(){
    	  var email = document.getElementById('email');
    	  var emailspan = document.getElementById('emailspan');
    	  var pattern = /^[1-9a-zA-Z_]\w*@[a-zA-Z0-9]+(\.[a-zA-Z]{2,})+$/; //验证邮箱正则表达式
    	  if(!pattern.test(email.value)){
    		  emailspan.innerHTML = "E-mail不规范"
    			  return false;
    	  }else{
    		  emailspan.innerHTML = "OK"
    			  return true;
    	  }
      }
      function refImg(){
    	  //验证码切换
    		document.getElementById("Kaptcha").src="<%=basePath%>Kaptcha.jpg?data="+Math.random();
    	}
      function checkkaptcha(kaptcha){
    	  createXMLHttp();
    	  xmlHttp.open("POST","YzmCheckServlet?kaptcha="+kaptcha);
		  xmlHttp.onreadystatechange = checkkaptchaCallback;
		  xmlHttp.send(null);
		  document.getElementById("kaptchaspan").innerHTML = "验证中..."
      }
      function checkkaptchaCallback(){
		  if(xmlHttp.readyState == 4){
			  if(xmlHttp.status ==200){
				  var text = xmlHttp.responseText;
				 // window.alert(text); 
				  if(text =="yes"){//验证码相同
					 document.getElementById("kaptchaspan").innerHTML = "OK";
					 return true ;
				  }else if(text =="no"){ 
					  document.getElementById("kaptchaspan").innerHTML = "验证码错误！";
					  return true ;
				  }
			    }
			  }
      }
      
  </script>
<body>
<form action="loginsservlet" onSubmit="return checkForm()" method="post">
			用户名：<input type="text" id="username" class="username" maxlength="16" onBlur="checkusername(this.value)"  required><span class="default" id="usernamespan">请输入3-16位用户名</span><br> 
			密    码：<input type="password" id="password"  maxlength="16" onBlur="checkpassword()"  required><span class=default id="passwordspan">请输入至少6到16位密码</span><br> 
			确认密码：<input type="password" id="repassword" maxlength="16" onBlur="checkrepassword()"  required><span class="default" id="repasswordspan">请再输入一遍密码</span><br>
			手机号码：<input type="number" id="phonenumber" maxlength="11" onBlur="checkphonenumber()"  ><span id="phonenumberspan">请输入11位手机号码</span><br>
		 	电子邮箱：<input type="email" id="email" maxlength="30" onBlur="checkemail()" ><span id="emailspan">请输入邮箱</span><br> 
			验证码：<input type="text"  id="kaptcha" size="4" maxlength="4" onBlur="checkkaptcha(this.value)"  required><span id="kaptchaspan">不区分大小写</span><br>
			<img id="Kaptcha" src="<%=basePath%>Kaptcha.jpg" onclick="refImg()">
			<a href="javascript:void(0)" onclick="refImg()">看不清，点击刷新！</a><br> 
			<input type="radio" id="terms" required><a href = "terms.html" target="_blank">我同意XXXX相关条款</a><br>
			<input type="submit" value="提交" ><input type="reset" value="重置">
		</form>

</body>
</html>
