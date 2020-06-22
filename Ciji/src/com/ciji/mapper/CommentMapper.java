package com.ciji.mapper;
import java.util.List;

import com.ciji.pojo.Comment;
public interface CommentMapper {
	//获取日记对应的评论信息
	public List<Comment> getByid(int show_id);
	//添加评论
	public void add(Comment comment);
}
