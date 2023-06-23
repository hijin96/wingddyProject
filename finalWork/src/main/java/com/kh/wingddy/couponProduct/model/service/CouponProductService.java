package com.kh.wingddy.couponProduct.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.couponProduct.model.vo.CouponProduct;

public interface CouponProductService {
	
	int selectListCount(int classNo);

	ArrayList<CouponProduct> selectCouponProductList(PageInfo pi, CouponProduct cp);
	
	int insertCouponProduct(CouponProduct cp);
	
	int useCoupon(CouponProduct cp);
	
	ArrayList<CouponProduct> myCouponList(CouponProduct cp);
	
	int buyCouponProduct(ArrayList<CouponProduct> cpList, CouponProduct cp);
	
	ArrayList<CouponProduct> selectClassCplist(int cno);
	
	ArrayList<CouponProduct> selectStudentCplist(CouponProduct cp);
	
	ArrayList<CouponProduct> searchStudentCp(HashMap map);
}
