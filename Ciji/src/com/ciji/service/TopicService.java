package com.ciji.service;

import java.util.List;

import com.ciji.pojo.Topic;

public interface TopicService {
	//添加新的词条
	public void add(Topic topic);
	//删除词条
	public void delete(int id);
	//得到指定的词条
	public Topic get(int id);
	public List<Topic> getCollect(int user_id);
	//更新词条
	public void update(Topic topic);
	//列出词条
	public List<Topic> list();
	//列出用户的词条
	public List<Topic> listbyid(int id);
	//列出用户的词条
	public List<Topic> listbyname(String name);
	//列出用户的词条
	public List<Topic> listbyTopic(Topic topic);
	//列出用户的日记，分享和收藏
	public List<Topic> listbyTopicSort(Topic topic);
}
