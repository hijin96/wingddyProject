package com.kh.wingddy.couponProduct.model.service;

import java.util.ArrayList;

import com.kh.wingddy.couponProduct.model.vo.CouponProduct;

public interface CouponProductService {

	public ArrayList<CouponProduct> selectCouponProductList(int classNo);
	
	public int insertCouponProduct(CouponProduct cp);
	
	public int updateCouponProduct(CouponProduct cp);
	
	public int deleteCouponProduct(int cpNo);
	
	public ArrayList<CouponProduct> myCouponList(int memberNo);
	
	public int useCoupon(int memberNo, int cpNo);
	
	
	
	
}
