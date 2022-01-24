package com.erp.service;
//admin 관리자
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.erp.dao.AdminDAO;
import com.erp.vo.Department;
import com.erp.vo.Users;
@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	AdminDAO dao;
	

	@Override
	public Users loginAction(Users users) throws Exception {
		
		return dao.login(users);
	
	}

	@Override
	public List<Department> getDeptList() throws Exception {
		
		return dao.getDeptList();
	}

	@Override
	public Department getDepartment(String dept_num) throws Exception {
		
		return dao.getDepartment(dept_num);
	}

	@Override
	public String makeUser_num(String dept_num) throws Exception {
			int cnt = dao.getDeptUserCnt(dept_num);
			
													// .format(3자리, 값이 없는 자리에 0 을 붙인다. cnt : 카운터한 개수를 들고옴)
		return dept_num + "-" + String.format("%03d", cnt);
	}

	@Override
	public List<Users> getUsersList() throws Exception {
		return dao.getUsersList();
	}

	@Override
	public List<Users> searchName(String user_name) throws Exception {

		user_name = "%" + user_name + "%";
		
		return dao.searchName(user_name);
	}

	@Override
	public void joinAction(Users users) throws Exception {
		dao.join(users);
	}

	@Override
	public void deleteEmpAction(List<String> user_num) throws Exception {
		for(String item: user_num)
			dao.deleteEmp(item);
	}
	
	@Override
	public Users getEmployeeAction(String user_num) throws Exception {
		return dao.getEmployee(user_num);
	}
	
	@Override
	public void updateEmp(Users users) throws Exception {
		dao.updateEmp(users);
	}

	@Override
	public void addDeptAction(Department department) throws Exception {
		dao.addDept(department);
	}

	@Override
	public void UpdateDeptAction(Department department) throws Exception {
		dao.updateDept(department);
	}

	@Override
	public void DeleteDeptAction(Department department) throws Exception {
		dao.deleteDept(department);
	}

	@Override
	public List<Department> searchDeptAction(String dept_name) throws Exception {
		
		dept_name = "%" + dept_name + "%";
		
		return dao.searchDept(dept_name);
	}

	@Override
	public List<Department> searchAuthTable(Department department) throws Exception {
		return dao.searchAuthTable(department);
	}

	@Override
	public void auth_updateAction(Department department) throws Exception {
		// 권한 수정 기능
		dao.auth_update(department);
	}




	
}
