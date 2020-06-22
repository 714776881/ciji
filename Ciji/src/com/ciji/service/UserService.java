package com.ciji.service;

import java.util.Date;
import java.util.List;

import com.ciji.pojo.Topic;
import com.ciji.pojo.User;

public interface UserService {
		//��¼
		public User get(String user_email);
		//ע��
		public void add(User user);
		//����ʱ��
		public Date nowtime() ;
		//�޸�����
		public void update(User user);
		//�г��û��Ĵ���
		public List<Topic> listbyid(int id);
}
