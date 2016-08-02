package org.single.domain;

import org.apache.ibatis.type.Alias;

@Alias("pageVO")
public class PageVO {
	private Integer count;
	private Integer pageNo;
	private Integer beginPage;
	private Integer endPage;
	private Integer lastPage;
	private Integer currTab;
	private Integer listSize = 20;
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(Integer beginPage) {
		this.beginPage = beginPage;
	}
	public Integer getEndPage() {
		return endPage;
	}
	public void setEndPage(Integer endPage) {
		this.endPage = endPage;
	}
	public Integer getLastPage() {
		return lastPage;
	}
	public void setLastPage(Integer lastPage) {
		this.lastPage = lastPage;
	}
	public Integer getCurrTab() {
		return currTab;
	}
	public void setCurrTab(Integer currTab) {
		this.currTab = currTab;
	}
	public Integer getListSize() {
		return listSize;
	}
	public void setListSize(Integer listSize) {
		this.listSize = listSize;
	}
}
