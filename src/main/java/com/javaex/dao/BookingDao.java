package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.AbleVo;
import com.javaex.vo.BookingVo;
import com.javaex.vo.HostVo;
import com.javaex.vo.MyDogVo;
import com.javaex.vo.PhotoVo;
import com.javaex.vo.UserVo;

@Repository
public class BookingDao {

	@Autowired
	SqlSession sqlsession;
	
	//예약 + 호스트 리스트 가져오기
	public List<BookingVo> bookingBeforeGuest(int usersNo) {
		
		List<BookingVo> BookingList = sqlsession.selectList("booking.bookingHostList", usersNo);
		
		return BookingList;
	}
	
	//예약 + 게스트 리스트 가져오기
	public List<BookingVo> bookingBeforeHost(int hostNo) {
		
		List<BookingVo> bookingList = sqlsession.selectList("booking.bookingGuestList", hostNo);
		
		System.out.println(bookingList);
		
		return bookingList;
	}
	
	//예약 + 날짜 리스트 가져오기
	public List<BookingVo> bookingDateList(BookingVo bookingVo) {
		
		List<BookingVo> bookingList = sqlsession.selectList("booking.bookingDateList", bookingVo);
		
		return bookingList;
	}
	
	//예약상세(게스트)
	public BookingVo bookingDetailGuest(int bookingNo) {
		
		BookingVo bvo = sqlsession.selectOne("booking.bookingDetailHost", bookingNo);
		
		return bvo;
	}
	
	//예약상세(호스트)
	public BookingVo bookingDetailHost(int bookingNo) {
		
		BookingVo bvo = sqlsession.selectOne("booking.bookingDetailGuest", bookingNo);
		
		return bvo;
	}
	
	//예약상세갤러리(게스트)
	public List<PhotoVo> bookingGallery(int bookingNo, int day) {
		
		PhotoVo pvo = new PhotoVo();
		pvo.setBookingNo(bookingNo);
		pvo.setDay(day);
		
		List<PhotoVo> PhotoList = sqlsession.selectList("booking.photoList", pvo);
		
		return PhotoList;
	}
	
	//사진업로드
	public void photoInsert(PhotoVo pvo) {
		
		sqlsession.insert("booking.photoInsert", pvo);
	}
	
	//사진상세보기
	public PhotoVo photoView(int photoNo) {
		
		return sqlsession.selectOne("booking.photoView", photoNo);
	}
	
	//예약완료리스트(호스트)
	public List<BookingVo> bookingEndHost(int hostNo) {
		
		List<BookingVo> bookingList = sqlsession.selectList("booking.bookingEndGuestList", hostNo);
		
		return bookingList;
	}
	
	//예약완료리스트(게스트)
	public List<BookingVo> bookingEndGuest(int usersNo) {
		
		List<BookingVo> bookingList = sqlsession.selectList("booking.bookingEndHostList", usersNo);
		
		return bookingList;
	}
	
	//가능날짜추가
	public void ableInsert(AbleVo avo) {
		
		sqlsession.insert("booking.ableInsert", avo);
	}
	
	//가능날짜리스트
	public List<AbleVo> ableList(int hostNo) {
		
		return sqlsession.selectList("booking.ableSelect", hostNo);
	}
	
	//가능날짜취소
	public void ableDelete(AbleVo avo) {
		sqlsession.delete("booking.ableDelete", avo);
	}
	
	//가능날짜 전체취소
	public void ableDeleteAll(int hostNo) {
		sqlsession.delete("booking.ableDeleteAll", hostNo);
	}
	
	//노출여부업데이트
	public void viewAble(int hostNo, int hostview) {
		
		HostVo hvo = new HostVo();
		hvo.setHostview(hostview);
		hvo.setHostNo(hostNo);
		
		sqlsession.update("booking.viewAble", hvo);
	}
	
	//호스트 정보
	public HostVo selectHost(int hostNo) {
		
		return sqlsession.selectOne("booking.selectHost", hostNo);
	}
	
	//예약승인 상태변경
	public void updateStatus(int bookingNo) {
		
		sqlsession.update("booking.updateStatus1", bookingNo);
	}
	
	//펫시팅중 상태변경
	public void updateStatus2(int bookingNo) {
		
		sqlsession.update("booking.updateStatus2", bookingNo);
	}
	
	//mydog select
	public MyDogVo mydogSelect(int usersNo) {
		
		return sqlsession.selectOne("mydog.select", usersNo);
	}
	
	//회원가입
	public void join(UserVo uvo) {
		
		sqlsession.insert("user.join", uvo);
	}
	
	//로그인(게스트)
	public UserVo loginGuest(UserVo uvo) {
		
		return sqlsession.selectOne("user.loginGuest", uvo);
	}
	
	//로그인(호스트)
	public UserVo loginHost(UserVo uvo) {
		
		return sqlsession.selectOne("user.loginHost", uvo);
	}
}
