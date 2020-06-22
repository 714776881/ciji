package com.ciji.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ciji.mapper.TopicMapper;
import com.ciji.mapper.UserMapper;
import com.ciji.pojo.Topic;
import com.ciji.pojo.User;
import com.ciji.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	TopicMapper topicMapper;
	
	@Override
	public User get(String user_email) {
		// TODO Auto-generated method stub
		return userMapper.get(user_email);
	}

	@Override
	public void add(User user) {
		// TODO Auto-generated method stub
		userMapper.add(user);
	}

	@Override
	public Date nowtime() {
		// TODO Auto-generated method stub
		return userMapper.nowtime();
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userMapper.update(user);
	}

	@Override
	public List<Topic> listbyid(int id) {
		// TODO Auto-generated method stub
		return topicMapper.listbyid(id);
	}


}
