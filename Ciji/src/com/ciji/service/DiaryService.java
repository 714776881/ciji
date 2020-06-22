package com.ciji.service;

import java.util.List;

import com.ciji.pojo.Diary;

public interface DiaryService {
	//����µ��ռ�
		public void add(Diary diary);
		//ɾ���ռ�
		public void delete(int id);
		//�õ�ָ�����ռ�
		public Diary get(int id);
		//�����ռ�
		public void update(Diary diary);
		//�г��ռ�
		public List<Diary> list();
		//�г��û�����־
		public List<Diary> listbyid(Diary diary);
		//
		public List<Diary> listbysort(Diary diary);
		//
		public int total();
		//�û����¼���
		public int totalbyid(Diary diary);
}
