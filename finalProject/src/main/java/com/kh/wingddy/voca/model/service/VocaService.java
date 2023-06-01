package com.kh.wingddy.voca.model.service;

import java.util.ArrayList;

import com.kh.wingddy.voca.model.vo.Voca;
import com.kh.wingddy.voca.model.vo.VocaBook;

public interface VocaService {

	/* 공통 */
	// 단어장 페이지
	// 내 단어장 리스트 조회(SELECT)
	ArrayList<VocaBook> selectVocaBookList(int memNo);
	// 단어장 단어 리스트 조회(SELECT)
	ArrayList<Voca> selectVocaList(int bookNo);
	// 단어장 삭제(UPDATE)
	
	// 단어장 등록 페이지
	// 단어장 등록(INSERT)
	// 파파고 검색 (controller)
	
	// 단어장 수정 페이지
	// 단어장 수정(UPDATE)
	// - 단어 삭제(DELETE)
	
	/* 선생님 */
	// 단어장의 소속 클래스 리스트 조회(SELECT)
	
	// 단어장 등록 페이지
	// - 내 클래스 리스트 조회(SELECT)
	// 영어 or 한글 포함하는 단어들 조회 (SELECT)
	
	// 단어장 수정 페이지
	// - 단어장 정보 조회(SELECT)
	// - 내 클래스 리스트 조회(있음)
	// - 단어장의 소속 클래스 리스트 조회(있음)
	
	/* 학생 */
	// 내 클래스 리스트 조회(SELECT)
	// 클래스 하위 단어장 리스트 조회(SELECT)
	
	// 단어장 등록 페이지
	// 단어장 단어 리스트 조회(있음)
	// 학생번호로 클래스단어장 리스트 조회(SELECT)
	
	
}
