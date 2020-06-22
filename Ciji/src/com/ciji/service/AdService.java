package com.ciji.service;

import java.util.ArrayList;
import java.util.List;

import com.ciji.pojo.Administrator;

public interface AdService {
	//Create
	public void add(Administrator administrator);  
	//Read
	public List<Administrator> list();
	
	public Administrator get(int id);
	//update
	public void unpate(Administrator administrator);
	//delete
	public int delete(int id);
}
