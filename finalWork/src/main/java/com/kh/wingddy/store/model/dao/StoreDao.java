package com.kh.wingddy.store.model.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.common.model.vo.Attachment;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.RenameFile;
import com.kh.wingddy.store.model.vo.Cart;
import com.kh.wingddy.store.model.vo.Order;
import com.kh.wingddy.store.model.vo.Store;

@Repository
public class StoreDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("storeMapper.selectListCount");
	}

	public ArrayList<Store> selectList(SqlSessionTemplate sqlSession, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getBoardLimit());
		// System.out.println(
		// (ArrayList)sqlSession.selectList("storeMapper.selectList",null, rowBounds));
		return (ArrayList) sqlSession.selectList("storeMapper.selectList", null, rowBounds);
	}

	public int insertStoreBoard(SqlSessionTemplate sqlSession, Attachment at, Store s) {
		if (sqlSession.insert("storeMapper.insertStoreAttachment", at) > 0) {
			return sqlSession.insert("storeMapper.insertStore", s);
		}
		return 0;
	}

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

	public int checkStoreCart(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.selectOne("storeMapper.checkStoreCart", cart);
	}

	public int insertStoreCart(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.insert("storeMapper.insertStoreCart", cart);
	}

	public int updateStoreCart(SqlSessionTemplate sqlSession, Cart cart) {

		return sqlSession.update("storeMapper.updateStoreCart", cart);
	}

	public int deleteStoreCart(SqlSessionTemplate sqlSession, Cart cart) {

		return sqlSession.delete("storeMapper.deleteStoreCart", cart);
	}

	public ArrayList<Cart> selectStoreCart(SqlSessionTemplate sqlSession, int MemberNo) {
		//ArrayList<Cart> list = (ArrayList)sqlSession.selectList("storeMapper.selectStoreCart", MemberNo);
		//System.out.println("dao result : " + list);
		return  (ArrayList)sqlSession.selectList("storeMapper.selectStoreCart", MemberNo);
	}

	public int createOrderNo(SqlSessionTemplate sqlSession, Order order) {
		return sqlSession.insert("storeMapper.createOrderNo", order);
	}

	public int OrderInformation(SqlSessionTemplate sqlSession, Order order) {

		return sqlSession.update("storeMapper.orderInfomation", order);
	}
	//구매하기 페이지에서 구매할 목록만 가져가기
	public ArrayList<Cart> buyCartSelect(SqlSessionTemplate sqlSession, String[] cartNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.buyCartSelect", cartNo);
		
	}
	//마지막 구매번호 알아내기
	public int checkedOrderNo(SqlSessionTemplate sqlSession) {
	
		return sqlSession.selectOne("storeMapper.checkedOrderNo");
	}
	//구매완료
	public int storeBuySuccess(SqlSessionTemplate sqlSession,Order order) {
		int success= sqlSession.update("storeMapper.storeBuySuccess",order);
		System.out.println("dao: " + success);
		return success;
	}

	public int orderSuccessUpdateCart(SqlSessionTemplate sqlSession, ArrayList<HashMap<String, Object>> list) {
		
		for(int i=0; i<list.size(); i++) {
		System.out.println("dao리스트에서확인: "+ list.get(i));
		System.out.println("daokey: "+ list.get(i).keySet());
		}
		 
		 //int success =sqlSession.update("storeMapper.orderSuccess",list);
		 //System.out.println("DAO됐음좋겠어요: " + success);
		 return sqlSession.update("storeMapper.orderSuccess",list);
	}
	//구매정보 한번에 insert
	public int orderAllSuccess(SqlSessionTemplate sqlSession, Order order) {
		return sqlSession.insert("storeMapper.orderAllSuccess",order);
	}
	
	//map안에 arryalist으로 가져가서 업데이트 해보기
	public int orderCartUpdate(SqlSessionTemplate sqlSession, ArrayList<HashMap<String, Object>> listAll) {
		// TODO Auto-generated method stub
		System.out.println("dao orderCartUpdate: " + listAll);
		int success = sqlSession.update("storeMapper.orderCartUpdate",listAll);
		System.out.println("dao ArrayList: "+ success);
		return success;
	}



}
