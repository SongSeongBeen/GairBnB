package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.ReviewService;
import com.javaex.vo.ReviewVo;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/review", method = {RequestMethod.GET, RequestMethod.POST})
	public String review() {
		System.out.println("[리뷰 시작]");
		
		return "kang/review";
	}
	
	@RequestMapping(value="/reviewF", method = {RequestMethod.GET, RequestMethod.POST})
	public String reviewF(@ModelAttribute ReviewVo reviewVo,
						  @RequestParam("usersNo")int usersNo) {
		System.out.println("[리뷰 보냄]");
		reviewVo.setUsersNo(usersNo);
		reviewService.review(reviewVo);
		
		return "redirect:/bookingEndGuest?usersNo="+usersNo;
	}

}
