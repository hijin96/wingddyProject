package com.kh.wingddy.calendar.model.vo;

import lombok.Data;

@Data
public class Calendar {
	private int scheduleNo;
	private int memberNo;
	private String schedule;
	private String startDate;
	private String endDate;
	private String color;
	private int classNo;
	private String className;
	private String memberType;
	
	
	
	public Calendar(int scheduleNo, int memberNo, String schedule, String startDate, String endDate, String color) {
		super();
		this.scheduleNo = scheduleNo;
		this.memberNo = memberNo;
		this.schedule = schedule;
		this.startDate = startDate;
		this.endDate = endDate;
		this.color = color;
	}



	public Calendar() {
		super();
	}
	
	
}
