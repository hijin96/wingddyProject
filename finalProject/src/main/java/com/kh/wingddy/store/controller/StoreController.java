package com.kh.wingddy.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	@RequestMapping("storemain")
	public String storeMain() {
		return "store/storemain";
	}
	
	@RequestMapping("storedetail")
	public String storeDetail() {
		return "store/storedetail";
	}
	@RequestMapping("storecart")
	public String storeCart() {
		return "store/storecart";
	}
	@RequestMapping("storebuy")
	public String storebuy() {
		return "store/storebuy";
	}
	@RequestMapping("storewish")
	public String storewish() {
		return "store/storewishlist";
	}
	//주문정보
	@RequestMapping("shoppinglist")
	public String storeShoppingList() {
		return "store/storeShoppingList";
	}
	//주문정보 상세보기
	@RequestMapping("orderInfo")
	public String orderInfo() {
		return "store/orderInfo";
	}
	
}
