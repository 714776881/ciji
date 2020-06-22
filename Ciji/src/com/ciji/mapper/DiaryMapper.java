package com.ciji.mapper;

import java.util.List;

import com.ciji.pojo.Diary;
import com.ciji.pojo.User;

public interface DiaryMapper {
	//添加新的日记
	public int add(Diary diary);
	//删除日记
	public void delete(int id);
	//得到指定的日记
	public Diary get(int id);
	//更新日记
	public int update(Diary diary);
	//列出日记
	public List<Diary> list();
	//列出用户的日志
	public List<Diary> listbyid(Diary diary);
	//
	public List<Diary> listbysort(Diary diary);
	//
	public int total();
	//用户文章计数
	public int totalbyid(Diary diary);
}
