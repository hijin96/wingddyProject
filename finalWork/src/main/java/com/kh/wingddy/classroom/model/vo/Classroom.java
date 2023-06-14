package com.kh.wingddy.classroom.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter @Getter @NoArgsConstructor @AllArgsConstructor
public class Classroom implements Serializable{
	
	private int classNo;
	private String className;
	private String teacherName;
	private String enterCode;
}
