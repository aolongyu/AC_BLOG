package com.bean;

import java.sql.Date;

public class Message {
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		String time = date.replace(".0", " ");
		return time;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(String blog_id) {
		this.blog_id = blog_id;
	}
	private String title;
	private String content;
	private String date;
	private String user_id;
	private String blog_id;
	private int browse;
	public int getBrowse() {
		return browse;
	}
	public void setBrowse(int browse) {
		this.browse = browse;
	}

}
