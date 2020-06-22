package com.ciji.service;

import java.util.Date;
import java.util.List;

import com.ciji.pojo.Topic;
import com.ciji.pojo.User;

public interface UserService {
		//登录
		public User get(String user_email);
		//注册
		public void add(User user);
		//现在时间
		public Date nowtime() ;
		//修改密码
		public void update(User user);
		//列出用户的词条
		public List<Topic> listbyid(int id);
}
