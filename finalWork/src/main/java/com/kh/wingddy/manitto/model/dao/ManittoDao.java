package com.kh.wingddy.manitto.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.manitto.model.vo.Manitto;

@Repository
public class ManittoDao {
	
	public ArrayList selectStudentNo(SqlSession session, Manitto mt) {
		
		return (ArrayList)session.selectList("manittoMapper.selectStudentNo", mt);
	}
	
	
	public int insertMatchingResult(SqlSession session, Manitto mt) {
		
		return session.insert("manittoMapper.insertMatchingResult", mt);
	}
	
	
	public ArrayList<Manitto> selectManittoList(SqlSession session, int classNo){
		
		return (ArrayList)session.selectList("manittoMapper.selectManittoList", classNo);
	}


}
