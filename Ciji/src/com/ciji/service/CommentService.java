package com.ciji.service;

import java.util.List;

import com.ciji.pojo.Comment;

public interface CommentService {
	//获取日记对应的评论信息
	public List<Comment> getByid(int show_id);
	//添加评论
	public void add(Comment comment);
}
