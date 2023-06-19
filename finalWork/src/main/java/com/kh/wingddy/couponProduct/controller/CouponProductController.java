package com.kh.wingddy.couponProduct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.Pageination;
import com.kh.wingddy.couponProduct.model.service.CouponProductServiceImpl;
import com.kh.wingddy.couponProduct.model.vo.CouponProduct;

@Controller
public class CouponProductController {
	
	@Autowired
	private CouponProductServiceImpl cpService;
	
	@RequestMapping(value="couponStore")
	public String selectCouponProductList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage, 
										  @RequestParam(value = "orderBy", defaultValue ="coupon_price asc") String orderBy, 
										  int cno, 
										  Model model){

		PageInfo pi = Pageination.getPageInfo(cpService.selectListCount(cno), currentPage, 8, 5);
		
		CouponProduct cp = new CouponProduct();
		cp.setClassNo(cno);
		cp.setOrderBy(orderBy);
		System.out.println(cp);
		
		model.addAttribute("cplist", cpService.selectCouponProductList(pi, cp));
		System.out.println(model.getAttribute("cplist"));
		//System.out.println("controller, pi : " + pi);
		//System.out.println(cpService.selectCouponProductList(pi, cno).size());
		return "coupon/couponProductList";
	}
	
	@RequestMapping("enrollForm.cp")
	public String enrollCpForm() {
		//System.out.println("확인");
		return "coupon/enrollCouponProductForm"; 
	}
	
	
	
	
}
