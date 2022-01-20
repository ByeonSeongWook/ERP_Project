package com.erp.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.erp.vo.Users;

// 마이페이지
@Repository
public class MyPageDAOImpl implements MyPageDAO {
	
	@Inject
	SqlSession sqlSession;

	final String SESSION = "com.erp.mappers.erp";

	@Override
	public Users pw_check(Users users) throws Exception {
		
		return sqlSession.selectOne(SESSION+ ".pw_check" , users);
	}

	@Override
	public Users getUserInfo(String user_num) throws Exception {
		return sqlSession.selectOne(SESSION + ".getUserInfo", user_num);
	}

	@Override
	public void update_userInfo(Users users) throws Exception {
		sqlSession.update(SESSION + ".update_userInfo", users);
	}

	@Override
	public String getDeptName(String dept_num) throws Exception {
		return sqlSession.selectOne(SESSION + ".getDeptName", dept_num);
	}

}
