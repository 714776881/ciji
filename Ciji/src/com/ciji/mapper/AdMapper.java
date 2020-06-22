package com.ciji.mapper;

import java.util.ArrayList;
import java.util.List;

import com.ciji.pojo.Administrator;

public interface AdMapper {
	//Create
	public void add(Administrator administrator);  
	//Read
	public List<Administrator> list();
	
	public Administrator get(int id);
	//update
	public Administrator unpate(Administrator administrator);
	//delete
	public int delete(int id); 
}
