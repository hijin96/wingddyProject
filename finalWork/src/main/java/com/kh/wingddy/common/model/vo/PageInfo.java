package com.kh.wingddy.common.model.vo;

import lombok.Data;

@Data 
public class PageInfo {
	private int listCount;
	private int currentPage;
	private int boardLimit;
	private int pageLimit;
	
	private int maxPage; // 가장 마지막 페이지
	private int startPage; // 현재 페이지에서 가장 앞 페이징 버튼
	private int endPage; // 현재 페이지에서 마지막 페이징버튼
	
	public PageInfo(int listCount, int currentPage, int boardLimit, int pageLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.boardLimit = boardLimit;
		this.pageLimit = pageLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	
}
