package com.ciji.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ciji.mapper.CollectMapper;
import com.ciji.pojo.Collect;
import com.ciji.pojo.User;
import com.ciji.service.CollectService;
@Service
public class CollectServiceImpl implements CollectService {
	@Autowired CollectMapper collectMapper;
	@Override
	public List<Collect> get(User user) {
		// TODO Auto-generated method stub
		return collectMapper.get(user);
	}

	@Override
	public void add(Collect collect) {
		// TODO Auto-generated method stub
		collectMapper.add(collect);
	}

	@Override
	public void delete(Collect collect) {
		// TODO Auto-generated method stub
		collectMapper.delete(collect);
	}

	@Override
	public Collect getById(Collect collect) {
		// TODO Auto-generated method stub
		return collectMapper.getById(collect);
	}

}
