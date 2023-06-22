package com.kh.wingddy.education.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@Getter @Setter @ToString(callSuper = true) @NoArgsConstructor @AllArgsConstructor @SuperBuilder
public class Edu {
	
	private int eduNo;		//EDU_NO	NUMBER
	private int classNo;	//CLASS_NO	NUMBER
	private String eduName;	//EDU_NAME	VARCHAR2(100 BYTE)
	private String eduType;	//EDU_TYPE	VARCHAR2(1 BYTE)
	private String endTime;	//END_TIME	DATE
	private Double limitTime; 
	private int gachaCount;
	private int eduState;
}
