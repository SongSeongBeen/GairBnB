package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.HeartVo;
import com.javaex.vo.UserVo;

@Repository
public class UserDao {

	@Autowired
	SqlSession sqlSession;
	
	// 유저_1> 유저 정보 수정폼
	public UserVo selectUser(int usersNo) {
		System.out.println("userDao > selectUserByNo()");

		return sqlSession.selectOne("user.selectUserByNo", usersNo);
	}
	
	// 유저_2> 유저 수정
	public int updateUser(UserVo userVo) {
		System.out.println("UserDao > updateUser()");
		System.out.println(userVo);
		int count = sqlSession.update("user.updateUser", userVo);
		System.out.println(count + "건의 회원정보가 수정되었습니다.");
		
		return count;
	}
	
	// 유저_3> 유저 정보수정 시 프로필사진 업데이트
	public void updateProfile(UserVo userVo) {
		System.out.println("UserDao >updateProfile()");
		sqlSession.update("user.updateProfile", userVo);
	}
	
	
	// 유저_5> 찜 폼
	public List<HeartVo> selectHeart(int usersNo) {
		System.out.println("UserDao > selectHeart()");
		
		List<HeartVo> heartList = sqlSession.selectList("user.selectHeartByNo", usersNo);
		
		return heartList;
	}
	
	
	// 유저_6> 찜 삭제
	public int heartDelete(int heartNo) {
		System.out.println("UserDao > heartDelete()");
		
		return sqlSession.delete("user.heartDelete", heartNo);
	}
	
}