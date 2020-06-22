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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ciji.pojo.Collect;
import com.ciji.pojo.Comment;
import com.ciji.pojo.Diary;
import com.ciji.pojo.Diaryplus;
import com.ciji.pojo.Topic;
import com.ciji.pojo.User;
import com.ciji.service.CollectService;
import com.ciji.service.CommentService;
import com.ciji.service.DiaryService;
import com.ciji.service.TopicService;
import com.ciji.service.UserService;

@Controller
@RequestMapping("")
public class SouSuoController {
	@Autowired
	TopicService topicService;
	@Autowired
	DiaryService diaryService;
	@Autowired
	UserService userService;
	@Autowired
	CollectService collectService;
	@Autowired
	CommentService commentService;
	@RequestMapping("/sousuo.go")
	public ModelAndView goSouSuo(HttpServletRequest request,Model model) {
		ModelAndView mav = new ModelAndView();
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("user",user);
		Topic topic = new Topic();
		topic.setUser_id(1);
		topic.setTopic_sort(3);
		List<Topic> cs = topicService.listbyTopicSort(topic);
		topic.setTopic_sort(4);
		cs.addAll(topicService.listbyTopicSort(topic));
		mav.addObject("cs", cs);
		List<Topic> cs2 = new ArrayList<Topic>();
		if(!cs.isEmpty()) {
			cs2.add(cs.get(0));
			mav.addObject("cs2", cs2);
			Diary diary = new Diary();
			diary.setTopic_id(cs.get(0).getTopic_id());
			List<Diary> ds=diaryService.listbysort(diary);
			if(cs.get(0).getTopic_sort()==4) {
				List<Integer> zs = new ArrayList<Integer>();
				zs.add(1);
				System.out.println("可以进行编辑");
				mav.addObject("ds2",zs);
			}	
			mav.addObject("ds", ds);
		}
		mav.setViewName("Web-3.0");
		return mav;
	}
	@RequestMapping("/sousuo.html")
	public ModelAndView diarylist(HttpServletRequest request,Model model, RedirectAttributes  redirectAttributes) {
		ModelAndView mav = new ModelAndView();
		String word=request.getParameter("word");
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("user",user);
		try {
			word = new String(word.getBytes("iso-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println("word:"+word);
		Topic topic = new Topic();
		topic.setTopic_name(word);
		topic.setTopic_sort(3);
		List<Topic> cs = topicService.listbyTopic(topic);
		topic.setTopic_sort(4);
		cs.addAll(topicService.listbyTopic(topic));
		if(cs.size()==1)
		{
			List<Topic> zs = new ArrayList<Topic>();
			Topic t = new Topic();
			t.setTopic_id(topic.getTopic_id());
			zs.add(t);
			mav.addObject("zs", zs);
		}
		if(!cs.isEmpty()) {
			if(cs.size()>4) {
				List<Integer> is = new ArrayList<Integer>();
				is.add(1);
				mav.addObject("is", is);
			}	
			List<Topic> cs2 = new ArrayList<Topic>();
			cs2.add(cs.get(0));
			mav.addObject("cs2", cs2);
			mav.addObject("cs", cs);
			Diary diary = new Diary();
			diary.setTopic_id(cs.get(0).getTopic_id());
			List<Diary> ds=diaryService.listbysort(diary);
			if(cs.get(0).getTopic_sort()==4) {
				List<Topic> zs = new ArrayList<Topic>();
				Topic t = new Topic();
				t.setTopic_id(topic.getTopic_id());
				zs.add(t);
				System.out.println("可以进行编辑");
				mav.addObject("ds2",zs);
			}	
			mav.addObject("ds", ds);
		}else {
			System.out.println("搜索失败");
			redirectAttributes.addFlashAttribute("succ", "没有搜索结果！！！请查看搜索词是否为空，或者换词语搜索");
		}
		mav.setViewName("Web-3.0");
		return mav;
	}
	@RequestMapping("/diaryListBySort.html")
	public ModelAndView diaryList(HttpServletRequest request,Model model){
		ModelAndView mav = new ModelAndView();
		//通过目录id寻找相应的目录
		int topic_id=Integer.parseInt(request.getParameter("topic_id"));
		Topic activetopic = topicService.get(topic_id);
		List<Topic> cs2 = new ArrayList<Topic>();
		cs2.add(activetopic);
		mav.addObject("cs2", cs2);
		//为添加日志增加赋值id
		model.addAttribute("topic_id",topic_id);
		List<Topic> zs = new ArrayList<Topic>();
		Topic t = new Topic();
		t.setTopic_id(topic_id);
		zs.add(t);
		mav.addObject("zs",zs);
		//设置id
		if(!cs2.isEmpty()) {
			Diary diary = new Diary();
			diary.setTopic_id(topic_id);
			List<Diary> ds=diaryService.listbysort(diary);
			if(cs2.get(0).getTopic_sort()==4) {
				List<Integer> ns = new ArrayList<Integer>();
				ns.add(1);
				System.out.println("可以进行编辑");
				mav.addObject("ds2",ns);
			}	
			mav.addObject("ds", ds);
		}
		mav.setViewName("Web-3.0");
		return mav;
	}
	@RequestMapping("/commentListBySort.html")
	public ModelAndView commentList(HttpServletRequest request,Model model){
		ModelAndView mav = new ModelAndView();
		//通过目录id寻找相应的目录
		int topic_id=Integer.parseInt(request.getParameter("topic_id"));
		Topic activetopic = topicService.get(topic_id);
		List<Topic> cs2 = new ArrayList<Topic>();
		cs2.add(activetopic);
		mav.addObject("cs2", cs2);
		//为添加日志增加赋值id
		model.addAttribute("topic_id",topic_id);
		List<Topic> zs = new ArrayList<Topic>();
		Topic t = new Topic();
		t.setTopic_id(topic_id);
		zs.add(t);
		mav.addObject("zs",zs);
		//设置id
		if(!cs2.isEmpty()) {
			Diary diary = new Diary();
			diary.setTopic_id(topic_id);
			List<Diary> ds=diaryService.listbysort(diary);
			List<Diaryplus> dp = new ArrayList<Diaryplus>();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = sdf.format(userService.nowtime());
			for (Diary diary2 : ds) {
				Diaryplus diaryplus = new Diaryplus();
				diaryplus.setDiary_id(diary2.getDiary_id());
				diaryplus.setDiary_title(diary2.getDiary_title());
				diaryplus.setDiary_content(diary2.getDiary_content());
				diaryplus.setDiary_editdate(diary2.getDiary_editdate());
				diaryplus.setDiary_updatedate(diary2.getDiary_updatedate());
				diaryplus.setTopic_id(diary2.getTopic_id());
				diaryplus.setUser_id(diary2.getUser_id());
				diaryplus.setDiary_likes(diary2.getDiary_likes());
				System.out.println("sdsd");
				List<Comment> lc = commentService.getByid(diary2.getDiary_id());
				System.out.println("sdsd");
				if(!lc.isEmpty())
					diaryplus.setComment(lc);
				else
				{
					Comment c = new Comment();
					c.setDate(time);
					c.setContent("还没有人评论,来抢占个沙发吧！！");
					c.setUser_name("无名氏");
					lc.add(c);
					diaryplus.setComment(lc);
				}
					
				dp.add(diaryplus);
			}
			if(cs2.get(0).getTopic_sort()==4) {
				List<Integer> ns = new ArrayList<Integer>();
				ns.add(1);
				System.out.println("可以进行编辑");
				mav.addObject("ds2",ns);
			}
			
			mav.addObject("dp", dp);
		}
		mav.setViewName("Web-3.0");
		return mav;
	}
	@RequestMapping(value="/addTopicLikesById.html",method=RequestMethod.POST)
	public ModelAndView addTopicLikesById(Topic topic) {
		Topic t = topicService.get(topic.getTopic_id());
		t.setTopic_likes(t.getTopic_likes()+1);
		topicService.update(t);
		return new ModelAndView("redirect://diaryListBySort.html?topic_id="+topic.getTopic_id());
	}
	@RequestMapping(value="/addCollectById.html",method=RequestMethod.POST)
	public ModelAndView addCollectById(Collect collect,HttpServletRequest request, RedirectAttributes  redirectAttributes,Model model){
		ModelAndView mav = new ModelAndView();
		User user = (User) request.getSession().getAttribute("user");
	    collect.setUser_id(user.getUser_id());
	    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    collect.setDate(sdf.format(userService.nowtime()));
	    collectService.getById(collect);
	    if(collectService.getById(collect)==null) {
	    	collectService.add(collect);
	    	List<Integer> succ = new ArrayList<Integer>();
			succ.add(1);
			System.out.println("可以进行编辑");
			mav.addObject("succ",succ);
	    	mav.setViewName("redirect://diaryListBySort.html?topic_id="+collect.getTopic_id());
	    	return mav;
	    }
	    else {
	    	List<Integer> error = new ArrayList<Integer>();
	    	error.add(1);
			System.out.println("可以进行编辑");
			mav.addObject("error",error);
            mav.setViewName("redirect://diaryListBySort.html?topic_id="+collect.getTopic_id());
	    	return mav;
	    }
	}
	@RequestMapping(value="/addDiary2.html",method=RequestMethod.POST)
	public ModelAndView addDiary2(Diary diary,HttpServletRequest request,Model model) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
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
		mav.setViewName("redirect://diaryListBySort.html?topic_id="+diary.getTopic_id());
		return mav;
	}
	@RequestMapping(value="/addCommentById.html",method=RequestMethod.POST)
	public ModelAndView addCommentById(Comment comment,HttpServletRequest request, RedirectAttributes  redirectAttributes,Model model){
		ModelAndView mav = new ModelAndView();
		int topic_id=Integer.parseInt(request.getParameter("topic_id"));
		System.out.println("SouSuoController.addCommentById()");
		User user = (User) request.getSession().getAttribute("user");
	    comment.setUser_name(user.getUser_name());
	    try {
			comment.setContent(new String(comment.getContent().getBytes("iso-8859-1"),"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"+" 记");
		comment.setDate(sdf.format(userService.nowtime()));
	    commentService.add(comment);
	    mav.setViewName("redirect://commentListBySort.html?topic_id="+topic_id);
	    return mav;
	}
	
}
