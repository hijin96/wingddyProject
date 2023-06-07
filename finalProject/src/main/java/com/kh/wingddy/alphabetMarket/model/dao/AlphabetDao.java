package com.kh.wingddy.alphabetMarket.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.alphabetMarket.model.vo.AlphabetMarket;
import com.kh.wingddy.alphabetMarket.model.vo.MarketReply;

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
	
	
	
	public ArrayList<MarketReply> ajaxReplyList(SqlSessionTemplate sqlSession, int bno) {
		
		return (ArrayList)sqlSession.selectList("alphabetMapper.selectReplyList", bno);
	}
	
}
