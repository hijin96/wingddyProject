package com.kh.wingddy.member.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Cert {
	
	private int certNo;
	private String memberWho;
	private String secret;
	private Date certWhen;

}
