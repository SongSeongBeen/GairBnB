package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.BookingDao;
import com.javaex.dao.HostinfoDao;
import com.javaex.vo.BookingVo;
import com.javaex.vo.HeartVo;
import com.javaex.vo.HostVo;
import com.javaex.vo.KeywordVo;
import com.javaex.vo.PhotoVo;
import com.javaex.vo.ReviewVo;

@Service
public class HostinfoService {

	@Autowired
	HostinfoDao hostinfoDao;
	
	@Autowired
	BookingDao bookingDao;
	
	//hostNo 체크
	public int checkNo(int hostNo) {
		System.out.println("[HostinfoService.checkNo()]");
		return hostinfoDao.checkNo(hostNo);
	}
	
	//호스트 데이터 가져오기
	public Map<String, Object> getHostMap(int hostNo, int crtPage) {
		System.out.println("[HostinfoService.list()]");
		Map<String, Object> hostMap = new HashMap<String, Object>();
		//호스트 정보
		HostVo hostVo = hostinfoDao.getHost(hostNo);
		//키워드 리스트
		List<KeywordVo> keyList = hostinfoDao.getHostKeyword(hostNo);
		//리뷰 리스트, 페이징
		int listCnt = 8;
		crtPage = (crtPage>0) ? crtPage : (crtPage=1);
		int startRnum = ((crtPage-1)*listCnt) + 1;
		int endRnum = (startRnum + listCnt) - 1;
		List<ReviewVo> reviewList = hostinfoDao.getReview(hostNo, startRnum, endRnum);
		int totalCnt = hostinfoDao.getReviewCount(hostNo);
		int pageBtnCount = 5;
		int endPageBtnNo = (int)( Math.ceil(crtPage/(double)pageBtnCount ) )*pageBtnCount;
		int startPageBtnNo = endPageBtnNo - (pageBtnCount-1);
		boolean next = false;
		if(endPageBtnNo*listCnt < totalCnt) {
			next = true;
		} else { 
			endPageBtnNo = (int)(Math.ceil(totalCnt/(double)listCnt));
		}
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}
		//퍼피력
		double puppypoint = hostinfoDao.getPuppypoint(hostNo);
		//항목점수
		ReviewVo point = hostinfoDao.getPoint(hostNo);
		//호스트 사진 리스트
		List<PhotoVo> photoList = hostinfoDao.getHostPhoto(hostNo);
		//일정 리스트
		List<BookingVo> calendurList = hostinfoDao.getCalendur(hostNo);
		
		hostMap.put("hostVo", hostVo);
		hostMap.put("keyList", keyList);
		hostMap.put("reviewList", reviewList);
		hostMap.put("puppypoint", puppypoint);
		hostMap.put("point", point);
		hostMap.put("photoList", photoList);
		hostMap.put("calendurList", calendurList);
		hostMap.put("prev", prev);
		hostMap.put("startPageBtnNo", startPageBtnNo);
		hostMap.put("endPageBtnNo", endPageBtnNo);
		hostMap.put("next", next);
		
		return hostMap;
	}
	public List<BookingVo> bookingList(int hostNo){
		System.out.println("[hostinfoService.bookingList()]");
		
		return hostinfoDao.bookingList(hostNo);
	}
	//수정용 호스트데이터 가져오기
	public Map<String, Object> getModify(int hostNo){
		System.out.println("[HostinfoService.getModify()]");
		Map<String, Object> hostMap = new HashMap<String, Object>();
		
		//키워드리스트 가져오기
		List<KeywordVo> keywordList = hostinfoDao.getKeywordList();
		//호스트 Vo 가져오기
		HostVo hostVo = hostinfoDao.getHost(hostNo);
		
		hostMap.put("keywordList", keywordList);
		hostMap.put("hostVo", hostVo);
		
		
		//호스트 키워드 가져오기
		return hostMap;
	}
	//호스트 수정
	public int hostupdate(HostVo hostVo, List<Integer> keyList) {
		System.out.println("[HostinfoService.hostupdate()]");
		
		//호스트 정보 수정
		hostinfoDao.hostupdate(hostVo);
		
		//키워드 수정
		
		//사진 수정
		
		return 0;
	}
	//호스트 사진 가져오기
	public List<PhotoVo> getHostPhoto(int hostNo){
		System.out.println("[HostinfoService.getHostPhoto()]");
		return hostinfoDao.getHostPhoto(hostNo);
	}
	
	//카테고리 사진 가져오기
	public List<PhotoVo> getPhoto(PhotoVo photoVo){
		System.out.println("[HostinfoService.getPhoto()]");
		
		List<PhotoVo> photoList = hostinfoDao.getPhoto(photoVo);
		
		return photoList;
	}
	
	//호스트Vo 가져오기
	public HostVo getHost(int hostNo) {
		System.out.println("[HostinfoService.getHost()]");
		
		return hostinfoDao.getHost(hostNo);
	}
	
	//able 가져오기
	public List<String> getBooking(int hostNo) {
		System.out.println("[HostinfoService.getBooking()]");
		List<String> ableList = hostinfoDao.getAbleDate(hostNo);
		
		return ableList;
	}
	//일수 계산하기
	public void checkdays(BookingVo bookingVo) {
		System.out.println("[HostinfoService.checkdays()]");
		
		//일수 계산하기
		try {
			Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(bookingVo.getCheckout());
		    Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(bookingVo.getCheckin());
		    long diffSec = (format1.getTime() - format2.getTime()) / 1000;
		    long diffDays = (diffSec / (24*60*60)) + 1; //일자수
		    
		    System.out.println(bookingVo.getCheckin());
		    System.out.println(bookingVo.getCheckout());
		    System.out.println(diffDays + "일 차이");
		    
		    bookingVo.setDays((int)diffDays);
		    
		} catch (ParseException e) {
			e.printStackTrace();
		}
	    
	}
	
	//예약하기
	public int bookinginsert(BookingVo bookingVo) {
		System.out.println("[HostinfoService.bookinginsert()]");
		
		//예약테이블 인서트
		return hostinfoDao.bookinginsert(bookingVo);
	}
	
	//키워드 리스트 가져오기
	public List<KeywordVo> getKeywordList() {
		System.out.println("[HostinfoService.getKeywordList()]");
		
		return hostinfoDao.getKeywordList();
	}
	
	//호스트 등록 및 타입 변경
	public void hostinsert(HostVo hostVo) {
		System.out.println("[HostinfoService.hostinsert()]");
		
		hostinfoDao.hostinsert(hostVo);
		hostinfoDao.typeUpdate(hostVo.getUsersNo());
	}
	
	//유저타입 변경(유저->호스트)
	public void typeUpdate(int usersNo) {
		System.out.println("[HostinfoService.typeUpdate()]");

	}
	
	//사진 업로드
	public void fileupload(MultipartFile file, int hostNo) {
		System.out.println("[HostinfoService.fileupload()]");
		
		//맥 저장경로
		String saveDir = "C:\\javaStudy\\upload\\";
		//윈도우 저장경로
		//String saveDir = "C:\\javaStudy\\photo\\";
		
		// 원본파일이름
		String orgName = file.getOriginalFilename();
		// 확장자
		String exName = orgName.substring(orgName.lastIndexOf("."));
		// 저장파일이름
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		// 파일패스 생성
		String filePath = saveDir + saveName;
		// 파일 저장
		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(filePath);// 어떤 경로에 파일을 저장할건지?
			BufferedOutputStream bout = new BufferedOutputStream(out);

			bout.write(fileData);
			bout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//DB에 넣기
		PhotoVo photoVo = new PhotoVo();
		photoVo.setHostNo(hostNo);
		photoVo.setPhotoPath(saveName);
		hostinfoDao.setHostPhoto(photoVo);
	}
	
	//키워드 등록
	public void setKeyword(List<Integer> keyList, int hostNo) {
		System.out.println("[HostinfoService.setKeyword()]");
		
		List<KeywordVo> keywordList = new ArrayList<KeywordVo>();
		
		for(int KeywordNo:keyList) {
			KeywordVo keywordVo = new KeywordVo();
			keywordVo.setHostNo(hostNo);
			keywordVo.setKeywordNo(KeywordNo);
			keywordList.add(keywordVo);
		}
		for (KeywordVo keywordVo:keywordList) {
			hostinfoDao.setKeyword(keywordVo);
		}
	}
	//찜체크
	public int getHeart(HeartVo heartVo) {
		System.out.println("[HostinfoService.getHeart()]");
		
		return hostinfoDao.getHeart(heartVo);
	}
	//찜등록
	public int heartinsert(HeartVo heartVo) {
		System.out.println("[HostinfoService.heartinsert()]");
		
		return hostinfoDao.heartinsert(heartVo);
	}
	//찜삭제
	public int heartdelete(HeartVo heartVo) {
		System.out.println("[HostinfoService.heartdelete()]");
		
		return hostinfoDao.heartdelete(heartVo);
	}
}
