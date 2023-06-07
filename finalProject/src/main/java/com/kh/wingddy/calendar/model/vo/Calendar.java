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
}
