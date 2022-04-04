package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.vo.BookingVo;
import com.javaex.vo.HeartVo;
import com.javaex.vo.HostVo;
import com.javaex.vo.KeywordVo;
import com.javaex.vo.PhotoVo;
import com.javaex.vo.ReviewVo;

@Repository
public class HostinfoDao {

	@Autowired
	SqlSession sqlSession;
	
	//호스트 넘버가 존재하는지 체크
	public int checkNo(int hostNo) {
		System.out.println("[HostinfoDao.checkNo()]");
		int no = sqlSession.selectOne("hostinfo.checkNo", hostNo);
		return no;
	}
	
	//호스트 정보
	public HostVo getHost(int hostNo) {
		System.out.println("[HostinfoDao.getHost()]");
		return sqlSession.selectOne("hostinfo.getHost", hostNo);
	}
	
	//호스트 키워드
	public List<KeywordVo> getHostKeyword(int hostNo) {
		System.out.println("[HostinfoDao.getHostKeyword()]");
		List<KeywordVo> keyList = sqlSession.selectList("hostinfo.getKeywordList", hostNo);
		return keyList;
	}
	
	//호스트 리뷰
	public List<ReviewVo> getReview(int hostNo, int startRnum, int endRnum){
		System.out.println("[HostinfoDao.getReview()]");
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("hostNo", hostNo);
		map.put("startRnum", startRnum);
		map.put("endRnum", endRnum);
		
		List<ReviewVo> reviewList = sqlSession.selectList("hostinfo.getReview", map);
		
		return reviewList;
	}
	
	//호스트 리뷰 갯수
	public int getReviewCount(int hostNo){
		System.out.println("[HostinfoDao.getReviewCount()]");
		
		return sqlSession.selectOne("hostinfo.getReviewCount", hostNo);
	}
	
	//호스트 점수 합계
	public double getPuppypoint(int hostNo){
		System.out.println("[HostinfoDao.getPuppypoint()]");
		
		return sqlSession.selectOne("hostinfo.getPuppypoint", hostNo);
	}
	
	//각각 점수 가져오기
	public ReviewVo getPoint(int hostNo) {
		System.out.println("[HostinfoDao.getPoint()]");
		return sqlSession.selectOne("hostinfo.getPoint", hostNo);
	}
	
	//호스트 사진 가져오기
	public List<PhotoVo> getHostPhoto(int hostNo) {
		System.out.println("[HostinfoDao.HostPhoto()]");
		
		List<PhotoVo> photoList = sqlSession.selectList("hostinfo.getHostPhotoList", hostNo);
		
		return photoList;
	}
	
	//예약리스트
	public List<BookingVo> bookingList(int hostNo){
		System.out.println("[hostinfoDao.bookingList()]");

		return sqlSession.selectList("hostinfo.bookingList",hostNo);
	}
	
	//결제내역
	public List<BookingVo> getCalendur(int bookingNo) {
		System.out.println("[HostinfoDao.getCalendur()]");
		
		List<BookingVo> CalendurList = sqlSession.selectList("hostinfo.getCalendur", bookingNo);
		
		return CalendurList;
	}
	
	//사진
	public List<PhotoVo> getPhoto(PhotoVo photoVo) {
		System.out.println("[HostinfoDao.getPhoto()]");
		
		List<PhotoVo> photoList = sqlSession.selectList("hostinfo.getPhoto", photoVo);
		
		return photoList;
	}
	
	//결제내역
	public BookingVo getPayment(int bookingNo) {
		System.out.println("[HostinfoDao.getBooking()]");
		
		BookingVo bookingVo = sqlSession.selectOne("hostinfo.getPayment", bookingNo);
		
		return bookingVo;
	}
	
	//예약하기
	public int bookinginsert(BookingVo bookingVo) {
		System.out.println("[HostinfoDao.bookinginsert()]");
		
		return sqlSession.insert("hostinfo.bookinginsert", bookingVo);
	}
	
	//상태값 변경
	public int setStatus(BookingVo bookingVo) {
		System.out.println("[HostinfoDao.setStatus()]");
		
		int count = sqlSession.update("hostinfo.setStatus", bookingVo);
		
		System.out.println("["+count+"건이 업데이트 되었습니다.(hostinfoDao)]");
		
		return count;
	}
	
	//키워드 리스트 가져오기
	public List<KeywordVo> getKeywordList() {
		System.out.println("[HostinfoDao.getKeywordList()]");
		
		return sqlSession.selectList("hostinfo.getKeywordList2");
	}
	
	
	//호스트 등록
	public void hostinsert(HostVo hostVo) {
		System.out.println("[HostinfoDao.hostinsert()]");
		
		sqlSession.insert("hostinfo.hostinsert", hostVo);
	}
	
	//유저타입 변경(유저->호스트)
	public void typeUpdate(int usersNo) {
		System.out.println("[HostinfoDao.typeUpdate()]");
		
		sqlSession.update("hostinfo.setTypeHost", usersNo);
	}
	//호스트 정보 수정
	public int hostupdate(HostVo hostVo) {
		System.out.println("[HostinfoDao.hostupdate()]");
		
		return sqlSession.update("hostinfo.hostupdate", hostVo);
	}

	//사진 넣기
	public void setHostPhoto(PhotoVo photoVo) {
		System.out.println("[HostinfoService.setHostPhoto()]");
		
		sqlSession.insert("hostinfo.setHostPhoto", photoVo);
	}
	
	//키워드 넣기
	public void setKeyword(KeywordVo keywordVo) {
		System.out.println("[HostinfoService.setKeyword()]");
		
		sqlSession.insert("hostinfo.setKeyword", keywordVo);
	}
	
	//가능 날짜 가져오기
	public List<String> getAbleDate(int hostNo){
		System.out.println("[HostinfoService.getAbleDate()]");
		
		return sqlSession.selectList("hostinfo.getAbleDate", hostNo);
	}
	
	//찜체크
	public int getHeart(HeartVo heartVo) {
		System.out.println("[HostinfoDao.getheart()]");
		
		return sqlSession.selectOne("hostinfo.getHeart", heartVo);
	}
	
	//찜등록
	public int heartinsert(HeartVo heartVo) {
		System.out.println("[HostinfoDao.heartinsert()]");
		System.out.println(heartVo);
		int count =  sqlSession.insert("hostinfo.heartinsert", heartVo);
		System.out.println("["+count+"건이 추가되었습니다(찜)]");
		
		return count;
	}
	
	//찜삭제
	public int heartdelete(HeartVo heartVo) {
		System.out.println("[HostinfoDao.heartdelete()]");
		System.out.println(heartVo);
		int count = sqlSession.delete("hostinfo.heartdelete", heartVo);
		System.out.println("["+count+"건이 삭제되었습니다(찜)]");
		
		return count;
	}
}
