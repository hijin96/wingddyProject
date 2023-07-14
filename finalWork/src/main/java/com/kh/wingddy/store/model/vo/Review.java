package com.kh.wingddy.store.model.vo;



import java.util.Date;

import lombok.Data;

@Data
public class Review {
	private int memberNo;//작성자번호
	private String memberName;
	private Date reDate;//작성일
	private String reCom;//상품후기
	private int spNo;//상품번호

}
