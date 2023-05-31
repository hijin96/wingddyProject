package com.kh.wingddy.notice.model.vo;

import lombok.Data;

@Data
public class Notice {
	
	private int noticeNo; //NOTICE_NO	NUMBER
	private int noticeWriter; //NOTICE_WRITER	NUMBER
	private String noticeTitle; //NOTICE_TITLE	VARCHAR2(300 BYTE)
	private String noticeContent; //NOTICE_CONTENT	VARCHAR2(1000 BYTE)
	private String createDate; //CREATE_DATE	DATE
	private int noticeCount; //NOTICE_COUNT	NUMBER
	private String noticeStatus; //NOTICE_STATUS	CHAR(1 BYTE)

}
