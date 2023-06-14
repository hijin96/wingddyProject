package com.kh.wingddy.couponProduct.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.couponProduct.model.dao.CouponProductDao;
import com.kh.wingddy.couponProduct.model.vo.CouponProduct;

@Service
public class CouponProductServiceImpl implements CouponProductService {
	
	@Autowired
	private CouponProductDao cpDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount(int classNo) {
		return cpDao.selectListCount(sqlSession, classNo);
	}

	@Override
	public ArrayList<CouponProduct> selectCouponProductList(PageInfo pi, int classNo) {
		return cpDao.selectCouponProductList(sqlSession, pi, classNo);
	}
	
	@Override
	public int insertCouponProduct(CouponProduct cp) {
		return 0;
	}

	@Override
	public int updateCouponProduct(CouponProduct cp) {
		return 0;
	}

	@Override
	public int deleteCouponProduct(int cpNo) {
		return 0;
	}

	@Override
	public ArrayList<CouponProduct> myCouponList(int memberNo) {
		return null;
	}

	@Override
	public int useCoupon(int memberNo, int cpNo) {
		return 0;
	}

	
	
	
	
	
	
}
