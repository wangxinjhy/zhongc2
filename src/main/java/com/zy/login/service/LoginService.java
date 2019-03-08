package com.zy.login.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.zy.login.pojo.Login;

public interface LoginService {

	Map<String, Object> login(HttpSession session, Login login);

}
