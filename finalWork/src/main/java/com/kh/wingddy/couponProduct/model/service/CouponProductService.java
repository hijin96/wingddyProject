package com.kh.wingddy.couponProduct.model.service;

import java.util.ArrayList;

import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.couponProduct.model.vo.CouponProduct;

public interface CouponProductService {
	
	int selectListCount(int classNo);

	ArrayList<CouponProduct> selectCouponProductList(PageInfo pi, CouponProduct cp);
	
	int insertCouponProduct(CouponProduct cp);
	
	int updateCouponProduct(CouponProduct cp);
	
	int deleteCouponProduct(int cpNo);
	
	ArrayList<CouponProduct> myCouponList(int memberNo);
	
	int useCoupon(int memberNo, int cpNo);
	
	
	
	
}
