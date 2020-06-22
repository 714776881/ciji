package com.ciji.mapper;

import java.util.List;

import com.ciji.pojo.Diary;
import com.ciji.pojo.User;

public interface DiaryMapper {
	//����µ��ռ�
	public int add(Diary diary);
	//ɾ���ռ�
	public void delete(int id);
	//�õ�ָ�����ռ�
	public Diary get(int id);
	//�����ռ�
	public int update(Diary diary);
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
