package com.kh.wingddy.alphabetMarket.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.alphabetMarket.model.vo.AlphabetMarket;

@Repository
public class AlphabetDao {
	
	public ArrayList<AlphabetMarket> ajaxSelectMarketList(SqlSessionTemplate sqlSession, AlphabetMarket am){
		
		return (ArrayList)sqlSession.selectList("alphabetMapper.selectList", am);
	}

	
	public AlphabetMarket marketDetail(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("alphabetMapper.selectDetail", bno);
	}
}
