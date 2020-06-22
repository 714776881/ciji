package com.ciji.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ciji.mapper.TopicMapper;
import com.ciji.pojo.Topic;
import com.ciji.service.TopicService;
@Service
public class TopicServiceImpl implements TopicService {
	@Autowired
	TopicMapper topicMapper;
	@Override
	public void add(Topic topic) {
		// TODO Auto-generated method stub
		topicMapper.add(topic);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		topicMapper.delete(id);
	}

	@Override
	public Topic get(int id) {
		// TODO Auto-generated method stub
		return topicMapper.get(id);
	}

	@Override
	public void update(Topic topic) {
		// TODO Auto-generated method stub
		topicMapper.update(topic);
	}

	@Override
	public List<Topic> list() {
		// TODO Auto-generated method stub
		return topicMapper.list();
	}

	@Override
	public List<Topic> listbyid(int id) {
		// TODO Auto-generated method stub
		return topicMapper.listbyid(id);
	}

	@Override
	public List<Topic> listbyname(String name) {
		// TODO Auto-generated method stub
		return topicMapper.listbyname(name);
	}

	@Override
	public List<Topic> listbyTopic(Topic topic) {
		// TODO Auto-generated method stub
		return topicMapper.listbyTopic(topic);
	}

	@Override
	public List<Topic> listbyTopicSort(Topic topic) {
		// TODO Auto-generated method stub
		return topicMapper.listbyTopicSort(topic);
	}

	@Override
	public List<Topic> getCollect(int user_id) {
		// TODO Auto-generated method stub
		return topicMapper.getCollect(user_id);
	}


}
