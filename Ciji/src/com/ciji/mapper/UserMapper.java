package com.ciji.mapper;

import java.sql.Timestamp;
import java.util.Date;

import com.ciji.pojo.Administrator;
import com.ciji.pojo.User;

public interface UserMapper {
	//��¼
	public User get(String user_email);
	//ע��
	public void add(User user);
	//����ʱ��
	public Date nowtime() ;
	
	//�޸�����
	public void update(User user);
	
	
}
