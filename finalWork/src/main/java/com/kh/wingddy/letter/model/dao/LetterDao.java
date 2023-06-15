package com.kh.wingddy.letter.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.letter.model.vo.Letter;

@Repository
public class LetterDao {
	
	public ArrayList<Letter> ajaxReceivedLetter(SqlSessionTemplate session, Letter letter) {
		return (ArrayList)session.selectList("letterMapper.ajaxReceivedLetter", letter);
	
	}
	
	
	public ArrayList<Letter> ajaxSentLetter(SqlSessionTemplate session, Letter letter) {
		return (ArrayList)session.selectList("letterMapper.ajaxSentLetter", letter);
	}


}
