package com.ciji.mapper;

import java.util.List;

import com.ciji.pojo.Collect;
import com.ciji.pojo.User;

public interface CollectMapper {
	//��ȡ�û���Ӧ���ղ���Ϣ
	public List<Collect> get(User user);
	public Collect getById(Collect collect);
	//����ղ�
	public void add(Collect collect);
	//ɾ����Ӧ���ղ�
	public void delete(Collect collect);
}
