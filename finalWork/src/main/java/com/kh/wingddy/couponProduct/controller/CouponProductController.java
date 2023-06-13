package com.kh.wingddy.couponProduct.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.wingddy.couponProduct.model.service.CouponProductServiceImpl;
import com.kh.wingddy.couponProduct.model.vo.CouponProduct;

@Controller
public class CouponProductController {
	
	@Autowired
	private CouponProductServiceImpl CouponProductServiceImpl;
	
	
	@RequestMapping(value="couponStore")
	public String selectCouponProductList(@RequestParam(value = "cPage",defaultValue = "1") int currentPage){
		
		return "couponProduct/couponProductList";
	}
	
	
	
	
	
}
