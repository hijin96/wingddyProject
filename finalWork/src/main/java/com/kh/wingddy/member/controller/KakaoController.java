package com.kh.wingddy.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.template.RenameFile;
import com.kh.wingddy.member.model.service.KakaoService;
import com.kh.wingddy.member.model.service.MemberService;
import com.kh.wingddy.member.model.vo.Member;

@Controller
public class KakaoController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private KakaoService kakaoService;
	
	
	private RenameFile renameFile = new RenameFile();
	
	@GetMapping("kakaoLogin.me")
	public ModelAndView kakaoLogin(@RequestParam String code, ModelAndView mv, HttpSession session) throws IOException {
		
		//System.out.println(code);
		String accessToken = kakaoService.getKakaoToken(code);
		Map<String, Object> userInfo = kakaoService.getUserInfo(accessToken);
		Member m = new Member();
		m.setMemberId((String)userInfo.get("id"));
		m.setEmail((String)userInfo.get("email"));
		m.setLoginType("K");
		Member loginUser = memberService.loginMember(m);
		if(loginUser != null) {
			System.out.println("로그인 성공된 멤버 : " + loginUser);
			session.setAttribute("accessToken", accessToken);
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("alertMsg", "회원정보가 없는 계정입니다 회원가입하시겠습니까?");
			mv.addObject("enrollKakao", m);
			mv.setViewName("member/kakaoLoginForm");
		}
		return mv;
	}
	
	@PostMapping("enrollKakao.me")
	public ModelAndView kakaoEnroll(Member m
								    ,ModelAndView mv
								    ,MultipartFile upfile
								    ,HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			m.setMemberType("T");
			
			String changeName = renameFile.fileName(upfile, session);
			Attachment at = new Attachment();
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName(changeName);
			at.setFileLevel(1);
			at.setFilePath("resources/uploadFiles/" + changeName);
			
			System.out.println("Teacher : " + m);
			System.out.println("Attachment : " + at);
			
			if(memberService.insertTeacher(m, at) > 0) {
				session.setAttribute("loginUser", m);
				mv.addObject("alertMsg", "정상적으로 회원가입되었습니다");
				mv.setViewName("redirect:/");
			} else {
				mv.addObject("alertMsg", "회원가입 실패!");
				mv.setViewName("common/loginForm");
			}
		} else {
			
			m.setMemberType("S");
			System.out.println("Student : " + m);
			if(memberService.insertMember(m) > 0) {
				session.setAttribute("loginUser", m);
				mv.addObject("alertMsg", "정상적으로 회원가입되었습니다");
				mv.setViewName("redirect:/");
			} else {
				mv.addObject("alertMsg", "회원가입 실패!");
				mv.setViewName("common/loginForm");
			}
		}
		return mv;
	}
	
	@PostMapping("logoutKakao.me")
	public String logoutKakao(HttpSession session) throws IOException {
		
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		String logoutUser = kakaoService.logoutKakao(memberId);
		System.out.println(logoutUser);
		
		if(logoutUser == null) {
			session.setAttribute("alertMsg", "카카오 로그아웃 실패");
			return "common/loginForm";
		}
		
		session.invalidate();
		return "redirect:/";
	}
}
