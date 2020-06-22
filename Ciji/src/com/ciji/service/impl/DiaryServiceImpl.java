package com.ciji.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ciji.mapper.DiaryMapper;
import com.ciji.pojo.Diary;
import com.ciji.service.DiaryService;
@Service
public class DiaryServiceImpl implements DiaryService {
	@Autowired
	DiaryMapper diaryMapper;
	
	@Override
	public void add(Diary diary) {
		// TODO Auto-generated method stub
		diaryMapper.add(diary);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		diaryMapper.delete(id);
	}

	@Override
	public Diary get(int id) {
		// TODO Auto-generated method stub
		return diaryMapper.get(id);
	}

	@Override
	public void update(Diary diary) {
		// TODO Auto-generated method stub
		diaryMapper.update(diary);
	}

	@Override
	public List<Diary> list() {
		// TODO Auto-generated method stub
		return diaryMapper.list();
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return diaryMapper.total();
	}

	@Override
	public List<Diary> listbyid(Diary diary) {
		// TODO Auto-generated method stub
		return diaryMapper.listbyid(diary);
	}

	@Override
	public int totalbyid(Diary diary) {
		// TODO Auto-generated method stub
		return diaryMapper.totalbyid(diary);
	}

	@Override
	public List<Diary> listbysort(Diary diary) {
		// TODO Auto-generated method stub
		return diaryMapper.listbysort(diary);
	}

}
