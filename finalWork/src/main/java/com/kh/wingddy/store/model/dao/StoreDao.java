package com.kh.wingddy.store.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.RenameFile;
import com.kh.wingddy.store.model.vo.Cart;
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
		//System.out.println( (ArrayList)sqlSession.selectList("storeMapper.selectList",null, rowBounds));
		return (ArrayList)sqlSession.selectList("storeMapper.selectList",null, rowBounds);
	}

	public int insertStoreBoard(SqlSessionTemplate sqlSession,Attachment at, Store s) {
		 
		  if(sqlSession.insert("storeMapper.insertStoreAttachment",at)>0) {
		return	sqlSession.insert("storeMapper.insertStore",s);
		}
		return 0;
	}

	/*
	 * public int insertStoreText(SqlSessionTemplate sqlSession, HashMap<String,
	 * Object> jsonstore) { Object spContent= jsonstore.values();
	 * jsonstore.getClass().getName(); if(
	 * sqlSession.insert("storeMapper.insertStoreText",jsonstore)>0) {
	 * //sqlSession.insert("storeMapper.insertThumnail",Attachment); } return
	 * sqlSession.insert("storeMapper.insertStoreText",jsonstore);
	 
	}*/
	public int createFileNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storeMapper.createFileNo");
	}
	public int inceraseCount(SqlSessionTemplate sqlSession, int spNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("storeMapper.inceraseCount", spNo);
	}

	public Store selectStoreBoard(SqlSessionTemplate sqlSession, int spNo) {
		return sqlSession.selectOne("storeMapper.selectStoreBoard", spNo);	
	}
	public int insertStoreCart(SqlSessionTemplate sqlSession, Store s, Cart cart) {
		
		return sqlSession.insert("storeMapper.insertStoreCart",cart);
	}
}
