package com.kh.wingddy.alphabetMarket.model.service;

import java.util.ArrayList;

import com.kh.wingddy.alphabetMarket.model.vo.AlphabetMarket;
import com.kh.wingddy.alphabetMarket.model.vo.MarketReply;
import com.kh.wingddy.common.model.vo.PageInfo;

public interface AlphabetService {
	
	// 알파벳 마켓 메인화면 리스트
	ArrayList<AlphabetMarket> ajaxSelectMarketList(AlphabetMarket am);

	
	// 알파벳 마켓 디테일
	AlphabetMarket marketDetail(int bno);
	
	// 댓글 총 개수
	public int replyCount(int bno); 

	// 마켓 댓글 리스트조회
	ArrayList<MarketReply> ajaxReplyList(PageInfo pi, int bno);
	
	
	// 알파벳 마켓 작성시 자기 알파벳 셀렉트
	ArrayList<AlphabetMarket> selectCategory();
	
	
	// 알파벳 마켓 글 작성
	int insertMarket(AlphabetMarket am);
	
	
	// 마켓 글 삭제
	int deleteMarket(int marketBno);

	
	// 마켓 거래시 해당 알파벳 소유 여부 확인
	int alphabet(AlphabetMarket am); // writer, alphabet
	
	
	// 마켓 댓글 리스트 불러오기
	int ajaxSelectReply(int marketBno);
	
	// 마켓 댓글 작성
	int ajaxInsertReply(int marketBno);
	
	
	// 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
