package com.ciji.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ciji.mapper.TopicMapper;
import com.ciji.pojo.Topic;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
	
public class TopicTest {
	@Autowired
	private TopicMapper topicMapper;
	
	@Test
	public void testlist() {
		topicMapper.list();
		Topic topic = new Topic();
		topic.setTopic_name("Ô¶·½ÓÐºü");
		
		topicMapper.add(topic);
	}
}
