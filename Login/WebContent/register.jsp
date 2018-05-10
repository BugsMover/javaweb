<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta content="text/html" charset="UTF-8">
  <title>注册页面</title>
  </head>
  
  <body>
		<form action="" method="post">
			用户名：<input type="text" name="username" maxlength="12" required><br> 
			密码：<input type="password" name="password" maxlength="16" required><br> 
			确认密码：<input type="password" name="repassword" maxlength="16" required><br>
			性别：<input type="radio" name="sex">男&nbsp;
			     <input type="radio" name="sex">女<br> 
			年龄：<input type="number" name="age" maxlength="3" min="0" max="150" size="3" ><br> 
			电话：<input type="number" name="phonenumber" maxlength="11"><br>
			电子邮箱：<input type="text" name="email"><br> 
			验证码：<input type="text" name="yzmimg" size="4" maxlength="4" required><img alt="" src=""><br> 
			<input type="radio" name="terms" required>我已认真阅读XXXX相关条款<br>
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
			<input type="submit" value="提交"><input type="reset" value="重置">
		</form>
</body>
</html>
