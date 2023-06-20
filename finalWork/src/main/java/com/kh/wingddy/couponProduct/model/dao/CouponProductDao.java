package com.kh.wingddy.couponProduct.model.dao;

import java.util.ArrayList;
import java.util.List;

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
		
		System.out.println(cp);
		if(cp.getOrderBy().equals("coupon_price asc")) {
			return (ArrayList)sqlSession.selectList("coupon-mapper.selectCpList", cp, rowbounds);
		} else if(cp.getOrderBy().equals("coupon_price desc")) {
			return (ArrayList)sqlSession.selectList("coupon-mapper.selectCpList_desc", cp, rowbounds);
		} else {
			return (ArrayList)sqlSession.selectList("coupon-mapper.selectCpList_amount", cp, rowbounds);
		}
	}
	
	public int insertMyCp(SqlSessionTemplate sqlSession, List<CouponProduct> cpList) {
		return sqlSession.insert("coupon-mapper.insertMyCp", cpList);
	}

	/*
	public int updateCp(SqlSessionTemplate sqlSession, CouponProduct cp) {
		
	}
	
	public int updateCoupon(SqlSessionTemplate sqlSession, CouponProduct cp) {
		
	}
	*/
}
