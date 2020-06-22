package com.ciji.mapper;

import java.util.List;

import com.ciji.pojo.Collect;
import com.ciji.pojo.User;

public interface CollectMapper {
	//获取用户对应的收藏信息
	public List<Collect> get(User user);
	public Collect getById(Collect collect);
	//添加收藏
	public void add(Collect collect);
	//删除对应的收藏
	public void delete(Collect collect);
}
