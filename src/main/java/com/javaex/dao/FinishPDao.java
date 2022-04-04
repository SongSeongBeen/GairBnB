package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.FinishPVo;


@Repository
public class FinishPDao {
	
	@Autowired
	private SqlSession sqlSession;

	
	public FinishPVo selectP(int bookingNo) {
		FinishPVo pay = sqlSession.selectOne("finishP.selectPay",bookingNo);
		System.out.println("여기는 다오");
		System.out.println(pay +"다오");
		return pay; 
	}
	
	//예약승인 상태변경
	public void updateStatusP(int bookingNo) {
			
		sqlSession.update("finishP.updateStatusP", bookingNo);
	}
	
}
