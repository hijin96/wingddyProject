package com.kh.wingddy.letter.model.service;

import java.util.ArrayList;

import com.kh.wingddy.letter.model.vo.Letter;

public interface LetterService {
	
	// 받은 메세지 리스트
	ArrayList<Letter> ajaxReceivedLetter(Letter letter);
	
	// 보낸 메세지 리스트
	ArrayList<Letter> ajaxSentLetter(Letter letter);

}
