package com.kh.wingddy.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wingddy.member.model.service.MemberService;
import com.kh.wingddy.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m
									,ModelAndView mv
									,HttpSession session) {
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		} else {
			session.setAttribute("alertMsg", "로그인실패");
			mv.setViewName("redirect:/");
		}
		return mv;
	}
}
