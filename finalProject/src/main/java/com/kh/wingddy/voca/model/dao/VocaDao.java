package com.kh.wingddy.voca.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.voca.model.vo.VocaBook;

@Repository
public class VocaDao {

	public ArrayList<VocaBook> selectVocaBookList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("vocaMapper.selectVocaBookList", memNo);
	}

}
