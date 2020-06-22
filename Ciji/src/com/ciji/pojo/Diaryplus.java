package com.ciji.pojo;

import java.util.ArrayList;
import java.util.List;

public class Diaryplus {
	private int diary_id;
	private String diary_title;
	private String diary_content;
	private int	topic_id;
	private int	user_id;
	private String diary_editdate;
	private String diary_updatedate;
	private String diary_likes;
	private List<Comment> comment;
	public int getDiary_id() {
		return diary_id;
	}
	public void setDiary_id(int diary_id) {
		this.diary_id = diary_id;
	}
	public String getDiary_title() {
		return diary_title;
	}
	public void setDiary_title(String diary_title) {
		this.diary_title = diary_title;
	}
	public String getDiary_content() {
		return diary_content;
	}
	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
	}
	public int getTopic_id() {
		return topic_id;
	}
	public void setTopic_id(int topic_id) {
		this.topic_id = topic_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getDiary_editdate() {
		return diary_editdate;
	}
	public void setDiary_editdate(String diary_editdate) {
		this.diary_editdate = diary_editdate;
	}
	public String getDiary_updatedate() {
		return diary_updatedate;
	}
	public void setDiary_updatedate(String diary_updatedate) {
		this.diary_updatedate = diary_updatedate;
	}
	public String getDiary_likes() {
		return diary_likes;
	}
	public void setDiary_likes(String diary_likes) {
		this.diary_likes = diary_likes;
	}
	public List<Comment> getComment() {
		return comment;
	}
	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}
	
	
}
