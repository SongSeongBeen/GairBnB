package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.BookingDao;
import com.javaex.vo.AbleVo;
import com.javaex.vo.BookingVo;
import com.javaex.vo.HostVo;
import com.javaex.vo.MyDogVo;
import com.javaex.vo.PhotoVo;
import com.javaex.vo.UserVo;

@Service
public class BookingService {

	@Autowired
	BookingDao bookingDao;
	private long diffDay;

	// 예약 + 호스트 리스트 가져오기
	public List<BookingVo> bookingBeforeGuest(int usersNo) {

		return bookingDao.bookingBeforeGuest(usersNo);
	}

	// 예약 + 게스트 리스트 가져오기
	public List<BookingVo> bookingBeforeHost(int hostNo) {

		return bookingDao.bookingBeforeHost(hostNo);
	}

	// 예약 + 날짜 리스트 가져오기
	public List<BookingVo> bookingDateList(BookingVo bookingVo) {

		return bookingDao.bookingDateList(bookingVo);
	}

	// 예약상세(게스트)
	public BookingVo bookingDetailGuest(int bookingNo) {

		return bookingDao.bookingDetailGuest(bookingNo);
	}

	// 예약상세(게스트)
	public BookingVo bookingDetailHost(int bookingNo) {

		return bookingDao.bookingDetailHost(bookingNo);
	}

	// 예약상세갤러리(게스트)
	public List<PhotoVo> bookingGallery(int bookingNo, int day) {

		return bookingDao.bookingGallery(bookingNo, day);
	}

	// 사진업로드
	public void photoInsert(PhotoVo pvo) throws ParseException {

		MultipartFile file = pvo.getFile();

		System.out.println(file);

		// 맥 저장경로
		//String saveDir = "/Users/hs/JavaStudy/workspace_project/project/webapp/assets/upload/";
		// 윈도우 저장경로
		String saveDir = "C:\\javaStudy\\photo\\";

		// 확장자
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

		// 저장파일이름
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;

		// 파일패쓰 생성
		String filePath = saveDir + saveName;

		// 파일저장(업로드)
		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bout = new BufferedOutputStream(out);

			bout.write(fileData);
			bout.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//일차구하기
		//값 가져오기
		int bookingNo = pvo.getBookingNo();
		BookingVo bvo = bookingDao.bookingDetailHost(bookingNo);
		
		//일수구하는 함수호출
		String checkInDate = bvo.getCheckin();
		String uploadDate = pvo.getPhotoDate();
		String checkInDate2 = checkInDate.replace("-","");
		System.out.println(checkInDate + ", " + uploadDate);
		long diffDay = getDays(checkInDate2, uploadDate);
		long days = diffDay + 1;
		
		System.out.println("days: " + days);

		// DB에 저장
		pvo.setPhotoPath(filePath);
		pvo.setSaveName(saveName);
		pvo.setDay(days);

		// 첫업로드인지 확인(status 변경위해)
		List<PhotoVo> PList = bookingGallery(pvo.getBookingNo(), 1);

		if (PList.isEmpty()) {
			bookingDao.updateStatus2(pvo.getBookingNo());
		}

		bookingDao.photoInsert(pvo);
	}
	
	//일수구하기
	public long getDays(String strCheckInDate, String strUploadDate) throws ParseException {
		
		String dateFormat = "yyyymmdd";
		
		//SimpleDateFormat을 이용하여 두 날짜의 객체를 생성한다.
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		try {
			Date checkInDate = sdf.parse(strCheckInDate);
			Date uploadDate = sdf.parse(strUploadDate);
			
			System.out.println("일수구하기: checkInDate" + checkInDate + ", uploadDate " + uploadDate);
			
			//두날짜 사이의 시간 차이(ms)를 하루동안의 ms(24시*60분*60초*1000밀리초)로 나눈다.
			diffDay = (uploadDate.getTime() - checkInDate.getTime()) / (24*60*60*1000);
			
			System.out.println("일수구하기: " + diffDay);
			
		}catch (ParseException e) {
			e.printStackTrace();
		}
		
		return diffDay;
	}

	// 사진상세보기
	public PhotoVo photoView(int photoNo) {

		return bookingDao.photoView(photoNo);
	}

	// 예약완료리스트(호스트)
	public List<BookingVo> bookingEndHost(int hostNo) {

		return bookingDao.bookingEndHost(hostNo);
	}

	// 예약완료리스트(게스트)
	public List<BookingVo> bookingEndGuest(int usersNo) {

		return bookingDao.bookingEndGuest(usersNo);
	}

	// 가능날짜추가
	public void ableInsert(int hostNo, String date) {

		AbleVo avo = new AbleVo();
		avo.setHostNo(hostNo);
		avo.setAbleDate(date);

		bookingDao.ableInsert(avo);
	}

	// 가능날짜리스트
	public List<AbleVo> ableList(int hostNo) {

		return bookingDao.ableList(hostNo);
	}

	// 가능날짜취소
	public void ableDelete(int hostNo, String date) {

		AbleVo avo = new AbleVo();
		avo.setHostNo(hostNo);
		avo.setAbleDate(date);

		bookingDao.ableDelete(avo);
	}

	// 가능날짜천제취소
	public void ableDeleteAll(int hostNo) {

		bookingDao.ableDeleteAll(hostNo);
	}

	// 노출여부업데이트
	public void viewAble(int hostNo, int hostview) {

		bookingDao.viewAble(hostNo, hostview);
	}

	// 호스트 정보
	public HostVo selectHost(int hostNo) {

		return bookingDao.selectHost(hostNo);
	}

	// 예약승인 상태변경
	public void updateStatus(int bookingNo) {

		bookingDao.updateStatus(bookingNo);
	}
	
	//mydog select
	public MyDogVo mydogSelect(int usersNo) {
		
		return bookingDao.mydogSelect(usersNo);
	}

	// 회원가입
	public void join(UserVo uvo) {

		bookingDao.join(uvo);
	}

	// 로그인
	public UserVo login(UserVo uvo) {

		UserVo authUser = bookingDao.loginGuest(uvo);

		if ((authUser.getUsersType()) == 2) {
			return bookingDao.loginHost(uvo);
		} else {
			return authUser;
		}

	}
}
