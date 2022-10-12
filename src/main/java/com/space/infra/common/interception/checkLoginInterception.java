package com.space.infra.common.interception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class checkLoginInterception extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		/*
		 * if(request.getSession().getAttribute("sessSeq") != null) {
		 * 
		 * }else { response.sendRedirect("/administrator");
		 * System.out.println("intercepter go url : /administrator"); return false; }
		 */
		return super.preHandle(request, response, handler);
	}

	
	
}
