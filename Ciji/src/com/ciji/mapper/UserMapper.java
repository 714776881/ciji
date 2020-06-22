package com.ciji.mapper;

import java.sql.Timestamp;
import java.util.Date;

import com.ciji.pojo.Administrator;
import com.ciji.pojo.User;

public interface UserMapper {
	//登录
	public User get(String user_email);
	//注册
	public void add(User user);
	//现在时间
	public Date nowtime() ;
	
	//修改密码
	public void update(User user);
	
	
}
