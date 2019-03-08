package com.zy.login.dao;

import com.zy.login.pojo.Login;

public interface LoginDao {

	Login getLoginByUsername(String lusername);

}
