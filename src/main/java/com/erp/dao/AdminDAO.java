package com.erp.dao;
// admin 관리자
import java.util.List;

import com.erp.vo.Department;
import com.erp.vo.Users;
// dao 	는 mapper 아이디와 동일하게 지어주는 것이 좋다 
public interface AdminDAO {
	// 로그인 기능
	public Users login(Users users) throws Exception;
	
	// 부서 리스트 들고오기
	public List<Department> getDeptList() throws Exception;
	
	// 부서 객체 들고 오기(검색시)
	public Department getDepartment(String dept_num) throws Exception;
	
	// 부서별 유저 카운트에 + 1
	// 유저 테이블을 기준으로 각 부서에 몇명이 있는지 검사
	public int getDeptUserCnt(String dept_num) throws Exception;
	
	// 유저 목록 불러오기
	public List<Users> getUsersList() throws Exception;
	
	// 유저 이름으로 데이터 검색
	public List<Users> searchName(String user_name) throws Exception;
	
	// 사원 등록
	public void join(Users users) throws Exception;
	
	// 사원 삭제
	public void deleteEmp(String user_num) throws Exception;
	
	// 사원 정보 불러오기(수정)
	public Users getEmployee(String user_num) throws Exception;
	
	// 사원 수정
	public void updateEmp(Users users) throws Exception;
	
	// 부서 추가
	public void addDept(Department department) throws Exception;
	
	// 부서 수정
	public void updateDept(Department department) throws Exception;
	
	// 부서 삭제
	public void deleteDept(Department department) throws Exception;
	
	// 부서 검색
	public List<Department> searchDept(String dept_name) throws Exception;
	
	// 부서 권한 검색
	public List<Department> searchAuthTable(Department department) throws Exception;
	
	// 부서 권한 수정
	public void auth_update(Department department) throws Exception;
	
}
