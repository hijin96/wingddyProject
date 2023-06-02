package com.kh.wingddy.member.model.service;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.member.model.vo.Member;

public interface MemberService {

	// 회원 로그인 메소드 (select)
	// 로그인시 받은 member 객체 (ID, PWD) 비밀번호는 DB에 저장된 암호화된 비밀번호의 salt값을 비교
	public Member loginMember(Member m);
	
	// 회원 회원가입 메소드 (insert member, attachment) 
	// 회원가입 종류(NAVER, KAKAO, GOOGLE, WINGDDY 중 WINGDDY 회원의 경우만 해당)
	public int insertMember(Member m);
	
	public int insertTeacher(Member m, Attachment at);
	
	// 회원 아이디 찾기 (이메일 인증) select  
	// 이메일 인증 성공시 DB에 저장되있는 회원의 ID값 출력
	 
	// 회원 비밀번호 찾기 (이메일 인증) select -> update(비밀번호 재설정)
	// 이메일 인증 성공시 비밀번호 변경을 위한 form제공 이후 변경된 비밀번호 암호화해 DB저장
	
	// 회원 정보 수정(이메일인증) (update member, attachment)
	// memberType = W 인 멤버한에서 프로필사진, 비밀번호수정, 이름, 전화번호, 이메일인증시  
	
	// AJAX 회원 회원가입 아이디 중복체크(select)
	// 회원가입 시 아이디 중복체크를 위한 5자 이상부터 회원 중복체크 여부 확인
	// 중복없이 진행 후 아이디 사용 체크 확인 -> 확인시 readonly로 아이디 막아주고
	// 회원가입 진행 
}
