package proxy;

import dao.UserDao;
import dbc.DatabaseConnection;
import impl.UserDaoImpl;
import vo.User;

public class UserDaoProxy implements UserDao{

	private DatabaseConnection dbc = null;
	private UserDaoImpl dao = null;

	public UserDaoProxy() {
		try {
			this.dbc  = new DatabaseConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.dao = new UserDaoImpl(dbc.getConnection());
	}

	@Override
	public boolean findLogin(User user) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = this.dao.findLogin(user);//�����������⣬��ɲ���
		this.dbc.close();
		return flag;
	}

	@Override
	public boolean doCreate(User user) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = this.dao.doCreate(user);
		this.dbc.close();
		return flag;
	}

}
