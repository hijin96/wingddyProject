package com.kh.wingddy.education.model.service;

import java.util.ArrayList;

import com.kh.wingddy.education.model.vo.EduProgress;
import com.kh.wingddy.education.model.vo.Quiz;

public interface EducationService {

	/* 공통 */
	// 학습 메인 페이지
	// 내 클래스 학습 리스트 조회 
	ArrayList<EduProgress> selectEduList(int cno);

	
	
	/* 선생님 */
	// 조기 마감 (Time 컬럼을 현재 시간으로 UPDATE)
	// (진행율이 100% 일때만 가능?)
	int updateEndTime(int eduNo);
	
	// 학습 조회
	ArrayList<Quiz> selectQuizList(int eduNo);
	
	// 학습 등록
	// case 1.단어 문제 등록 
	// (등록할 때 랜덤으로)(controller)
	// 내 단어장 리스트 조회(SELECT)(있음)
	// 뽑기횟수 등록(UPDATE) (내껀가?)
	// 등록 (INSERT)
	
	// case 2.배치 문제 등록 (INSERT)
	// 뽑기횟수 등록(UPDATE) (내껀가?)
	
	// case 3.OX퀴즈 등록 (INSERT)
	// 뽑기횟수 등록(UPDATE) (내껀가?)
	
	/* 학생  */
	// 학습 조회 및 풀기(퀴즈의 순번을 랜덤으로 조회, 모든 작업 완료 후 한번에 INSERT)
	// (화면단에서 시간 체크를 할것인가)
	// case 1.단어 문제 
	// 조회 (SELECT)
	// 풀기 (INSERT)
	
	// case 2.배치 문제
	// 조회 (SELECT) (조회 후 문장을 잘라서 화면에 뿌리기)
	// 풀기 (INSERT)
	
	// case 3.OX퀴즈 
	// 조회 (SELECT)
	// 풀기 (INSERT)
	
	// 오답 보기 (오답보기 창에서 비교해서 INSERT를 할까?)
	// case 1.단어 문제 조회
	// 정답 조회 (SELECT)
	// 오답 조회 (SELECT)
	
	// case 2.배치 문제 조회
	// 정답 조회 (SELECT)
	// 오답 조회 (SELECT)
	
	// case 3.OX퀴즈 조회
	// 정답 조회 (SELECT)
	// 오답 조회 (SELECT)
	
}
