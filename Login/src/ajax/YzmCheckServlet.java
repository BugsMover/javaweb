package ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class YzmCheckServlet extends HttpServlet{
   public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
	   this.doPost(request, response);
   }
   public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
	   request.setCharacterEncoding("UTF-8");
	   response.setContentType("text/html");
	   String kaptcha= request.getParameter("kaptcha");
	   System.out.println("��ҳ�ش���֤�룺"+kaptcha);
	   String c = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
	   System.out.println("��֤�룺"+c);
	  if(kaptcha.length()<=3 || !kaptcha.equalsIgnoreCase(c)) {
		  response.getWriter().print("no");
	  }else if(kaptcha.equalsIgnoreCase(c)){
	   response.getWriter().print("yes");
	   }
   }
}
