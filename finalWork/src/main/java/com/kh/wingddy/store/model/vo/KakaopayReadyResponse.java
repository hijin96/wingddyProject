package com.kh.wingddy.store.model.vo;

import lombok.Data;

//결제준비
@Data
public class KakaopayReadyResponse {
	private String tid; //	결제 고유 번호, 20자
	private String next_redirect_pc_url;
	private String partner_order_id; //가맹점 주문번호
	private String created_at;// 결제 준비 요청 시간

}
