package com.kh.wingddy.couponProduct.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.couponProduct.model.vo.CouponProduct;

@Repository
public class CouponProductDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.selectOne("coupon-mapper.selectListCount", classNo);
	}
	
	public ArrayList<CouponProduct> selectCouponProductList(SqlSessionTemplate sqlSession, PageInfo pi, CouponProduct cp){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("coupon-mapper.selectCouponProductList", cp, rowbounds);
	}
	
	
	
	
}
