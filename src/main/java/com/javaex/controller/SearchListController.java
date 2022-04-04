package com.javaex.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.SearchListService;
import com.javaex.vo.SearchListVo;

@Controller
public class SearchListController {
	@Autowired
	private SearchListService searchListService;
	
	@RequestMapping("/searchList")
	public String searchList(@ModelAttribute SearchListVo searchListVo, ModelMap model ) {
		
		System.out.println("searchList.controller");
		
		System.out.println(searchListVo);
		
		List<SearchListVo> SearchList = searchListService.searchListD(searchListVo);
	
		model.addAttribute("searchList", SearchList);
		
		return"song/searchList";
	}
	
	@RequestMapping("/searchList2")
	public String bList2(Model model, 
						@RequestParam(value = "crtPage", required = false, defaultValue="1")int crtPage) {
			System.out.println("BoardController.bList2()");
			System.out.println(crtPage);
			
			//해당페이지에 글 리스트 10개만 줘라
			Map<String, Object> pMap = searchListService.searchListD2(crtPage);
			
			model.addAttribute("pMap", pMap);
			
			return "board/list";
			}
	
	
}
