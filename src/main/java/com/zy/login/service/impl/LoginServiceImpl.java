package com.zy.login.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.login.dao.LoginDao;
import com.zy.login.pojo.Login;
import com.zy.login.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginDao dao;

	@Override
	public Map<String, Object> login(HttpSession session, Login login) {
		Map<String,Object> map=new HashMap<>();
		//查询用户     看一下用户名是否存在 从而判断是会否可以登录成功
		Login user=dao.getLoginByUsername(login.getLusername());//根据用户名查询用户  user为数据库里的用户
		if (user!=null) {
			//说明用户已经存在，可以登录
			if (user.getLpassword().equals(login.getLpassword())) {
				//密码也正确，登入成功
				session.setAttribute("user", login);//使用session记录一下登入状态
				map.put("success", true);
				//map.put("msg", "登入成功");
				
			} else {
				map.put("success", false);
				map.put("msg", "密码错误");
			}
			
		} else {
				map.put("success", false);
				map.put("msg", "用户不存在");
		}
		return map;
		
	}
	
	
	
	
}
