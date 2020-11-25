package com.staff.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.staff.bean.Dept;
import com.staff.bean.Notice;
import com.staff.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/getnotices")
	@ResponseBody
	public List<Notice> getDept() {
//		PageHelper.startPage(1, 5);
		List<Notice> notice = noticeService.getNoticeAll();
		// 使用PageInfo包装查询后的结果，连续显示的页数为5
//		PageInfo pageInfo = new PageInfo(dept, 1);
//		return Msg.success().add("pageInfo", pageInfo);
		return notice;
	}
}
