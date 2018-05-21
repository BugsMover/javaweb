package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckServlet extends HttpServlet{
	public static final String DBDRIVER = "com.mysql.jdbc.Driver";
	public static final String DBURL = "jdbc:mysql://localhost:3306/db_form";
	public static final String DBUSER = "root" ;
	public static final String DBPASS = "admin";
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		try {
			Class.forName(DBDRIVER);
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
			String sql = "SELECT COUNT(username) FROM user WHERE username = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1)>0) {//用户ID已经存在
					out.print("true");
				}else {
					out.print("false");
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
