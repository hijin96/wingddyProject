package com.kh.wingddy.couponProduct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.Pageination;
import com.kh.wingddy.couponProduct.model.service.CouponProductServiceImpl;

@Controller
public class CouponProductController {
	
	@Autowired
	private CouponProductServiceImpl cpService;
	
	
	@RequestMapping(value="couponStore")
	public String couponStore() {
		return "coupon/couponProductList";
	}
	
	
	public String selectCouponProductList(@RequestParam(value = "cPage",defaultValue = "1") int currentPage, 
										int classNo, 
										ModelAndView mv){
		int listCount = cpService.selectListCount(classNo);
		System.out.println(listCount);
		
		PageInfo pi = Pageination.getPageInfo(listCount, currentPage, 12, 5);
		
		mv.addObject("pi", pi);
		mv.addObject("cpList", cpService.selectCouponProductList(pi, classNo));
		
		return "coupon/couponStore";
	}
	
	
	
	
	
	
}
