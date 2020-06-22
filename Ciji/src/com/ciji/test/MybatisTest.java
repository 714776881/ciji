package com.ciji.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ciji.mapper.AdMapper;
import com.ciji.mapper.UserMapper;
import com.ciji.pojo.Administrator;
import com.ciji.pojo.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MybatisTest {
	
	@Autowired
	private AdMapper adMapper;
	
	@Autowired
	private UserMapper userMapper;


	@Test
	public void testList2() {
		List<Administrator> cs=adMapper.list();
		for (Administrator c : cs) {
			System.out.println(c.getAd_name());
		}
	}
	@Test
	public void testCheck() {
		String user_email = "18742033641";
		User user = userMapper.get(user_email); 
		System.out.println(user.getUser_password());
	}
//	@Test
//	public void testAddUser() {
//		String user_email = "714776882@qq.com";
//		String user_password = "liu19970718";
//		User user = new User();
//		user.setUser_email(user_email);
//		user.setUser_password(user_password);
//		userMapper.add(user);
//	}
	
	@Test
	public void testupdate() {
		System.out.println("ssssssssssdasdasdas");
		User user = new User();
		user.setUser_email("187412");
		user.setUser_password("123");
		userMapper.update(user);
	}
	@Test
	public void testNowTime() {
		System.out.println("显示当前时间");
		Date time = userMapper.nowtime();
		System.out.println(time);
	}
}
