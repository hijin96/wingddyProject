package com.kh.wingddy.letter.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
		
		int result = letterDao.insertLetter(sqlSession, letter);
		
		if(!letter.getGift().equals("")) {
			result += letterDao.deleteAlphabet(sqlSession, letter);
		}
				
		return result;
	}

	@Override
	public int changeReadStatus(Letter letter) {

		return letterDao.changeReadStatus(sqlSession, letter);
	}
	
	@Override
	public Letter letterDetail(Letter letter) {
		return letterDao.letterDetail(sqlSession, letter);
	}

	@Override
	public int getGift(Letter letter) {
		
		// 쪽지 상태 선물 받음으로 변경		
		// 알파벳 인서트
		
		return letterDao.updateGetGift(sqlSession, letter) * letterDao.insertAlphabet(sqlSession, letter);
	}

	@Override
	public ArrayList<Letter> unReadLetter(int memberNo) {
		
		return letterDao.unReadLetter(sqlSession, memberNo);
	}

	@Override
	public int markAll(int memberNo) {
		return letterDao.markAll(sqlSession, memberNo);
	}

	@Override
	public int deleteLetter(Letter letter) {
		return letterDao.deleteLetter(sqlSession, letter);
	}

	
	
}
