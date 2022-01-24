package com.erp.service;
//admin 관리자
import java.util.List;

import com.erp.vo.Department;
import com.erp.vo.Users;

public interface AdminService {
	public Users loginAction(Users users) throws Exception;
	
	public List<Department> getDeptList() throws Exception;
	
	public String makeUser_num(String dept_num) throws Exception;
	
	public Department getDepartment(String dept_num) throws Exception;
	
	public List<Users> getUsersList() throws Exception;
	
	public List<Users> searchName(String user_name) throws Exception;
	
	public void joinAction(Users users) throws Exception;
	
	public void deleteEmpAction(List<String> user_num) throws Exception;
	
	public Users getEmployeeAction(String user_num) throws Exception;
	
	public void updateEmp(Users users) throws Exception;
	
	public void addDeptAction(Department department) throws Exception;
	
	public void UpdateDeptAction(Department department) throws Exception;
	
	public void DeleteDeptAction(Department department) throws Exception;
	
	public List<Department> searchDeptAction(String dept_name) throws Exception;
	
	public List<Department> searchAuthTable(Department department) throws Exception;
	
	public void auth_updateAction(Department department) throws Exception;
}
