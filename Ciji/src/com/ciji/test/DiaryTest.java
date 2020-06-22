package com.ciji.test;

import java.sql.Timestamp;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ciji.mapper.DiaryMapper;
import com.ciji.mapper.UserMapper;
import com.ciji.pojo.Diary;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DiaryTest {
	@Autowired
	private DiaryMapper diaryMapper;
	@Autowired
	private UserMapper userMapper;
	@Test
	public void testTotal() {
			Diary diary = new Diary();
			diary.setDiary_title("春天的时刻6666");
			diary.setDiary_content("ssssssssssdfffffffffffffsdfasf");
			System.out.println("显示当前时间");
			Date time = userMapper.nowtime();
			System.out.println(time);
			diary.setTopic_id(2);
			diary.setUser_id(1);
			diaryMapper.add(diary);
	}
	@Test
	public void testList() {
		diaryMapper.list();
	}
}
