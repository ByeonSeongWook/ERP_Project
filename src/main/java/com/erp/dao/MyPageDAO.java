package com.erp.dao;

import com.erp.vo.Users;

public interface MyPageDAO {
	public Users pw_check(Users users) throws Exception;
	
	public Users getUserInfo(String user_num) throws Exception;
	
	public String getDeptName(String dept_num) throws Exception;
	
	public void update_userInfo(Users users) throws Exception;
}
