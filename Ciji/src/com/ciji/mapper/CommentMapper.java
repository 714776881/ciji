package com.ciji.mapper;
import java.util.List;

import com.ciji.pojo.Comment;
public interface CommentMapper {
	//��ȡ�ռǶ�Ӧ��������Ϣ
	public List<Comment> getByid(int show_id);
	//�������
	public void add(Comment comment);
}
