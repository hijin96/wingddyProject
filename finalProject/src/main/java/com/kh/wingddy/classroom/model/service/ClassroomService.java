package com.kh.wingddy.classroom.model.service;

public interface ClassroomService {

	/* 공통 */
	// 내 클래스 리스트 조회 (SELECT)
	
	// 클래스 메인페이지
	// 현재 클래스에 등록된 과제 조회 X (education)
	// 클래스 내 학생 쿠폰 랭킹 조회 X 
	
	/* 선생님 */
	// 클래스룸 생성(INSERT)
	// - 랜덤키 생성 (controller)
	// 학생 입장 수락 (UPDATE)
	// 학생 입장 거절 (DELETE)
	
	// 선생님 클래스 메인페이지 
	// 클래스 입장 요청 학생 리스트 조회 (SELECT)
	// 클래스 입장 코드 조회 (SELECT)
	
	// 학생관리 페이지
	// 클래스 내 학생 리스트 조회 (SELECT)
	// - 과제 참여율 조회 (SELECT)
	// 학생 클래스 추방 (DELETE)
	// 학생에게 뽑기 횟수 부여 X (UPDATE)
	
	/* 학생 */
	// 클래스룸 입장 신청
	// 입장코드로 클래스 정보 조회 (SELECT)
	
	// 학생 클래스 메인페이지
	// 나의 마니또 조회(SELECT)
	// 현재 클래스 쿠폰 스토어 상품 N개 조회 (SELECT)
	// 현재 클래스 내가 가진 알파벳 리스트 조회 (SELECT)
	// 현재 클래스 내가 가진 보유 쿠폰 수 조회 (SELECT)
}
