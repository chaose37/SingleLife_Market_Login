package org.single.domain;

import org.apache.ibatis.type.Alias;

@Alias("boardSearchVO")
public class BoardSearchVO {
	 private int pageNo;
	 private int start;
	 private int end;
	 
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
}
