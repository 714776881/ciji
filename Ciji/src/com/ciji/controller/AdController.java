package com.ciji.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ciji.pojo.Administrator;
import com.ciji.service.AdService;


@Controller
@RequestMapping("")
public class AdController {
	@Autowired
	AdService adService;
	@RequestMapping(value="/Myinfo",method=RequestMethod.GET)
	public ModelAndView listCategory(){
		ModelAndView mav = new ModelAndView();
		List<Administrator> cs= adService.list();
		mav.addObject("cs", cs);
		mav.setViewName("Myinfo");
		return mav;
	}
}
