package com.kh.wingddy.classroom.model.vo;

import java.util.List;

import com.kh.wingddy.member.model.vo.Member;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString(callSuper = true) @Getter @Setter @NoArgsConstructor
public class ClassMember extends Member {

	private int classNo; //CLASS_NO	NUMBER
	private int studentNo; //STUDENT_NO	NUMBER
	private String enterStatus; //ENTER_STATUS	VARCHAR2(1 BYTE)
	private int totalCount;
	private int completeCount;
	private int progressRate;
	
	private List<String> StudentList;
	private int gachaCount;

}
