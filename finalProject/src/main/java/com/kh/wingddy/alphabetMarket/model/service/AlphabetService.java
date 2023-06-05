package com.kh.wingddy.alphabetMarket.model.service;

import java.util.ArrayList;

import com.kh.wingddy.alphabetMarket.model.vo.AlphabetMarket;

public interface AlphabetService {
	
	// 알파벳 마켓 메인화면 리스트
	ArrayList<AlphabetMarket> ajaxSelectMarketList(AlphabetMarket am); // classNo, alphabet

	// 알파벳 마켓 메인화면 리스트
	ArrayList<AlphabetMarket> ajaxSelectMarketListFilter(AlphabetMarket am); // classNo, alphabet
	
	
	// 알파벳 마켓 디테일
	AlphabetMarket marketDetail(int marketBno);
	
	
	// 알파벳 마켓 글 작성
	int marketInsert(AlphabetMarket am);
	
	
	// 마켓 글 삭제
	int marketInsert(int marketBno);

	
	// 마켓 거래시 해당 알파벳 소유 여부 확인
	int alphabet(AlphabetMarket am); // writer, alphabet
	
	
	// 마켓 댓글 리스트 불러오기
	int ajaxSelectReply(int marketBno);
	
	// 마켓 댓글 작성
	int ajaxInsertReply(int marketBno);
	
	
	// 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
