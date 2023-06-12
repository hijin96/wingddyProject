package com.kh.wingddy.alphabetMarket.model.vo;

import com.kh.wingddy.member.model.vo.Member;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString(callSuper = true) @Getter @Setter @NoArgsConstructor
public class MyCount extends Member {
	
	private int classNo; //CLASS_NO	NUMBER
	private int couponCount; //COUPON_COUNT	NUMBER
	private int gachaCount; //GACHA_COUNT	NUMBER
	private int totalCouponCount; //TOTAL_COUPON_COUNT	NUMBER
}
