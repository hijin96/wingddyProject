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

}
