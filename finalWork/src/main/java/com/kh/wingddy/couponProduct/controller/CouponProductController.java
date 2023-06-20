package com.kh.wingddy.couponProduct.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.wingddy.alphabetMarket.model.service.AlphabetService;
import com.kh.wingddy.alphabetMarket.model.vo.MyCount;
import com.kh.wingddy.common.model.vo.PageInfo;
import com.kh.wingddy.common.template.Pageination;
import com.kh.wingddy.couponProduct.model.service.CouponProductServiceImpl;
import com.kh.wingddy.couponProduct.model.vo.CouponProduct;

@Controller
public class CouponProductController {
	
	@Autowired
	private CouponProductServiceImpl cpService;
	
	@Autowired
	private AlphabetService alphabetService;
	
	@RequestMapping(value="couponStore")
	public String selectCouponProductList(@RequestParam(value = "cPage", defaultValue = "1") int currentPage, 
										  @RequestParam(value = "orderBy", defaultValue ="coupon_price asc") String orderBy, 
										  int cno, 
										  Model model){

		PageInfo pi = Pageination.getPageInfo(cpService.selectListCount(cno), currentPage, 8, 5);
		model.addAttribute("pi", pi);
		//System.out.println(pi);
		
		CouponProduct cp = new CouponProduct();
		cp.setClassNo(cno);
		cp.setOrderBy(orderBy);
		
		model.addAttribute("cplist", cpService.selectCouponProductList(pi, cp));
		System.out.println(cpService.selectCouponProductList(pi, cp));
		
		model.addAttribute("orderBy", orderBy);
		return "coupon/couponProductList";
	}
	
	@RequestMapping("enrollForm.cp")
	public String enrollCpForm() {
		//System.out.println("확인");
		return "coupon/enrollCouponProductForm"; 
	}
	
	@RequestMapping("myList.cp")
	public String myCouponProductList() {
		return "coupon/myCouponProduct";
	}
	
	@ResponseBody
	@RequestMapping(value="couponCount.cp", produces="application/json; charset=UTF-8")
	public String myCount(MyCount mc) {
		return new Gson().toJson(alphabetService.ajaxMyCount(mc));
	}
	
	@ResponseBody
	@RequestMapping("buy.cp")
	public String buyCouponProduct(CouponProduct cp) {
		System.out.println(cp);
		
		List<CouponProduct> cpList = new ArrayList(); 
		for(int i = 0; i < cp.getAmount(); i++) {
			cpList.add(cp);
		}
		
		System.out.println(cpList.size());
		
		System.out.println(cpService.buyCouponProduct(cpList, cp));
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
