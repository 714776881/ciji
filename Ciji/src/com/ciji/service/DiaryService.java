package com.ciji.service;

import java.util.List;

import com.ciji.pojo.Diary;

public interface DiaryService {
	//添加新的日记
		public void add(Diary diary);
		//删除日记
		public void delete(int id);
		//得到指定的日记
		public Diary get(int id);
		//更新日记
		public void update(Diary diary);
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
