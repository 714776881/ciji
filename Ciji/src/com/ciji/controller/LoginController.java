package com.ciji.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONObject;
import com.ciji.pojo.Diary;
import com.ciji.pojo.Topic;
import com.ciji.pojo.User;
import com.ciji.service.DiaryService;
import com.ciji.service.TopicService;
import com.ciji.service.UserService;

@Controller
@RequestMapping("")
public class LoginController {

	@Autowired
	UserService userService;
	
	@Autowired
	TopicService topicService;
	
	@Autowired
	DiaryService diaryService;
//	//登录和退出
	@RequestMapping(value = {"/", "/login.html"})
    public String toLogin(HttpServletRequest request) {
        request.getSession().invalidate();
        return "index";
    }
	@RequestMapping("/logout.html")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/login.html";
    }
	
    //负责处理loginCheck.html请求
    //请求参数会根据参数名称默认契约自动绑定到相应方法的入参中
	@RequestMapping(value = "/checkUser", method = RequestMethod.POST)
    public @ResponseBody
    Object checkUser(User u,HttpServletRequest request) {
		String user_email = request.getParameter("name");
		String user_password = request.getParameter("pass");
        HashMap<String, String> res = new HashMap<>();
        User user = userService.get(user_email);
		if(user == null) {
			res.put("stateCode", "1");
			res.put("msg", "无此账号");
		}else if(user.getUser_password().equals(user_password)){

			System.out.println("登录成功");
			Diary diary = new Diary();
			diary.setUser_id(user.getUser_id());
			int sum = diaryService.totalbyid(diary);
			user.setCount(sum);
			request.getSession().setAttribute("user", user);
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy"+"年"+"MM"+"月"+"dd"+"日"+"HH:mm:ss");
			String logintime=sdf.format(userService.nowtime());
			
			if(user.getUser_logintime()!=null&&!user.getUser_logintime().substring(0, 11).equals(logintime.substring(0, 11))) {
				user.setUser_logintime(logintime);
				System.out.println(logintime+"ssssssss"+user.getUser_age());
				user.setUser_age(user.getUser_age()+1);
				userService.update(user);
			}
			
			
			
            res.put("stateCode", "2");
            res.put("msg", "读者登陆成功！");
		} else {
            res.put("stateCode", "0");
            res.put("msg", "密码错误！");
        }
        return res;
    }
	//负责处理loginCheck.html请求
    //请求参数会根据参数名称默认契约自动绑定到相应方法的入参中
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public @ResponseBody
    Object addUser(User u,HttpServletRequest request) {
		String user_email = request.getParameter("name");
		String user_password = request.getParameter("pass");
		System.out.println(user_email+"注册密码为"+user_password);
        HashMap<String, String> res = new HashMap<>();
        User user = userService.get(user_email);
        if(user_password=="") {
        	res.put("stateCode", "0");
			res.put("msg", "密码为空");
        }else if(user != null) {
			res.put("stateCode", "1");
			res.put("msg", "账号已经被注册");
		}else {
			//注册用户
			User nuser = new User();
			nuser.setUser_email(user_email);
			nuser.setUser_password(user_password);
			
			//设置时间
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy"+"年"+"MM"+"月"+"dd"+"日");
			nuser.setUser_regester_time(sdf.format(userService.nowtime()));
			nuser.setUser_logintime(sdf.format(userService.nowtime()));
			nuser.setUser_name("无名氏");
			nuser.setUser_age(1);
			userService.add(nuser);
			System.out.println("注册成功");
			//添加Seesion
			User nnuser = userService.get(user_email);
			request.getSession().setAttribute("user", nnuser);
			//添加我的日记
			Topic topic = new Topic();
			topic.setUser_id(nnuser.getUser_id());
			topic.setTopic_name("每日日记");
			topic.setTopic_sort(2);
			topicService.add(topic);
			System.out.println("添加我的日记成功");
			
            res.put("stateCode", "2");
            res.put("msg", "用户注册成功！");
		}
        return res;
    }
	
	/*
	@RequestMapping(value="/addUser",method=RequestMethod.POST)
	public String addUser(User user,HttpServletRequest request, RedirectAttributes  redirectAttributes){
		ModelAndView mav = new ModelAndView();
		String user_email = user.getUser_email();
		String user_password = user.getUser_password();
		if(user_email == ""||user_password == "") {
			System.out.println("请输入账号和密码");	
		}
		else {
			User nu = new User();
			nu.setUser_email(user_email);
			nu.setUser_password(user_password);
			
			if(userService.get(user_email)==null) {
				userService.add(user);
				System.out.println("注册成功");
				request.getSession().setAttribute("user", user);
				//mav.setViewName("Web-2.0-main");
				return "redirect:/Web-2.0-main.html";
			}	
			else {
				redirectAttributes.addFlashAttribute("error", "账号已经被注册，请选择另一个账号");
			}
		}
		return "redirect:/login.html";
		
	}
	*/
	//设置姓名
	@RequestMapping(value="setName.html",method=RequestMethod.POST)
	public String setName(User user,HttpServletRequest request) throws UnsupportedEncodingException {
		//设置用户名
		if(user.getUser_name().equals(""))
			return "redirect://Web-2.0-main.html";	
		User nuser = (User) request.getSession().getAttribute("user");
		nuser.setUser_name(new String(user.getUser_name().getBytes("iso-8859-1"),"UTF-8"));
		userService.update(nuser);
		System.out.println("设置用户名成功！");
		return "redirect://Web-2.0-main.html";	
	}
	@RequestMapping("/AboutUs.html")
    public ModelAndView toAboutUs(HttpServletRequest request,HttpServletResponse response,Model model) {
		ModelAndView mav = new ModelAndView();
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("user",user);
		System.out.println("转换到设置页面");
		mav.setViewName("AboutUs");
        return mav;
    }
	
	//更新
    @RequestMapping("/user_repasswd.html")
    public ModelAndView reReaderPasswd() {
        return new ModelAndView("Web-2.0-main");
    }
	@RequestMapping("/user_repasswd_do")
    public String reAdminPasswdDo(HttpServletRequest request, String oldPasswd, String newPasswd, String reNewPasswd, RedirectAttributes  redirectAttributes) {
        User user = (User) request.getSession().getAttribute("user");
        String user_email = user.getUser_email();
        System.out.println(oldPasswd+newPasswd+reNewPasswd);
        String password = userService.get(user_email).getUser_password();
        if (password.equals(oldPasswd)) {
        	user.setUser_password(newPasswd);
        	userService.update(user);
        	System.out.println("密码修改成功");
        	redirectAttributes.addFlashAttribute("succ", "密码修改完成！");
        	return "redirect:/user_repasswd.html";
        } else {
            redirectAttributes.addFlashAttribute("error", "旧密码错误！");
            return "redirect:/user_repasswd.html";
        }
    }
	@RequestMapping("/Web-2.0-main.html")
    public String toUserMain(HttpServletRequest request,HttpServletResponse response,Model model, RedirectAttributes  redirectAttributes) {
		ModelAndView mav = new ModelAndView();
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("user",user);
		System.out.println("转换到主页面");
		int id = user.getUser_id();
		List<Topic> cs = userService.listbyid(id);
		mav.addObject("cs", cs);
		mav.setViewName("Web-2.0-main");
		//添加cs1;
//		Topic topic = new Topic();
//		topic.setUser_id(user.getUser_id());
//		topic.setTopic_name("日记");
//		List<Topic> cs1 = topicService.listbyTopic(topic);
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
		//topic.setTopic_name("日记");
		//List<Topic> cs1 = topicService.listbyTopic(topic);

		if(cs1.isEmpty()) {
			Topic ntopic = new Topic();
			ntopic.setUser_id(user.getUser_id());
			ntopic.setTopic_name("每日日记");
			topicService.add(ntopic);
			ntopic.setUser_id(user.getUser_id());
			cs1 = topicService.listbyTopic(ntopic);
			redirectAttributes.addFlashAttribute("error", "最后一个日记目录无法被删除！已经清空成功！");
		}
		mav.addObject("cs1", cs1);
		System.out.println("每日日记读取完成");
		
		
/*
		//添加cs2
		if(!cs1.isEmpty()) {
		Topic activetopic = cs1.get(0);
		List<Topic> cs2 = new ArrayList<Topic>();
		cs2.add(activetopic);
		mav.addObject("cs2", cs2);
		//添加日志
		if(!cs2.isEmpty()) {
		Diary diary = new Diary();
		diary.setTopic_id(cs2.get(0).getTopic_id());
		diary.setUser_id(user.getUser_id());
		List<Diary> ds=diaryService.listbyid(diary);
		mav.addObject("ds", ds);
		}
		}
*/		
		return "redirect:/diaryListByid.html?topic_id="+cs1.get(0).getTopic_id();
		//return new ModelAndView("redirect://diaryListByid.html?topic_id="+cs1.get(0).getTopic_id());
        //return mav;
    }
	   //配置404页面
    @RequestMapping("*")
    public String notFind() {
        return "404";
    }	

}
