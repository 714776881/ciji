package com.ciji.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ciji.pojo.Diary;
import com.ciji.pojo.Topic;
import com.ciji.pojo.User;
import com.ciji.service.DiaryService;
import com.ciji.service.TopicService;
import com.ciji.service.UserService;

@Controller
@RequestMapping("")
public class TopicDiaryController {
	@Autowired
	TopicService topicService;
	@Autowired
	DiaryService diaryService;
	@Autowired
	UserService userService;
	@RequestMapping(value="/addTopic.html",method=RequestMethod.POST)
	public ModelAndView addTopic(Topic topic,HttpServletRequest request) throws UnsupportedEncodingException {
		topic.setTopic_name(new String(topic.getTopic_name().getBytes("iso-8859-1"),"UTF-8"));
		if(topic.getTopic_name().equals("")) {
			topic.setTopic_name("未命名");
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"+" 记");
		topic.setTopic_date(sdf.format(userService.nowtime()));
		User user = (User) request.getSession().getAttribute("user");
		topic.setUser_id(user.getUser_id());
		topicService.add(topic);
		//return "redirect://Web-2.0-main.html";
		List<Topic> cs = userService.listbyid(user.getUser_id());
		Topic top = cs.get(0);
		return new ModelAndView("redirect://diaryListByid.html?topic_id="+top.getTopic_id());
	}
	@RequestMapping(value="deleteTopicById.do/{topic_id}",method=RequestMethod.GET)
	public String deleteTopicById(@PathVariable int topic_id,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("user");
		System.out.println(topic_id);
		topicService.delete(topic_id);
		System.out.println("删除成功"+topic_id);
		return "redirect://Web-2.0-main.html";
	}	
	@RequestMapping(value="updateTopic.html",method=RequestMethod.POST)
	public ModelAndView updateTopic(Topic topic,HttpServletRequest request) throws UnsupportedEncodingException {
		User user = (User) request.getSession().getAttribute("user");
		topic.setTopic_name(new String(topic.getTopic_name().getBytes("iso-8859-1"),"UTF-8"));
		topic.setUser_id(user.getUser_id());
		System.out.println("name"+topic.getTopic_name()+"id:"+topic.getTopic_id());
		if(topic.getTopic_name().equals("")&&topic.getTopic_sort()==0) {
			return new ModelAndView("redirect://diaryListByid.html?topic_id="+topic.getTopic_id());
		}
		Topic oldTopic = topicService.get(topic.getTopic_id());
		if(topic.getTopic_name().equals("")) {
			topic.setTopic_name(oldTopic.getTopic_name());
		}
		if(topic.getTopic_sort()==0) {
			topic.setTopic_sort(oldTopic.getTopic_sort());
		}
		topicService.update(topic);
		System.out.println("更改目录成功"+topic.getTopic_sort());
		return new ModelAndView("redirect://diaryListByid.html?topic_id="+topic.getTopic_id());
	}
	@RequestMapping("/diaryListByid.html")
	public ModelAndView diaryList(HttpServletRequest request,Model model){
		ModelAndView mav = new ModelAndView();
		
		User user = (User) request.getSession().getAttribute("user");
		//通过目录id寻找相应的目录
		int topic_id=Integer.parseInt(request.getParameter("topic_id"));
		System.out.println("topic_id:"+topic_id);
		Topic activetopic = topicService.get(topic_id);
		List<Topic> cs2 = new ArrayList<Topic>();
		cs2.add(activetopic);
		mav.addObject("cs2", cs2);
		//		model.addAttribute("user",user);
		System.out.println("输出查找结果");
		List<Topic> cs = userService.listbyid(user.getUser_id());
		mav.addObject("cs", cs);
		System.out.println("数据读取完成");
		
		//为添加日志增加赋值id
		model.addAttribute("topic_id",topic_id);
		System.out.println(topic_id+"已被输出");
		//设置id
		Diary diary = new Diary();
		diary.setTopic_id(topic_id);
		diary.setUser_id(user.getUser_id());
		List<Diary> ds=diaryService.listbyid(diary);
		//添加日记，分享，收藏;
				Topic topic = new Topic();
				topic.setUser_id(user.getUser_id());
				topic.setTopic_sort(2);
				List<Topic> cs1 = topicService.listbyTopicSort(topic);
				mav.addObject("cs1", cs1);
				topic.setTopic_sort(3);
				List<Topic> cs3 = topicService.listbyTopicSort(topic);
				topic.setTopic_sort(4);
				cs3.addAll( topicService.listbyTopicSort(topic));
				mav.addObject("cs3", cs3);
				topic.setTopic_sort(5);
				//List<Topic> cs4 = topicService.listbyTopicSort(topic);
				List<Topic> cs4 = topicService.getCollect(user.getUser_id());
				mav.addObject("cs4", cs4);
				mav.addObject("cs4", cs4);
				//topic.setTopic_name("日记");
				//List<Topic> cs1 = topicService.listbyTopic(topic);

				System.out.println("每日日记读取完成");
	
		mav.addObject("ds", ds);
		mav.setViewName("Web-2.0-main");
		return mav;
	}
	@RequestMapping(value="/addDiary.html",method=RequestMethod.POST)
	public ModelAndView addDiary(Diary diary,HttpServletRequest request,Model model) throws UnsupportedEncodingException {
		diary.setDiary_title(new String(diary.getDiary_title().getBytes("iso-8859-1"),"UTF-8"));
		diary.setDiary_content(new String(diary.getDiary_content().getBytes("iso-8859-1"),"UTF-8"));
		System.out.println("增加日志"+diary.getDiary_title());
		User user = (User) request.getSession().getAttribute("user");
		diary.setUser_id(user.getUser_id());
		//设置topic
				if(diary.getTopic_id()==0) {
					diary.setTopic_id(user.getUser_id()+1);
				}
		//设置时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"+" 记");
		diary.setDiary_editdate(sdf.format(userService.nowtime()));
		diary.setDiary_updatedate(sdf.format(userService.nowtime()));
		
		//添加日记
		if(diary.getDiary_title().equals("")) {
			SimpleDateFormat sdf2=new SimpleDateFormat("yyyy"+"年"+"M"+"月"+"d"+"日");
			diary.setDiary_title(sdf2.format(userService.nowtime()));
		}
		diaryService.add(diary);
		System.out.println("添加新的日志成功");
		
		return new ModelAndView("redirect://diaryListByid.html?topic_id="+diary.getTopic_id());
		
	}
		@RequestMapping(value="updateDiary.html",method=RequestMethod.POST)
	public ModelAndView updateDiary(Diary diary,HttpServletRequest request) throws UnsupportedEncodingException {
		User user = (User) request.getSession().getAttribute("user");
		diary.setDiary_title(new String(diary.getDiary_title().getBytes("iso-8859-1"),"UTF-8"));
		diary.setDiary_content(new String(diary.getDiary_content().getBytes("iso-8859-1"),"UTF-8"));
		diary.setUser_id(user.getUser_id());
		//设置时间
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"+" 修");
		diary.setDiary_updatedate(sdf.format(userService.nowtime()));
		if(diary.getDiary_title().equals("")) {
			diary.setDiary_title("未命名笔记");
		}
		diaryService.update(diary);
		System.out.println("更改目录成功");
		return new ModelAndView("redirect://diaryListByid.html?topic_id="+diary.getTopic_id());
	}
		@RequestMapping("/deleteDiaryById.html")
	public ModelAndView deleteDiaryById(HttpServletRequest request){
			int diary_id=Integer.parseInt(request.getParameter("diary_id"));
			int topic_id=Integer.parseInt(request.getParameter("topic_id"));
			User user = (User) request.getSession().getAttribute("user");
			System.out.println(diary_id+"被删除");
			//通过userid和diary_id进行删除
			diaryService.delete(diary_id);
			
			return new ModelAndView("redirect://diaryListByid.html?topic_id="+topic_id);
		}

}
