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
    	 
    	 List<String> info = new ArrayList<String>(); //�ֻ�����
    	 if(username == null || "".equals(username)) {
    		 info.add("�û�ID����Ϊ�գ�<a href = insert.jsp>������󣬵������</a>");
    	 }
    	 if(password==null || "".equals(password)) {
    		 info.add("���벻��Ϊ�գ�<a href=insert.jsp>������󣬵������</a>");
    	 }
    	 if(repassword==null || "".equals(repassword)) {
    		 info.add("�ڶ������벻��Ϊ�գ�<a href=insert.jsp>������󣬵������</a>");
    	 }
    	 if(repassword == password || repassword.equals(password)) {
    		 info.add("�������벻һ�£�<a href=insert.jsp>������󣬵������</a>");
    	 }
    	 if(info.size()==0) {//����û�м�¼�κεĴ���
    		 User user = new User();
    		 user.setUsername(username);
    		 user.setPassword(password);
    		 try {
				if(Daofactory.getUserDaoInstance().doCreate(user)) {
					 info.add("�û�ע��ɹ�����ӭ"+user.getUsername()+"OK");
				 }else {
					 info.add("�û�ע��ʧ�ܣ�");
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
