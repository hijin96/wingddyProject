package com.kh.wingddy.couponProduct.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wingddy.couponProduct.model.dao.CouponProductDao;
import com.kh.wingddy.couponProduct.model.vo.CouponProduct;

@Service
public class CouponProductServiceImpl implements CouponProductService {
	
	@Autowired
	private CouponProductDao CouponProductDao;

	@Override
	public ArrayList<CouponProduct> selectCouponProductList(int classNo) {
		return null;
	}

	@Override
	public int insertCouponProduct(CouponProduct cp) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCouponProduct(CouponProduct cp) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCouponProduct(int cpNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<CouponProduct> myCouponList(int memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int useCoupon(int memberNo, int cpNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
	
	
}
