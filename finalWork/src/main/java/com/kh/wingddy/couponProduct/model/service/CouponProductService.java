package com.kh.wingddy.couponProduct.model.service;

import java.util.ArrayList;

import com.kh.wingddy.couponProduct.model.vo.CouponProduct;

public interface CouponProductService {
	
	int selectListCount(int classNo);

	ArrayList<CouponProduct> selectCouponProductList(int classNo);
	
	int insertCouponProduct(CouponProduct cp);
	
	int updateCouponProduct(CouponProduct cp);
	
	int deleteCouponProduct(int cpNo);
	
	ArrayList<CouponProduct> myCouponList(int memberNo);
	
	int useCoupon(int memberNo, int cpNo);
	
	
	
	
}
