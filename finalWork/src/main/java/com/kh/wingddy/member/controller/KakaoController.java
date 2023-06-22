package com.kh.wingddy.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public ModelAndView kakaoLogin(@RequestParam String code, ModelAndView mv) throws IOException {
		
		//System.out.println(code);
		String accessToken = kakaoService.getKakaoToken(code);
		Map<String, Object> userInfo = kakaoService.getUserInfo(accessToken);
		Member m = new Member();
		m.setMemberId((String)userInfo.get("id"));
		m.setEmail((String)userInfo.get("email"));
		m.setLoginType("K");
		Member loginUser = memberService.loginMember(m);
		if(loginUser != null) {
			mv.addObject("loginUser", m);
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
			
			//memberService.insertTeacher(m, at);
		} else {
			
			
			m.setMemberType("S");
			System.out.println("Student : " + m);
			//memberService.insertMember(m);
		}
		
		
		return mv;
	}
}
