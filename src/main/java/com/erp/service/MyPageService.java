package com.erp.service;

import com.erp.vo.Users;

// 마이페이지
public interface MyPageService {
	public Users pw_check(Users users) throws Exception;
	
	public Users getUserInfo(String user_num) throws Exception;
	
	public String getDeptName(String dept_num) throws Exception;
	
	public void update_userInfo(Users users) throws Exception;
}
