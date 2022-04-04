package com.javaex.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.BookingService;
import com.javaex.vo.AbleVo;
import com.javaex.vo.BookingVo;
import com.javaex.vo.HostVo;
import com.javaex.vo.MyDogVo;
import com.javaex.vo.PhotoVo;
import com.javaex.vo.UserVo;

@Controller
public class BookingController {
	
	@Autowired
	BookingService bookingService;
	
	//달력 이벤트
	@ResponseBody
	@RequestMapping("/calendar")
	public List<BookingVo> date(@RequestParam int hostNo) {
		
		//예약 + 게스트 리스트 가져오기
		List<BookingVo> bList = bookingService.bookingEndHost(hostNo);
		
		return bList;
	}
	
	//달력 이벤트(가능날짜)
	@ResponseBody
	@RequestMapping("/calendarAble")
	public List<AbleVo> dateAble(@RequestParam int hostNo) {
		
		List<AbleVo> aList = bookingService.ableList(hostNo);

		
		return aList;
	}
	
	//달력
	//예약리스트(호스트)에서 가능날짜추가 or 취소
	@RequestMapping("/bookingEndHostDate")
	public String bookingEndHostDate(@RequestParam int hostNo, @RequestParam String date) {
		System.out.println("BookingController > bookingEndHost");

		String[] array = date.split(" ");
		date = array[0].replace("-", "");
		
		List<AbleVo> aList = bookingService.ableList(hostNo);
		String result = null;
		
		for(int i=0; i<aList.size(); i++) {
			String date2 = aList.get(i).getAbleDate();
			if(date.equals(date2)) {
				result = "중복";
			}
		}
		
		if(result != "중복") {
			bookingService.ableInsert(hostNo, date);
		}else {
			bookingService.ableDelete(hostNo, date);
		}
		
		return "redirect:/bookingEndHost?hostNo="+hostNo;
	}
	
	//가능날짜천제취소
	@RequestMapping("/bookingEndHostDelete")
	public String bookingEndHostDelete(@RequestParam int hostNo) {
		System.out.println("BookingController > bookingEndHostDelete");
		
		bookingService.ableDeleteAll(hostNo);
		
		return "redirect:/bookingEndHost?hostNo="+hostNo;
	}
	
	
	//결제대기화면(게스트)띄우기
	@RequestMapping("/bookingBeforeGuest")
	public String bookingBeforeGuest(Model model, @RequestParam int usersNo) {
		System.out.println("결제대기(게스트)");
		
		//예약 + 호스트 리스트 가져오기
		List<BookingVo> BookingList = bookingService.bookingBeforeGuest(usersNo);
		
		model.addAttribute("bList", BookingList);
		
		return "yu/reservation-guest";
	}
	
	//결제대기화면(호스트)띄우기
	@RequestMapping("/bookingBeforeHost")
	public String bookingBeforeHost(Model model, @RequestParam int hostNo) {
		System.out.println("결제대기(호스트)");
		
		//예약 + 게스트 리스트 가져오기
		List<BookingVo> BookingList = bookingService.bookingBeforeHost(hostNo);
		
		model.addAttribute("bList", BookingList);
		
		return "yu/reservation-host";
	}
	
	//결제대기화면(호스트)띄우기, 특정일자만
	@RequestMapping("/bookingBeforeHostDate")
	public String bookingBeforeHost(Model model, @RequestParam int hostNo, @RequestParam String date) {
		System.out.println("결제대기날짜입력(호스트)");
		
		BookingVo bookingVo = new BookingVo();
		bookingVo.setCheckin(date);
		bookingVo.setHostNo(hostNo);
		
		//예약 + 게스트 리스트 가져오기
		List<BookingVo> BookingList = bookingService.bookingDateList(bookingVo);
		model.addAttribute("bList", BookingList);
		
		if(BookingList.isEmpty()) {
			return "redirect:/bookingBeforeHost?hostNo="+hostNo;
		}else {
			return "yu/reservation-host";
		}
		
	}
	
	//예약상세페이지 띄우기(게스트)
	@RequestMapping("/bookingDetailGuest")
	public String bookingDetailGuest(Model model, @RequestParam int bookingNo) {
		System.out.println("결제대기(게스트)");
		
		//예약 + 호스트 가져오기
		BookingVo bvo = bookingService.bookingDetailGuest(bookingNo);
		model.addAttribute("bvo", bvo);

		List<List<PhotoVo>> pList = new ArrayList<List<PhotoVo>>();

		for(int i=0; (i+1)<=bvo.getDays(); i++) {
			//포토 리스트 가져오기
			int day = i+1;
			List<PhotoVo> pListDate = bookingService.bookingGallery(bookingNo, day);
			pList.add(pListDate);
		}
		
		//mydog
		MyDogVo mvo = bookingService.mydogSelect(bvo.getUsersNo());
		
		if(mvo != null) {
			String[] arry = mvo.getBirth().split(" ");
			arry[0].replace("-", ".");
			model.addAttribute("mvo",mvo);
		}
		
		model.addAttribute("pList", pList);
		
		return "yu/bookingDetail-guest";
	}
	
	//예약상세페이지 띄우기(호스트)
	@RequestMapping("/bookingDetailHost")
	public String bookingDetailHost(Model model, @RequestParam int bookingNo) {
		System.out.println("결제대기(호스트)");
		
		//예약 + 게스트 가져오기
		BookingVo bvo = bookingService.bookingDetailHost(bookingNo);
		model.addAttribute("bvo", bvo);
		
		List<List<PhotoVo>> pList = new ArrayList<List<PhotoVo>>();

		for(int i=0; (i+1)<=bvo.getDays(); i++) {
			//포토 리스트 가져오기
			int day = i+1;
			List<PhotoVo> pListDate = bookingService.bookingGallery(bookingNo, day);
			pList.add(pListDate);
		}
		
		model.addAttribute("pList", pList);
		
		//mydog
		MyDogVo mvo = bookingService.mydogSelect(bvo.getUsersNo());
		String[] arry = mvo.getBirth().split(" ");
		arry[0].replace("-", ".");
		model.addAttribute("mvo",mvo);
		
		return "yu/bookingDetail-host";
	}
	
	//인증사진 업로드
	@RequestMapping("/photoInsert")
	public String photoInsert(Model model, @ModelAttribute PhotoVo pvo) throws ParseException {
		System.out.println("사진업로드");
		
		String date = pvo.getPhotoDate();
		System.out.println("date: " + date);
		date = date.replace(",", "");
		pvo.setPhotoDate(date);
		bookingService.photoInsert(pvo);

		return "redirect:/bookingDetailHost?bookingNo="+pvo.getBookingNo();
	}
	
	//이미지 클릭시 상세보기
	@ResponseBody
	@RequestMapping("/viewImg")
	public PhotoVo photoInsert(@RequestParam("no") int photoNo) {
		System.out.println("사진상세보기");
		
		PhotoVo pvo = bookingService.photoView(photoNo);

		return pvo;
	}
	
	//예약리스트(호스트)
	@RequestMapping("/bookingEndHost")
	public String bookingEndHost(Model model, @RequestParam int hostNo) {
		System.out.println("BookingController > bookingEndHost");
		
		//예약 + 게스트 리스트 가져오기
		List<BookingVo> BookingList = bookingService.bookingEndHost(hostNo);
		
		//호스트정보(노출여부) 가져오기
		HostVo hvo = bookingService.selectHost(hostNo);
		
		model.addAttribute("bList", BookingList);
		model.addAttribute("hvo", hvo);

		return "yu/reservation-end-host";
	}
	
	//검색노출 on
	@RequestMapping("/viewAble")
	public String viewAble(@RequestParam int hostNo, @RequestParam int view) {
		System.out.println("BookingController > viewAble");
		
		bookingService.viewAble(hostNo, view);
		String result = "s";
		
		return result;
	}
	
	//예약승인버튼누름
	@RequestMapping("/updateStatus")
	public String updateStatus(@RequestParam int bookingNo, @RequestParam int hostNo) {
		System.out.println("BookingController > statusChange");
		
		bookingService.updateStatus(bookingNo);
		
		return "redirect:/bookingBeforeHost?hostNo="+hostNo;
	}
	
	//예약리스트(게스트)
	@RequestMapping("/bookingEndGuest")
	public String bookingEndGuest(@RequestParam int usersNo, Model model) {
		System.out.println("BookingController > bookingEndGuest");
		
		//예약 + 호스트 리스트 가져오기
		List<BookingVo> BookingList = bookingService.bookingEndGuest(usersNo);
		
		model.addAttribute("bList", BookingList);
		
		return "yu/reservation-end-guest";
	}
	
	//회원가입
	@RequestMapping("/join")
	public String join(UserVo uvo) {
		System.out.println("BookingController > join");
		
		bookingService.join(uvo);
		
		return "redirect:/main";
	}
	
	//로그인
	@RequestMapping("/login")
	public String login(UserVo uvo, HttpSession session) {
		System.out.println("BookingController > login");
		
		UserVo authUser = bookingService.login(uvo);
		System.out.println(authUser);
		
		if(authUser != null) {
			session.setAttribute("authUser", authUser);
		}
		
		return "redirect:/main";
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("BookingController > logout");
		
		//세션의 정보 삭제
		session.removeAttribute("authUser");
		session.invalidate();

		return "redirect:/main";
	}
	
	//모바일 예약상세
	@RequestMapping("/m/bookingDetailHost")
	public String bookingDetailHostM(Model model, @RequestParam int bookingNo) {
		System.out.println("BookingController > bookingDetailHostM");
		
		//예약 + 게스트 가져오기
		BookingVo bvo = bookingService.bookingDetailHost(bookingNo);
		model.addAttribute("bvo", bvo);
		
		List<List<PhotoVo>> pList = new ArrayList<List<PhotoVo>>();

		for(int i=0; (i+1)<=bvo.getDays(); i++) {
			//포토 리스트 가져오기
			int day = i+1;
			List<PhotoVo> pListDate = bookingService.bookingGallery(bookingNo, day);
			pList.add(pListDate);
		}
		
		model.addAttribute("pList", pList);
		
		return "yu/bookingDetail-mobile";
	}
	
	//모바일 예약상세
		@RequestMapping("/m/bookingDetailGuset")
		public String bookingDetailGusetM(Model model, @RequestParam int bookingNo) {
			System.out.println("BookingController > bookingDetailGusetM");
			
			//예약 + 게스트 가져오기
			BookingVo bvo = bookingService.bookingDetailGuest(bookingNo);
			model.addAttribute("bvo", bvo);
			
			List<List<PhotoVo>> pList = new ArrayList<List<PhotoVo>>();

			for(int i=0; (i+1)<=bvo.getDays(); i++) {
				//포토 리스트 가져오기
				int day = i+1;
				List<PhotoVo> pListDate = bookingService.bookingGallery(bookingNo, day);
				pList.add(pListDate);
			}
			
			model.addAttribute("pList", pList);
			
			return "yu/bookingDetail-mobile";
		}
	
	//모바일 메인
	@RequestMapping("/m/main")
	public String mainM() {
		System.out.println("BookingController > mainM");
		
		return "yu/main-mobile";
	}
	/*
	//모바일 로그인
	@RequestMapping("/m/login")
	public String loginM(UserVo uvo, HttpSession session, Model model) {
		System.out.println("BookingController > loginM");
		
		int bookinNo = 0;
		
		UserVo authUser = bookingService.login(uvo);
		System.out.println(authUser);
		
		if(authUser != null) {
			session.setAttribute("authUser", authUser);
		}else {
			
			return "redirect:m/main";
		}
		
		//예약 + 게스트 리스트 가져오기
		List<BookingVo> BookingList = bookingService.bookingEndHost(authUser.getHostNo());
		
		for(int i=0; i<BookingList.size(); i++) {
			if(BookingList.get(i).getStatus().equals("펫시팅중")) {
				bookinNo = BookingList.get(i).getBookingNo();
			}
		}
		
		System.out.println(bookinNo);
		return "redirect:/m/bookingDetailHost?bookingNo="+bookinNo;
		
	}*/
	
	//모바일 로그인
	@RequestMapping("/m/login")
	public String loginM(UserVo uvo, HttpSession session, Model model) {
		System.out.println("BookingController > loginM");
		
		int bookinNo = 0;
		
		UserVo authUser = bookingService.login(uvo);
		System.out.println(authUser);
		
		if(authUser != null) {
			session.setAttribute("authUser", authUser);
		}else {
			
			return "redirect:m/main";
		}
		
		//예약 + 게스트 리스트 가져오기
		List<BookingVo> BookingList = bookingService.bookingEndGuest(authUser.getUsersNo());
		
		for(int i=0; i<BookingList.size(); i++) {
			if(BookingList.get(i).getStatus().equals("펫시팅중")) {
				bookinNo = BookingList.get(i).getBookingNo();
			}
		}
		
		System.out.println(bookinNo);
		return "redirect:/m/bookingDetailHost?bookingNo="+bookinNo;
		
	}
	
	
	
	

}
