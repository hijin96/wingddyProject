package com.kh.wingddy.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.template.RenameFile;
import com.kh.wingddy.member.model.service.MemberService;
import com.kh.wingddy.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	private RenameFile renameFile = new RenameFile();
	
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
	public String insertMember(Member m,
							   MultipartFile upfile,
							   HttpSession session,
							   Model model) {
		
		System.out.println("평문 : " + m.getMemberPwd());
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			/*
			 * memberType = S, T
			 * t의 경우 multipart 처리하여 insert되게끔 받아야함
			 * 관리자의 승인이 필요하고 기본적으론 s타입으로 insert되야함
			 * s의 경우 member객체만 받아서 회원가입처리
			 */
			String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
			m.setMemberPwd(encPwd);
			m.setMemberType("T");
			
			//System.out.println(encPwd);
			String changeName = renameFile.fileName(upfile, session);
			
			Attachment at = new Attachment();
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName(changeName);
			at.setFileLevel(1);
			at.setFilePath("resources/uploadFiles/" + changeName);
			
			System.out.println("나는 선생" + m);
			System.out.println("나는 첨부" + at);
			return memberService.insertTeacher(m, at) > 0 ? "sideBar/sideBar":"common/errorPage";
		} else {
			
			String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
			m.setMemberPwd(encPwd);
			m.setMemberType("S");
			
			System.out.println("나는 학생" + m);
			return memberService.insertMember(m) > 0 ? "sideBar/sideBar":"common/errorPage";
		}
	}
	
	@RequestMapping("errorPage.me")
	public String error() {
		return "common/errorPage";
	}
	
}
