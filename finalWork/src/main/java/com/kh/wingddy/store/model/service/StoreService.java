package com.kh.wingddy.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.store.model.vo.Store;

public interface StoreService {
	
	//게시글 총 개수 조회
	int selectListCount();
	
	//게시글 리스트 조회
	ArrayList<Store> selectList(PageInfo pageInfo,ArrayList<HashMap<String, Object>> list);
	
	//조회수 증가하면 글보기 성공
	int inceraseCount(int spNo);
	//게시글 작성하기-1 글정보만
	int insertStoreText(HashMap<String,Object> jsonstore);
	//게시글 작성하기-2
	int insertStoreBoard(Store s,Attachment at);
	//썸네일 번호 생성
	int createFileNo();
	
	//int insertStoreBoard(Store s);

	//게시글 수정하기
	int updateStoreBoard(int spNo);
	//게시글 삭제하기
	int deltetStoreBoard(int spNo);
	//게시글 상세보기
	Store selectStoreBoard(int spNo);
	//댓글리스트 조회
	//댓글 작성하기 
	//댓글 수정하기
	//댓글 삭제하기
	//장바구니추가
	//장바구니 목록보기
	//장바구니 삭제
	//위시리스트 추가 및 삭제
	//위시리스트 목록보기
	//결제(insert)
	//게시글 작성하기

	
	
	
	
	

}
