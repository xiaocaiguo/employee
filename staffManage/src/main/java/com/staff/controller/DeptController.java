package com.staff.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.staff.bean.Dept;
import com.staff.bean.Employee;
import com.staff.bean.Msg;
import com.staff.service.DeptService;

@Controller
public class DeptController {
	@Autowired
	DeptService deptService;
	
	@RequestMapping("/getdepts")
	@ResponseBody
	public List<Dept> getDept() {
//		PageHelper.startPage(1, 5);
		List<Dept> dept = deptService.getDeptAll();
		// 使用PageInfo包装查询后的结果，连续显示的页数为5
//		PageInfo pageInfo = new PageInfo(dept, 1);
//		return Msg.success().add("pageInfo", pageInfo);
		return dept;
	}
	
	//查询单个岗位数据
	@RequestMapping("/getdept")
	@ResponseBody
	public Msg getDept(String dname) {
	
		//从前端拿去搜索框的数据
		//String name；
		dname = "王老五";
		
		Dept dept = deptService.getDept(dname);
		System.out.println(dept.getDname());
		
		//将数据dept传回前台；
		return Msg.success().add("dept", dept);
		
	}
	
	//修改岗位数据
	@RequestMapping("/updatedept")
	@ResponseBody
	public Msg updateDept(Dept dept) {
	
		//从前端拿去搜索框的数据；
//			Employee emp = new Employee();
//			emp.setAge(18);
//			emp.setId("1003");
//			emp.setName("xiaocai");
//			emp.setSalary(10000.00);
		dept.setDid(1);
		dept.setDname("xiaoqiang");
		dept.setfId("1003");
		
		
		Boolean boolean1 = deptService.updateDept(dept);
		System.out.println(dept.getDname());
		System.out.println(boolean1);
		
		//将数据dept传回前台；
		return Msg.success().add("dept", dept);
		
	}
	
	//删除单个岗位数据
	@RequestMapping("/deletedept")
	@ResponseBody
	public Msg deleteDept(Dept dept) {
	
//			//从前端拿去搜索框的数据；
//			Employee emp = new Employee();
//			emp.setAge(18);
//			emp.setId("1014");
//			emp.setName("xiaocai");
//			emp.setSalary(10000.00);
		dept.setDid(23);
		
		
		
		Boolean boolean1 = deptService.deleteDept(dept);
		System.out.println(dept.getDname());
		System.out.println(boolean1);
		
		//将数据dept传回前台；
		return Msg.success().add("dept", dept);
		
	}
}

	
