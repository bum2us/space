package com.space.infra.common.interception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class checkLoginInterception extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		 if (request.getSession().getAttribute("sessSeq") != null) {
			 //by pass
		 } else { 
			 response.sendRedirect("/");
		 
			 System.out.println("로그인세션 없이는 접근 불가능한 페이지입니다. servlet-context.xml파일에 추가해주세요["+ request.getServletPath()+"]");
			 
			 return false; 
		 }
		 return super.preHandle(request, response, handler);
	}

	
	
}
