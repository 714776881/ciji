package com.ciji.pojo;


public class Topic {
	private int topic_id;
	private String topic_name;
	private String topic_meaning;
	private int topic_likes;
	private String topic_date;
	private int topic_sort;
	private int user_id;
	public int getTopic_id() {
		return topic_id;
	}
	public void setTopic_id(int topic_id) {
		this.topic_id = topic_id;
	}
	public String getTopic_name() {
		return topic_name;
	}
	public void setTopic_name(String topic_name) {
		this.topic_name = topic_name;
	}
	public String getTopic_meaning() {
		return topic_meaning;
	}
	public void setTopic_meaning(String topic_meaning) {
		this.topic_meaning = topic_meaning;
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getTopic_date() {
		return topic_date;
	}
	public void setTopic_date(String topic_date) {
		this.topic_date = topic_date;
	}
	public int getTopic_sort() {
		return topic_sort;
	}
	public void setTopic_sort(int topic_sort) {
		this.topic_sort = topic_sort;
	}
	public int getTopic_likes() {
		return topic_likes;
	}
	public void setTopic_likes(int topic_likes) {
		this.topic_likes = topic_likes;
	}

	
}
