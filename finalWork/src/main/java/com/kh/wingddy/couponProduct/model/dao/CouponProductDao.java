package com.kh.wingddy.couponProduct.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wingddy.common.model.vo.Attachment;
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
		
		//System.out.println(cp);
		if(cp.getOrderBy().equals("coupon_price asc")) {
			return (ArrayList)sqlSession.selectList("coupon-mapper.selectCpList", cp, rowbounds);
		} else if(cp.getOrderBy().equals("coupon_price desc")) {
			return (ArrayList)sqlSession.selectList("coupon-mapper.selectCpList_desc", cp, rowbounds);
		} else {
			return (ArrayList)sqlSession.selectList("coupon-mapper.selectCpList_amount", cp, rowbounds);
		}
	}
	
	public int insertMyCp(SqlSessionTemplate sqlSession, ArrayList<CouponProduct> cpList) {
		return sqlSession.insert("coupon-mapper.insertMyCp", cpList);
	}

	
	public int updateCp(SqlSessionTemplate sqlSession, CouponProduct cp) {
		return sqlSession.update("coupon-mapper.updateCp", cp);
	}
	
	public int updateCoupon(SqlSessionTemplate sqlSession, CouponProduct cp) {
		return sqlSession.update("coupon-mapper.updateCoupon", cp);
	}
	
	public ArrayList<CouponProduct> selectClassCplist(SqlSessionTemplate sqlSession, int mno) {
		return (ArrayList)sqlSession.selectList("coupon-mapper.selectClassCplist", mno);
	}
	
	public int insertCouponProduct(SqlSessionTemplate sqlSession, CouponProduct cp) {
		//System.out.println("결과 : " + sqlSession.insert("coupon-mapper.insertCouponProduct", cp));
		return sqlSession.insert("coupon-mapper.insertCouponProduct", cp);
	}
	
	public ArrayList<CouponProduct> myCouponList(SqlSessionTemplate sqlSession, CouponProduct cp){
		return (ArrayList)sqlSession.selectList("coupon-mapper.myCouponList", cp);
	}
	
	public ArrayList<CouponProduct> selectStudentCplist(SqlSessionTemplate sqlSession, CouponProduct cp){
		return (ArrayList)sqlSession.selectList("coupon-mapper.selectStudentCplist", cp);
	}
	
}
