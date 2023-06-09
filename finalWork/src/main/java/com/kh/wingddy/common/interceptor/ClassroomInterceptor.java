package com.kh.wingddy.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.wingddy.classroom.model.service.ClassroomService;

public class ClassroomInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private ClassroomService classroomService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object Handler, ModelAndView mv){
		mv.addObject("classroom", classroomService.selectClassroom(Integer.parseInt(request.getParameter("cno"))));
	}
}
