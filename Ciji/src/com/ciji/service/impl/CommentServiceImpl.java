package com.ciji.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ciji.mapper.CommentMapper;
import com.ciji.pojo.Comment;
import com.ciji.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired CommentMapper commentMapper;
	@Override
	public List<Comment> getByid(int show_id) {
		// TODO Auto-generated method stub
		return commentMapper.getByid(show_id);
	}

	@Override
	public void add(Comment comment) {
		// TODO Auto-generated method stub
		commentMapper.add(comment);
	}
	
}
