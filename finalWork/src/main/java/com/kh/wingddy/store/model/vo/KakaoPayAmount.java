package com.kh.wingddy.store.model.vo;

import lombok.Data;

@Data
public class KakaoPayAmount {
	private int total; //전체 결제 금액
	private int tax_free; //	비과세 금액
	private int vat;  //부가세 
	private int point;
	private int discount; //	할인 금액

}
