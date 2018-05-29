package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nsz.mvc.servlet.String;

public class loginservlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
    	String path = "login.jsp";
    	String name = request.getParameter("name");
    	String pass = request.getParameter("passs");
    	String kaptcha = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
    	String yzminput = request.getParameter("yzminput");
    	
    }
}
