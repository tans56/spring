package com.earth.heart.domain;

import static java.util.Objects.requireNonNullElse;

import org.springframework.web.util.UriComponentsBuilder;


public class SearchItem {
	public static final int DEFAULT_PAGE_SIZE = 10;
	public static final int MIN_PAGE_SIZE = 5;
	public static final int MAX_PAGE_SIZE = 50;
	
	private Integer page = 1;
	private Integer pageSize = DEFAULT_PAGE_SIZE;
	private String keyword = "";
	private String option = "";
	
	public SearchItem() {}
	
	public SearchItem(Integer page, Integer pageSize) {
		this(page, pageSize, "", "");
	}
	
	public SearchItem(Integer page, Integer pageSize, String option, String keyword) {
		this.page = page;
		this.pageSize = pageSize;
		this.option = option;
		this.keyword = keyword;
	}

	//setter, getter 추가 	
	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		//pageSize가 null일때 default값을 반환
		this.pageSize = requireNonNullElse(pageSize, DEFAULT_PAGE_SIZE);
		
		//MIN_PAGE_SIZE <= pageSize <= MAX_PAGE_SIZE
		this.pageSize = Math.max(MIN_PAGE_SIZE, Math.min(this.pageSize,MAX_PAGE_SIZE));
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}	
	
	public String getQueryString() {
		return getQueryString(page);
	}
	
	//?page=10&pageSize=10&option=A&keyword=title
	public String getQueryString(Integer page) {
		// TODO Auto-generated method stub
		return UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)
				.queryParam("option", option)
				.queryParam("keyword", keyword)
				.build().toString();
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}
	
	
	public Integer getOffset() {
		int result = (page-1)*pageSize;
		if(result < 0) result = 0;
		
		return result;
	}
	
}
