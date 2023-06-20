package com.kh.wingddy.store.model.vo;

import lombok.Data;

@Data
public class KakaopayReadyResponse {
	private String tid;
	private String next_redirect_pc_url;
	private String partner_order_id;

}
