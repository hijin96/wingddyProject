package com.kh.wingddy.voca.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.wingddy.member.model.vo.Member;
import com.kh.wingddy.voca.model.vo.ClassVocaBook;
import com.kh.wingddy.voca.model.vo.Voca;
import com.kh.wingddy.voca.model.vo.VocaBook;

public interface VocaService {

	/* 공통 */
	// 단어장 페이지
	// 내 단어장 리스트 조회(SELECT)
	ArrayList<VocaBook> selectVocaBookList(int memNo);
	// 단어장 단어 리스트 조회(SELECT)
	ArrayList<Voca> selectVocaList(int bookNo);
	// 내 클래스별 단어장 리스트 조회(SELECT)
	ArrayList<ClassVocaBook> selectClassVocaBookList(Member m);
	// 단어장 삭제(UPDATE)
	int deleteVocaBook(int bookNo);
	
	// 단어장 등록 페이지
	// 단어장 등록(INSERT)
	// - 단어장 생성(INSERT)
	// - 단어 등록(INSERT)
	int insertVocaBook(VocaBook vb, ArrayList<Voca> vlist);
	
	// 단어 검색
	// 파파고 검색 (controller)
	// 영어 or 한글 포함하는 단어들 조회 (SELECT)
	ArrayList<Voca> searchVoca(String text);
	
	// 단어장 수정 페이지
	// 단어장 수정(UPDATE)
	// - 단어 삭제(DELETE)
	int updateVocaBook(HashMap<String, Object> vb);
	
	/* 선생님 */
	
	// 클래스 단어장 등록 페이지
	// - 내 클래스 리스트 조회(SELECT) ClassRoomService에 selectClassList
	// 클래스 단어장 추가 및 수정(INSERT)
	int insertClassBook(ArrayList<ClassVocaBook> cvList);
	// 클래스 단어장 삭제
	int deleteClassBook(int bookNo);
	
	
	// 클래스 단어장 수정 페이지
	// - 단어장 정보 조회(SELECT)
	// - 내 클래스 리스트 조회(SELECT) ClassRoomService에 selectClassList
	// - 선택 단어장의 소속 클래스 리스트 조회(SELECT)
	ArrayList<ClassVocaBook> selectBookClassList(int bookNo);
	
	/* 학생 */
	
	// 단어장 등록 페이지
	// 단어장 단어 리스트 조회(있음)
	// 학생번호로 클래스단어장 리스트 조회(SELECT)
	
	
}
