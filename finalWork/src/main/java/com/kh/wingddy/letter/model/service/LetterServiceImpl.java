package com.kh.wingddy.letter.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.letter.model.dao.LetterDao;
import com.kh.wingddy.letter.model.vo.Letter;

@Service
public class LetterServiceImpl implements LetterService{

	
	@Autowired
	private LetterDao letterDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int receviedCount(Letter letter) {
		
		return letterDao.receviedCount(sqlSession, letter);
	}
	
	@Override
	public int sentCount(Letter letter) {
		
		return letterDao.sentCount(sqlSession, letter);
	}
	
	
	@Override
	public ArrayList<Letter> ajaxReceivedLetter(Letter letter, PageInfo pi) {
		return letterDao.ajaxReceivedLetter(sqlSession, letter, pi);
	}
	

	@Override
	public ArrayList<Letter> ajaxSentLetter(Letter letter, PageInfo pi) {
		
		return letterDao.ajaxSentLetter(sqlSession, letter, pi);
	}

	@Override
	public ArrayList<Letter> selectRecipient(int cno) {
		return letterDao.selectRecipient(sqlSession, cno);
	
	}



	@Override
	public Integer selectMymanitto(Letter letter) {
		return letterDao.selectMymanitto(sqlSession, letter);
	}

	@Override
	public Integer selectMymanitti(Letter letter) {
		return letterDao.selectMymanitti(sqlSession, letter);
	}


	
	@Override
	public int insertLetter(Letter letter) {
		return letterDao.insertLetter(sqlSession, letter);
	}
	
}
