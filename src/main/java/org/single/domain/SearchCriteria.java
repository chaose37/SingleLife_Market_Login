package org.single.domain;

public class SearchCriteria{
	private int page;
	private int perPageNum;
	private String searchType;
	private String keyword;
	public SearchCriteria(){
		this.page = 1;
		this.perPageNum = 12;
	}
	
	public void setPage(int page){
		if(page <= 0){
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum){
		if(perPageNum <= 0 || perPageNum > 100){
			this.perPageNum = 12;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPage(){
		return page;
	}
	
	public int getPageStart(){
		return (this.page -1) * perPageNum;
	}

	public int getPerPageNum(){
		return this.perPageNum;
	}
	
	public String getSearchType() {
		return searchType;
	}


	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "SearchCriteria [page=" + page + ", perPageNum=" + perPageNum + ", searchType=" + searchType
				+ ", keyword=" + keyword + ", toString()=" + super.toString() + "]";
	}
}