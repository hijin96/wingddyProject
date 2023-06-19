package com.kh.wingddy.letter.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.letter.model.vo.Letter;

@Repository
public class LetterDao {
	

	public int receviedCount(SqlSessionTemplate session, Letter letter) {
		
		return session.selectOne("letterMapper.receviedCount", letter);
	}
	

	public int sentCount(SqlSessionTemplate session, Letter letter) {
		
		return session.selectOne("letterMapper.sentCount", letter);
	}
	
	
	
	public ArrayList<Letter> ajaxReceivedLetter(SqlSessionTemplate session, Letter letter, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)session.selectList("letterMapper.ajaxReceivedLetter", letter, rowBounds);
	
	}
	
	
	public ArrayList<Letter> ajaxSentLetter(SqlSessionTemplate session, Letter letter, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)session.selectList("letterMapper.ajaxSentLetter", letter, rowBounds);
	}
	
	public ArrayList<Letter> selectRecipient(SqlSessionTemplate session, int cno){
		
		return (ArrayList)session.selectList("letterMapper.selectRecipient", cno);
	}


	public int insertLetter(SqlSessionTemplate session, Letter letter) {
		
		return session.insert("letterMapper.insertLetter", letter);
	}
	
	
	public Integer selectMymanitto(SqlSessionTemplate session, Letter letter) {
		
		
		return session.selectOne("letterMapper.selectMymanitto", letter);

	}
	
	public Integer selectMymanitti(SqlSessionTemplate session, Letter letter) {
		
		return session.selectOne("letterMapper.selectMymanitti", letter);

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
