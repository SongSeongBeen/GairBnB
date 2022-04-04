package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

		@RequestMapping("main")
		public String Main() {
			
			return "song/index";
		}

		@RequestMapping("admin")
		public String joinForm() {
			
			return "song/admin";
		}
}	
	