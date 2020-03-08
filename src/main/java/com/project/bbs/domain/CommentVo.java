package com.project.bbs.domain;

import java.util.Date;

public class CommentVo {

	private int cno;
	private String comment, writer;
	private Date regDate;
	
	public CommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getwriter() {
		return writer;
	}
	public void setwriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
