package com.staff.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {

	// 服务器处理的状态码 200=success 100=fail
	private int code;
	// 提示信息，主要用于显示错误原因
	private String msg;

	// 用户要返回给浏览器的数据
	private Map<String, Object> data = new HashMap();

	public static Msg success() {
		Msg result = new Msg();
		result.setCode(200);
		result.setMsg("处理成功");
		return result;
	}

	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("处理失败");
		return result;
	}

	public Msg add(String key, Object value) {
		this.getData().put(key, value);
		return this;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}

}