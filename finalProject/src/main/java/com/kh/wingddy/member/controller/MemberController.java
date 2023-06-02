package com.kh.wingddy.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wingddy.member.model.service.MemberService;
import com.kh.wingddy.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m
									,ModelAndView mv
									,HttpSession session) {
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			//System.out.println(bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd()));
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("sideBar/sideBar");
		} else {
			session.setAttribute("alertMsg", "로그인실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("loginForm.me")
	public String loginForm() {
		
		return "common/loginForm";
	}
	
	@RequestMapping("logout.me")
	public String logout(HttpSession session) {
		session.invalidate();
		return "sideBar/sideBar";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "common/enrollForm";
	}
	
	@RequestMapping("enrollMember.me")
	public String insertMember(Member m, Model model) {
		
		System.out.println("평문 : " + m.getMemberPwd());
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		
		System.out.println(encPwd);
		
		m.setMemberPwd(encPwd);
		
		return memberService.insertMember(m) > 0 ? "sideBar/sideBar":"common/errorPage";
	}
	
	@RequestMapping("errorPage.me")
	public String error() {
		return "common/errorPage";
	}
	
}
