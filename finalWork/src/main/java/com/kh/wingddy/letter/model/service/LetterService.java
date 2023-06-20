package com.kh.wingddy.letter.model.service;

import java.util.ArrayList;

import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.letter.model.vo.Letter;

public interface LetterService {
	
	// 받은 쪽지 총 갯수
	int receviedCount(Letter letter);
	
	// 받은 쪽지 총 갯수
	int sentCount(Letter letter);
	
	// 받은 메세지 리스트
	ArrayList<Letter> ajaxReceivedLetter(Letter letter, PageInfo pi);
	
	// 보낸 메세지 리스트
	ArrayList<Letter> ajaxSentLetter(Letter letter, PageInfo pi);

	// 수신자 카테고리
	ArrayList<Letter> selectRecipient(int cno);
	
	// 내 마니또 가져가기
	Integer selectMymanitto (Letter letter);
	
	// 내 마니띠 가져가기
	Integer selectMymanitti (Letter letter);
	
	// 쪽지 보내기
	int insertLetter (Letter letter);
	
	
	// 읽음 표시변경
	int changeReadStatus (Letter letter);
	
	// 쪽지 디테일
	Letter letterDetail (Letter letter);
	
	// 쪽지 선물 받기
	int getGift (Letter letter);
	
	// 안읽은 쪽지
	ArrayList<Letter> unReadLetter(int memberNo);
	
	
	// 모두 읽은 걸로
	int markAll(int memberNo);
	
	
	
	
	
	
	
	
}
