package com.erp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.erp.dao.MyPageDAO;
import com.erp.vo.Users;

// 마이페이지
@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	MyPageDAO dao;
	
	@Override
	public Users pw_check(Users users) throws Exception {
		return dao.pw_check(users);
	}

	@Override
	public Users getUserInfo(String user_num) throws Exception {
		return dao.getUserInfo(user_num);
	}
	
	@Override
	public String getDeptName(String dept_num) throws Exception {
		return dao.getDeptName(dept_num);
	}
	
	@Override
	public void update_userInfo(Users users) throws Exception {
		dao.update_userInfo(users);
	}


}
