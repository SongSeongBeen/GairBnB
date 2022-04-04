package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ReviewVo;

@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int updateReview (ReviewVo reviewVo) {
		System.out.println("여기는 다오");
		
		System.out.println(reviewVo);
		return sqlSession.update("review.updateReview", reviewVo);
		
	}
	
	public int updateStatus3(int bookingNo) {
		
		return sqlSession.update("review.updateStatus3", bookingNo);
	}

}
