package com.erp.service;

import java.util.List;

import com.erp.vo.Department;
import com.erp.vo.Supplier;

// user 공급처
public interface SupplierService {
	
	public List<Supplier> getSupplierList() throws Exception;
	
	public List<Supplier> searchSupplier(String supp_name) throws Exception;
	
	public void addSupplierAction(Supplier supplier) throws Exception;
	
	public void deleteSupplier(List<String> supp_id) throws Exception;
	
	public Supplier getSearchSupplier(String supp_id) throws Exception;
	
	public void updateSupplier(Supplier supplier) throws Exception; 
	
	public Department getAuth(String dept_num) throws Exception;

}
