package com.ciji.mapper;

import java.util.List;

import com.ciji.pojo.Topic;

public interface TopicMapper {
		//����µĴ���
		public int add(Topic topic);
		//ɾ������
		public void delete(int id);
		//�õ�ָ���Ĵ���
		public Topic get(int id);
		
		public List<Topic> getCollect(int user_id);
		//���´���
		public int update(Topic topic);
		//�г�����
		public List<Topic> list();
		//�г��û��Ĵ���
		public List<Topic> listbyid(int id);
		//�г��û���Ӧ�Ĵ���
		public List<Topic> listbyname(String name);
		//�г��û��Ĵ���
		public List<Topic> listbyTopic(Topic topic);
		//�г��û����ռǣ������ղ�
		public List<Topic> listbyTopicSort(Topic topic);
}
