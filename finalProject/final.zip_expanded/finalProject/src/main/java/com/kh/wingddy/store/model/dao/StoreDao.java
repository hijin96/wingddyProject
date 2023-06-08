package com.kh.wingddy.store.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.store.model.vo.Store;
@Repository
public class StoreDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("storeMapper.selectListCount");
	}
	public ArrayList<Store> selectList(SqlSessionTemplate sqlSession, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage()-1)*pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pageInfo.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("storeMapper.selectList", null, rowBounds);
	}
	public int insertStoreBoard(SqlSessionTemplate sqlSession,List<Map<Store, Attachment>> paramList) {
		// TODO Auto-generated method stub
		System.out.println("DAO paramList"+paramList);
		return sqlSession.insert("storeMapper.insertStoreBoard",paramList);
	}
}
