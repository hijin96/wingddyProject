package com.kh.wingddy.common.template;

import com.kh.wingddy.common.model.vo.PageInfo;

public class Pageination {
	public static PageInfo getPageInfo(int listCount, int currentPage, int boardLimit, int pageLimit) {
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage = (currentPage - 1)/pageLimit*pageLimit +1;
		int endPage = startPage + pageLimit -1;
		
		if(endPage> maxPage) endPage = maxPage;
		
		//필요한 경우엔 new해서 새로 만들 수 있음. 
		return new PageInfo(listCount,currentPage,boardLimit,pageLimit,maxPage,startPage,endPage);
		
	}

}
