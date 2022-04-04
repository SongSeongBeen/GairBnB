package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MyDogService;
import com.javaex.vo.GalleryVo;
import com.javaex.vo.MyDogVo;
import com.javaex.vo.PhotoVo;

@Controller
public class MyDogController {
	
	@Autowired
	MyDogService myDogService;
	
	@RequestMapping("/mydog")
	public String myDogForm(Model model, @RequestParam("usersNo") int usersNo) {
		System.out.println("MyDogController > myDogForm");
		
		//mydog
		MyDogVo mvo = myDogService.myDogSelect(usersNo);
		
		if(mvo != null) {
			String[] arry = mvo.getBirth().split(" ");
			arry[0].replace("-", ".");
			model.addAttribute("mvo",mvo);
			
			return "yu/myDogForm";
		}else {
			
			return "yu/myDogFormFirst";
		}
		
		
	}
	
	//내 강아지 최초 등록
	@RequestMapping("/mydogInsert")
	public String myDogInsert(@ModelAttribute MyDogVo mvo) {
		System.out.println("MyDogController > myDogInsert");
		
		mvo.getBirth().replace(",", "");
		System.out.println(mvo);
		
		myDogService.myDogInsert(mvo);
		
		return "redirect:/mydog?usersNo="+mvo.getUsersNo();
	}
	
	//갤러리 insert
	@ResponseBody
	@RequestMapping("/galleryInsert")
	public String galleryInsert(@ModelAttribute GalleryVo gvo, @RequestParam("bookingNo") int bookingNo) {
		System.out.println("MyDogController > galleryInsert");
		
		myDogService.galleryInsert(gvo);
		
		String result = "s";
		
		return result;
	}
	
	//갤러리 select
	@ResponseBody
	@RequestMapping("/gallerySelect")
	public List<GalleryVo> gallerySelect(int usersNo) {
		System.out.println("MyDogController > gallerySelect");
		
		System.out.println(usersNo);
		
		List<GalleryVo> gList = myDogService.gallerySelect(usersNo);
		
		return gList;
	}
	
	//mydog update
	@RequestMapping("/mydogPhotoUpdate")
	public String mydogPhotoUpdate(PhotoVo pvo) {
		System.out.println("MyDogController > mydogPhotoUpdate");
		
		System.out.println(pvo);
		
		myDogService.myDogPhotoUpdate(pvo);
		
		return "redirect:/mydog?usersNo="+pvo.getUsersNo();
	}

}
