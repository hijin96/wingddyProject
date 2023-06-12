package com.kh.wingddy.common.model.vo;

import lombok.Data;

@Data
public class Attachment {
	private int fileNo;
	private int memerNo;
	private String originName;
	private String changeName;
	private int fileLevel;
	private String filePath;
}
