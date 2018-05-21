<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
        var xmlHttp ;
        var flag = false;
        function createXMLHttp() {
			if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}else{
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
        function checkForm() {
		//var usernametip = checkusername();
		//var passwordtip = checkpassword();
		//var repasswordtip = checkrepassword();
		//var agetip = checkage();
		//var phonenumbertip = checkphonenumber();
		//var emailtip = checkemail();
		//return usernametip && passwordtip && repasswordtip  && agetip && phonenumbertip && emailtip ;
		return flag;
	}  
      function checkusername(username){
          var username = document.getElementById('username');
    	  var usernamespan = document.getElementById('usernamespan')
    	  var pattern = /^[0-9a-zA-Z\u4e00-\u9fa5_]{3,16}$/;  //用户名格式正则表达式：用户名要至少三位
    	  if(username.value.length == 0){
    		  usernamespan.innerHTML="用户名不能为空！"
    		  flag = false;
    	  }else if(!pattern.test(username.value)){
    		  usernamespan.innerHTML="用户名不规范！"
    		  flag = false;
    	  }else {
    		  //usernamespan.innerHTML="OK"
        	  createXMLHttp();
        	  xmlHttp.open("POST","CheckServlet?username="+username);
    		  xmlHttp.onreadystatechange = checkusernameCallback;
    		  xmlHttp.send(null);
    		  usernamespan.innerHTML = "正在验证...";
    	  }
      }
    	  function checkusernameCallback(){
    		  if(xmlHttp.readyState == 4){
    			  if(xmlHttp.status ==200){
    				  var text = xmlHttp.responseText;
    				  if(text =="ture"){//用户已经存在
    					 document.getElementById("usernamespan").innerHTML = "用户名重复，无法使用！";
    					 flag = false ;
    				  }else {
    					  document.getElementById("usernamespan").innerHTML = "OK";
    					  flag = true ;
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
    		  repasswordspan.innerHTML = "密码不能为空！"
    		  return false;
    	  }
    	  if(password.value != repassword.value ){
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
      
      
      
  </script>
<body>
<form action="#" onSubmit="return checkForm()" method="post">
			用户名：<input type="text" id="username" class="username" maxlength="20" onBlur="checkusername(this.value)"  required><span class="default" id="usernamespan">请输入3位用户名</span><br> 
			密    码：<input type="password" id="password"  maxlength="16" onBlur="checkpassword()"  required><span class=default id="passwordspan">请输入至少8到16位密码</span><br> 
			确认密码：<input type="password" id="repassword" maxlength="16" onBlur="checkrepasswork"  required><span class="default" id="repasswordspan">请再输入一遍密码</span><br>
			手机号码：<input type="number" id="phonenumber" maxlength="11"
			onkeyup="this.value=this.value.replace(/\D/g,'')" onBlur="checkphonenumber()"  ><span id="phonenumberspan">请输入11位手机号码</span><br>
		 	电子邮箱：<input type="email" id="email" maxlength="30" onBlur="checkemail()" ><span id="emailspan">请输入邮箱地址</span><br> 
			验证码：<input type="text"  id="kaptcha" size="4" maxlength="4" onBlur="checkkaptcha()"  required><span id="kaptchaspan">!!!</span>
			<img id="Kaptcha" src="<%=basePath%>Kaptcha.jpg" onclick="refImg()"><a href="javascript:void(0)" onclick="refImg()">看不清，点击刷新！</a><br> 
			<input type="radio" id="terms" required>我同意XXXX相关条款<br>
			<textarea rows="6" cols="80" readonly="readonly">
一、遵守中华人民共和国有关法律、法规，承担一切因您的行为而直接或间接引起的法律责任。
二、发贴请注意以下几条规定，若有违反，本论坛有权删除。
 1、不得发布违反中华人民共和国宪法和法律、违反改革开放和四项基本原则的言论；
 2、不得发布造谣、诽谤他人、煽动颠覆国家政权的言论；
 3、不得发布暴力、色情、迷信的言论；
 4、不得泄露国家秘密；
 5、请勿张贴未经公开报道、未经证实的消息，亲身经历请注明（备查）；
 6、请勿张贴宣扬种族歧视、破坏民族团结的言论和消息；
 7、请注意使用文明用语，请勿张贴对任何人进行人身攻击、谩骂、诋毁的言论；
 8、未经本论坛同意，常规版块不得张贴任何形式的广告；不得发QQ群；广告请发布到专用广告版面！
 9、发帖时，请慎重公开个人资料，由此造成的一切后果，由个人承担，本论坛不负任何责任；
 10、发帖请注意主题明确能简洁的表达帖内内容；请勿在帖子中（标题和内容）加入各种奇形怪状的符号；
三、用户名注册注意事项：
 1、请勿以党和国家领导人或其他名人的真实姓名、字号、艺名、用户名注册；
 2、请勿以国家机构或其他机构的名称注册；
 3、请勿注册和其他网友之名相近、相仿的名字；
 4、请勿注册不文明、不健康之用户名；
 5、请勿注册易产生歧义、引起他人误解之用户名；
 6、请勿注册图形符号等无任何意义的用户名。
 7、如出现上述情况，本论坛有权锁定与删除用户名。
四、请注意版权问题：
 1、凡转贴文章，应注明原始出处和时间；
 2、转贴文章时请注意原发表单位的版权声明，并负担由此可能产生的版权责任。
五、本论坛拥有管理页面和用户名的一切权力。
			</textarea><br>
			<input type="submit" value="提交" ><input type="reset" value="重置">
		</form>

</body>
</html>
