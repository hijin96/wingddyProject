package com.kh.wingddy.member.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	
	// (WINGDDY)회원가입 진행 절차
	private int memberNo; 	     // 회원가입시 시퀀스넘버로 nextval
	private String memberId;     // 아이디 중복체크 -> AJAX
	private String memberPwd;    // 비밀번호 -> 비밀번호 재입력 (각각 입력한 비밀번호 동일한지 체크)
	private String memberName;   // 이름 -> (NOT NULL) 검색에 필요하기때문에 입력받도록 유도
	private String email;    	 // 전화번호 (NOT NULL) 입력하는 전화번호 없으면?
	private String phone; 	     // 이메일 (NOT NULL, UNIQUE) 이메일 인증을 통하여 입력받음 이메일이 없으면?
	private Date enrollDate;	 // 가입일자 -> SYSDATE
	private Date updatedate;	 // 수정시 입력될 필드
	private String memberType;   // 'S' , 'A' , 'T' 기본값 S = student 학생으로 기본적으로 insert 
	private String statusYN;     // 회원 탈퇴 여부 기본값 N
	private String loginType;    // 회원가입 유형 N = naver, K = kakao, G = google, W = wingddy 기본값 W
	private int couponCount;     
	private int gachaCount;
	// 프로필 -> 기본적으론 기본이미지가 자동 첨부 정보수정시 프로필을 수정시 update
	// 파일레벨  0 = 프로필, 1 = 재직증명서
	// 프로필 등록될시 member테이블 우선 등록, 이후 시퀀스 mno.currval, fno.nextval

}
