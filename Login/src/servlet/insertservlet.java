package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import factory.Daofactory;
import vo.User;

public class insertservlet extends HttpServlet{
     public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
    	 String path = "insert.jsp";
    	 String username = request.getParameter("name");
    	 String password = request.getParameter("password");
    	 String repassword = request.getParameter("repassword");
    	 
    	 List<String> info = new ArrayList<String>(); //手机错误
    	 if(username == null || "".equals(username)) {
    		 info.add("用户ID不能为空！<a href = insert.jsp>输入错误，点击返回</a>");
    	 }
    	 if(password==null || "".equals(password)) {
    		 info.add("密码不能为空！<a href=insert.jsp>输入错误，点击返回</a>");
    	 }
    	 if(repassword==null || "".equals(repassword)) {
    		 info.add("第二次密码不能为空！<a href=insert.jsp>输入错误，点击返回</a>");
    	 }
    	 if(repassword == password || repassword.equals(password)) {
    		 info.add("两次密码不一致！<a href=insert.jsp>输入错误，点击返回</a>");
    	 }
    	 if(info.size()==0) {//里面没有记录任何的错误
    		 User user = new User();
    		 user.setUsername(username);
    		 user.setPassword(password);
    		 try {
				if(Daofactory.getUserDaoInstance().doCreate(user)) {
					 info.add("用户注册成功，欢迎"+user.getUsername()+"OK");
				 }else {
					 info.add("用户注册失败！");
				 }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	 }
     } 
     public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
    	 this.doGet(request, response);
     }
}
