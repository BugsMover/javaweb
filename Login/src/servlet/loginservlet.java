package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import factory.Daofactory;
import sha256.sha_256;
import vo.User;


public class loginservlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
    	String path = "login.jsp";
    	String name = request.getParameter("name");
    	String pass = request.getParameter("passs");
    	String kaptcha = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
    	String yzminput = request.getParameter("yzminput");
    	List<String> info = new ArrayList<String>(); 
    	if(yzminput == null || !yzminput.equalsIgnoreCase(kaptcha)) {
    		info.add("验证码错误！<a hred =login.jsp>点击返回</a>");
    	}
    	if(name == null || "".equals(name)) {
    		info.add("用户名不能为空!<a href = login.jsp>点击返回</a>");
    	}
    	if(pass == null || "".equals(pass)) {
    		info.add("密码不能为空！<a> hred = login.jsp>点击返回</a>");
    	}
    	if(info.size()==0) {
    		User user = new User();
    		sha_256 sha = new sha_256();
    		user.setUsername(sha.getSHA256Strjava(name));
    		user.setPassword(pass);
    		try {
				if(Daofactory.getUserDaoInstance().findLogin(user)) {
				info.add("用户登录成功，欢迎"+user.getUsername()+"光临！");
				}else {
					info.add("用户登录失败，错误的用户名和密码！");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	request.setAttribute("info", info);
    	request.getRequestDispatcher(path).forward(request, response);
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
    	this.doGet(request, response);
    }
}
