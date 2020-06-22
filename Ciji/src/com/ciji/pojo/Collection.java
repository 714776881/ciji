package com.ciji.pojo;

import java.sql.Timestamp;
import java.util.Date;

public class Collection {
	private int collect_id;
	private int diary_id;
	private int user_id;
	private Date collect_date;
	public int getCollect_id() {
		return collect_id;
	}
	public void setCollect_id(int collect_id) {
		this.collect_id = collect_id;
	}
	public int getDiary_id() {
		return diary_id;
	}
	public void setDiary_id(int diary_id) {
		this.diary_id = diary_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Date getCollect_date() {
		return collect_date;
	}
	public void setCollect_date(Date collect_date) {
		this.collect_date = collect_date;
	}
	
}
