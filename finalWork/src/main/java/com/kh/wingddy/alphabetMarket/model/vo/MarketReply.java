package com.kh.wingddy.alphabetMarket.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MarketReply {

	private int replyNo;
	private String replyWriter;
	private int replyMno;
	private String alphabet;
	private String replyContent;
	private Date replyDate;
	private int refMarket;
	private String replyStatus;
	private String replySelected;
}
