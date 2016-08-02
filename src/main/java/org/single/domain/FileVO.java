package org.single.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("fileVO")
public class FileVO {
	
	private String fullname;
	private int bno;
	private Date regdate;
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	

}
