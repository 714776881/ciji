package com.ciji.pojo;

import java.util.Date;

public class Administrator {
	private int ad_id;
	private String ad_name;
	private String ad_account;
	private String ad_password;
	private Date ad_lastlogintime;
	public int getAd_id() {
		return ad_id;
	}
	public void setAd_id(int ad_id) {
		this.ad_id = ad_id;
	}
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}
	public String getAd_account() {
		return ad_account;
	}
	public void setAd_account(String ad_account) {
		this.ad_account = ad_account;
	}
	public String getAd_password() {
		return ad_password;
	}
	public void setAd_password(String ad_password) {
		this.ad_password = ad_password;
	}
	public Date getAd_lastlogintime() {
		return ad_lastlogintime;
	}
	public void setAd_lastlogintime(Date ad_lastlogintime) {
		this.ad_lastlogintime = ad_lastlogintime;
	}
	
}
