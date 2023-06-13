package com.kh.wingddy.couponProduct.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CouponProductDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.selectOne("");
		
	}
}
