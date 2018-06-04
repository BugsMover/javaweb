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


public class loginservlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
    	String path = "login.jsp";
    	String name = request.getParameter("name");
    	String pass = request.getParameter("passs");
    	String kaptcha = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
    	String yzminput = request.getParameter("yzminput");
    	List<String> info = new ArrayList<String>(); 
    	if(yzminput == null || !yzminput.equalsIgnoreCase(kaptcha)) {
    		info.add("��֤�����<a hred =login.jsp>�������</a>");
    	}
    	if(name == null || "".equals(name)) {
    		info.add("�û�������Ϊ��!<a href = login.jsp>�������</a>");
    	}
    	if(pass == null || "".equals(pass)) {
    		info.add("���벻��Ϊ�գ�<a> hred = login.jsp>�������</a>");
    	}
    	if(info.size()==0) {
    		User user = new User();
    		user.setUsername(name);
    		user.setPassword(pass);
    		try {
				if(Daofactory.getUserDaoInstance().findLogin(user)) {
				info.add("�û���¼�ɹ�����ӭ"+user.getUsername()+"���٣�");
				}else {
					info.add("�û���¼ʧ�ܣ�������û��������룡")��
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
