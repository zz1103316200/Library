package com.library.vo;

import java.util.List;

public class FenyeVo {
	
	private int currentPage;
	private int totalPage;
	private int totalCount;
	private List currentList;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public List getCurrentList() {
		return currentList;
	}
	public void setCurrentList(List currentList) {
		this.currentList = currentList;
	}
	
	
	
	
}
