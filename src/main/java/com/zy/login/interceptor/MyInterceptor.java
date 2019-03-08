package com.zy.login.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		//获取请求路径
		String path=request.getRequestURI();
		if (path.indexOf("/login/")!=-1) {
			//包含/login  不拦截
			return true;
		} else {
			Object object=request.getSession().getAttribute("user");
			if (object!=null) {//登录的用户 在session中有状态， 即登录用户存在    不 拦截
				return true;
			}
		}
		//否则的话拦截  return false  并且重定向到登录页面
		response.sendRedirect(request.getContextPath()+"/login.jsp");
		return false;
	}

}
