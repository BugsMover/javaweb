package dao;

import vo.User;

public interface UserDao {
	//������ɵ��ǵ�½��֤����½����ֻ�������ֽ��
	public boolean findLogin(User user)throws Exception ;
	public boolean doCreate(User user)throws Exception;
}
