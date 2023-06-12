package com.kh.wingddy.store.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class Cart {
	private int cartNo; //장바구니번호
	private int memberNo; //회원번호
	private int spNo; //상품번호
	private int buyCount;  //구매수량
	private String orderYn;//주문완료여부(담아둔 애들:N,  결제완료: Y)
	private Date cartDay;//장바구니 등록날짜
	private int orderNo;//주문번호
}
