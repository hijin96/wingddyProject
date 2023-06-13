package com.kh.wingddy.couponProduct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.Pageination;
import com.kh.wingddy.couponProduct.model.service.CouponProductServiceImpl;

@Controller
public class CouponProductController {
	
	@Autowired
	private CouponProductServiceImpl cpService;
	
	@RequestMapping(value="couponStore")
	public String selectCouponProductList(@RequestParam(value = "cPage",defaultValue = "1") int currentPage, 
										int cno, 
										Model model){

		PageInfo pi = Pageination.getPageInfo(cpService.selectListCount(cno), currentPage, 12, 5);
		model.addAttribute("pi", pi);
		model.addAttribute("cplist", cpService.selectCouponProductList(pi, cno));
		return "coupon/couponProductList";
	}
	
	
	
	
	
	
}
