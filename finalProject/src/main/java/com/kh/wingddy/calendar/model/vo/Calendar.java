package com.kh.wingddy.calendar.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Calendar {
	private int scheduleNo;
	private int memberNo;
	private String schedule;
	private Date startDate;
	private Date endDate;
	private String color;
}
