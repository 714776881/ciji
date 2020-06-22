package com.ciji.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ciji.mapper.AdMapper;
import com.ciji.pojo.Administrator;
import com.ciji.service.AdService;
@Service
public class AdServiceImpl implements AdService{
	@Autowired
	AdMapper adMapper;
	@Override
	public void add(Administrator administrator) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Administrator> list() {
		// TODO Auto-generated method stub
		return adMapper.list();
	}

	@Override
	public Administrator get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void unpate(Administrator administrator) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
