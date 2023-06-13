package com.kh.wingddy.alphabetMarket.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wingddy.alphabetMarket.model.dao.AlphabetDao;
import com.kh.wingddy.alphabetMarket.model.vo.Alphabet;
import com.kh.wingddy.alphabetMarket.model.vo.AlphabetMarket;
import com.kh.wingddy.alphabetMarket.model.vo.ChangeAlphabet;
import com.kh.wingddy.alphabetMarket.model.vo.MarketReply;
import com.kh.wingddy.alphabetMarket.model.vo.MyCount;
import com.kh.wingddy.alphabetMarket.model.vo.Words;
import com.kh.wingddy.common.model.vo.PageInfo;

@Service
public class AlphabetServiceImpl implements AlphabetService {
	
	@Autowired
	private AlphabetDao alphabetDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<AlphabetMarket> ajaxSelectMarketList(AlphabetMarket am) {
		
		return alphabetDao.ajaxSelectMarketList(sqlSession, am);
	}

	
	@Override
	public AlphabetMarket marketDetail(int bno) {
		return alphabetDao.marketDetail(sqlSession, bno);
	}

	
	@Override
	public ArrayList<MarketReply> ajaxReplyList(PageInfo pi, int bno) {
		return alphabetDao.ajaxReplyList(sqlSession, pi, bno);
	}
	
	
	@Override
	public int replyCount(int bno) {
		return alphabetDao.replyCount(sqlSession, bno);
	}
	

	@Override
	public ArrayList<AlphabetMarket> selectCategory(Alphabet ap) {
		
		return alphabetDao.selectCategory(sqlSession, ap);
	}

	@Override
	public int insertMarket(AlphabetMarket am) {
		
		return alphabetDao.insertMarket(sqlSession, am);
		
	}
	

	@Override
	public int ajaxInsertReply(MarketReply mr) {
		return alphabetDao.ajaxInsertReply(sqlSession, mr);
	}
	
	
	
	@Override
	public String ajaxChangeAlphabet(ChangeAlphabet ca) {
		
		String check = alphabetDao.checkAlphabet(sqlSession, ca);
		
		
		if(check.equals("checkOK")) {
			if(alphabetDao.updateMarketWriterAlphabet(sqlSession, ca) > 0){
				alphabetDao.updateReplyAlphabet(sqlSession, ca);
				
				if(alphabetDao.changeMarketStatus(sqlSession, ca) + alphabetDao.changeReplyStatus(sqlSession, ca) == 2) {
					return "statusSuccess";
				}else {
					return "statusFail";
				}
				
			}else{
				return "changeFail";
			}
		}else {
			return check;
		}

	}
	
	@Override
	public int writerLastMarket(AlphabetMarket am) {
		
		return alphabetDao.writerLastMarket(sqlSession, am);
	}
	
	
	@Override
	public MyCount ajaxMyCount(MyCount mc) {

		
		return alphabetDao.ajaxMyCount(sqlSession, mc);
	}
	

	@Override
	public String ajaxGachaAlphabet(Alphabet ap) {
		
		if (alphabetDao.insertAlphabet(sqlSession, ap) + alphabetDao.updateMyCount(sqlSession, ap) == 2) {
			return "success";
		}else {
			return "fail";
		}

	}
	
	
	@Override
	public String insertWords(Words wd) {
		
		if(alphabetDao.checkWords(sqlSession, wd) > 0) {
			alphabetDao.updateMyCoupon(sqlSession, wd);
			alphabetDao.deleteAlphabet(sqlSession, wd);
		}
		
		return null;
	}

	
	
	
	
	
	
	
	









	





}
