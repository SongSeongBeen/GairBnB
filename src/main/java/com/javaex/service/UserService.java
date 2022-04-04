package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.UserDao;
import com.javaex.vo.HeartVo;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	
	// 유저_1> 유저 정보 수정폼
	public UserVo modifyForm(int usersNo) {
		System.out.println("UserService > modifyForm()");
		
		return userDao.selectUser(usersNo);
	}
	
		
	// 유저_2> 유저 수정
	public int modify(UserVo userVo) {
		System.out.println("UserService > modify()");

		return userDao.updateUser(userVo);
	}
	
	// 유저_3> 유저 정보수정 시 프로필사진 업데이트
	public void profileUpdate(MultipartFile file, UserVo userVo) {
		System.out.println("UserService > profileUpdate()");
		//맥 저장경로
		//String saveDir = "/Users/hs/JavaStudy/workspace_project/project/webapp/assets/upload/";
		//윈도우 저장경로
		String saveDir = "C:\\javaStudy\\upload\\";
		
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
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bout = new BufferedOutputStream(out);

			bout.write(fileData);
			bout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//DB 업데이트
		userVo.setPath(saveName);
		System.out.println(userVo);
		userDao.updateProfile(userVo);
	}
	
	
	// 유저_4> 찜 폼
	public List<HeartVo> heartForm(int usersNo) {
		System.out.println("UserService > heartForm()");
		
		return userDao.selectHeart(usersNo);
	}
	
	
   // 유저_6> 찜 삭제
   public int heartDelete(int heartNo) {
	   System.out.println("UserController > heartDelete()");
	
	   return userDao.heartDelete(heartNo);
   }
	
}