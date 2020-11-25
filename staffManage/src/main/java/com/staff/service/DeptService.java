package com.staff.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.staff.bean.Dept;
import com.staff.bean.Employee;
import com.staff.dao.DeptMapper;

@Service
public class DeptService {
	@Autowired
	DeptMapper deptMapper;

	
	// 查询所有岗位
	public List<Dept> getDeptAll() {
		// TODO Auto-generated method stub
		return deptMapper.selectByExample(null);
	}
	
	// 查询岗位
	public Dept getDept(String name) {
		// TODO Auto-generated method stub
		Dept dept = deptMapper.selectByDname(name);
		return dept;
	}
	
	// 修改岗位
	public boolean updateDept(Dept dept) {
		// TODO Auto-generated method stub
		deptMapper.updateByPrimaryKey(dept);
		return true;
	}

	// 删除岗位
	public boolean deleteDept(Dept dept) {
		// TODO Auto-generated method stub
		deptMapper.deleteByPrimaryKey(dept.getDid());
		return true;
	}

}