package com.erp.dao;
//admin 관리자
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.erp.vo.Department;
import com.erp.vo.Users;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.erp.mappers.erp";
	
	@Override
	public Users login(Users users) throws Exception {
		
		return sqlSession.selectOne(SESSION + ".login", users);
	}

	@Override
	public List<Department> getDeptList() throws Exception {

		return sqlSession.selectList(SESSION + ".getDeptList");
	}

	@Override
	public Department getDepartment(String dept_num) throws Exception {

		return sqlSession.selectOne(SESSION + ".getDepartment", dept_num);
	}

	@Override
	public int getDeptUserCnt(String dept_num) throws Exception {

		return sqlSession.selectOne(SESSION + ".getDeptUserCnt", dept_num);
	}

	@Override
	public List<Users> getUsersList() throws Exception {
		
		return sqlSession.selectList(SESSION + ".getUsersList");
	}

	@Override
	public List<Users> searchName(String user_name) throws Exception {

		return sqlSession.selectList(SESSION + ".searchName", user_name); //mapper 에 #{} 에 요구하는 것에 넘겨주는 부분 
	}

	@Override
	public void join(Users users) throws Exception {
		sqlSession.insert(SESSION + ".join", users);
	}
	
	@Override
	public void deleteEmp(String user_num) throws Exception {
		sqlSession.delete(SESSION + ".deleteEmp", user_num);
	}
	
	@Override
	public Users getEmployee(String user_num) throws Exception {
		return sqlSession.selectOne(SESSION + ".getEmployee", user_num);
	}
	
	@Override
	public void updateEmp(Users users) throws Exception {
		sqlSession.update(SESSION + ".updateEmp", users);
	}
	
	@Override
	public void addDept(Department department) throws Exception {
		sqlSession.insert(SESSION + ".addDept", department);
	}

	@Override
	public void updateDept(Department department) throws Exception {
		sqlSession.update(SESSION + ".updateDept", department);
	}

	@Override
	public void deleteDept(Department department) throws Exception {
		sqlSession.delete(SESSION + ".deleteDept", department);
	}

	@Override
	public List<Department> searchDept(String dept_name) throws Exception {
		return sqlSession.selectList(SESSION + ".searchDept", dept_name);
	}

	@Override
	public List<Department> searchAuthTable(Department department) throws Exception {
		return sqlSession.selectList(SESSION + ".searchAuthTable", department);
	}

	@Override
	public void auth_update(Department department) throws Exception {
		sqlSession.update(SESSION + ".auth_update", department);
	}




}
