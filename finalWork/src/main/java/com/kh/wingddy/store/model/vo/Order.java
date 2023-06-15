package com.kh.wingddy.store.model.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class Order {
	private int orderNo; //주문번호(시퀀스)
	private int memberNo; //회원번호
	private String resName; //받는사람이름
	private String sendName; //보내는사람이름
	private String resPhone;//받는사람전화번호
	private int sumprice; //총가격
	private Date orderDay; //주문날짜
	private String orderAddress; //배송지
}
