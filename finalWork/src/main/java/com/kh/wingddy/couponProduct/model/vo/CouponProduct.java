package com.kh.wingddy.couponProduct.model.vo;

import lombok.Data;

@Data
public class CouponProduct {
	private int cpNo;
	private int classNo;
	private int cartNo;
	private String productName;
	private String productContent;
	private int couponPrice;
	private int amount;
	private String reName;
	private String thumbnail;
	
}
