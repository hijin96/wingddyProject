package com.kh.wingddy.alphabetMarket.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.alphabetMarket.controller.AlphabetController;
import com.kh.wingddy.alphabetMarket.model.vo.Alphabet;
import com.kh.wingddy.alphabetMarket.model.vo.AlphabetMarket;
import com.kh.wingddy.alphabetMarket.model.vo.ChangeAlphabet;
import com.kh.wingddy.alphabetMarket.model.vo.MarketReply;
import com.kh.wingddy.common.model.vo.PageInfo;

@Repository
public class AlphabetDao {
	
	public ArrayList<AlphabetMarket> ajaxSelectMarketList(SqlSessionTemplate sqlSession, AlphabetMarket am){

		
		
		if(am.getAlphabet() == null && am.getSellingStatus() != null) {
			return (ArrayList)sqlSession.selectList("alphabetMapper.selectListOnlySellingStatus", am);
		
			
		}else if(am.getAlphabet() != null && am.getSellingStatus() == null) {
			return (ArrayList)sqlSession.selectList("alphabetMapper.selectListOnlyAlphabet", am);
			
		}else if(am.getAlphabet() == null && am.getSellingStatus() == null) {
			return (ArrayList)sqlSession.selectList("alphabetMapper.selectListNoneFilter", am);
			
		}else {
			return (ArrayList)sqlSession.selectList("alphabetMapper.selectListAllFilters", am);
			
		}
		
		
	}

	
	public AlphabetMarket marketDetail(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("alphabetMapper.selectDetail", bno);
	}
	
	
	
	public ArrayList<MarketReply> ajaxReplyList(SqlSessionTemplate sqlSession, PageInfo pi, int bno) {
		
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("alphabetMapper.selectReplyList", bno, rowBounds);
		
		
		
	}
	
	

	public int replyCount(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("alphabetMapper.replyCount", bno);
	}
	
	
	public int insertMarket(SqlSessionTemplate sqlSession, AlphabetMarket am) {

		return sqlSession.insert("alphabetMapper.insertMarket", am);
	};
	
	
	
	
	public ArrayList<AlphabetMarket> selectCategory(SqlSessionTemplate sqlSession, Alphabet ap){
		
		return (ArrayList)sqlSession.selectList("alphabetMapper.selectMyAlphabet", ap);
	}
	
	
	public int ajaxInsertReply(SqlSessionTemplate sqlSession, MarketReply mr) {
		return sqlSession.insert("alphabetMapper.insertReply", mr);
	}
	
	
	public int checkAlphabet(SqlSessionTemplate sqlSession, ChangeAlphabet ca) {
		
		sqlSession.selectOne("alphabetMapper.checkMarketWriterAlphabet", ca);
		sqlSession.selectOne("alphabetMapper.checkReplyAlphabet", ca);
		
		return 0;
	}
	
	
	//public int ajaxChangeAlphabet(SqlSessionTemplate sqlSession, ChangeAlphabet ca) {
		//return sqlSession.
	//}
	
	
	
	
	
	
	
	
}
