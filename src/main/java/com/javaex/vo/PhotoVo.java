package com.javaex.vo;

import org.springframework.web.multipart.MultipartFile;

public class PhotoVo {

	// 필드
	private int photoNo;
	private int userNo;
	private int hostNo;
	private int bookingNo;
	private String photoDate;
	private String category;
	private String photoTitle;
	private String photoPath;

	private MultipartFile file;
	private String uploadDate;
	private String saveName;
	private long day;
	private int usersNo;

	// 생성자
	public PhotoVo() {
	}

	public PhotoVo(int photoNo, int userNo, int hostNo, int bookingNo, String photoDate, String category,
			String photoTitle, String photoPath) {
		this.photoNo = photoNo;
		this.userNo = userNo;
		this.hostNo = hostNo;
		this.bookingNo = bookingNo;
		this.photoDate = photoDate;
		this.category = category;
		this.photoTitle = photoTitle;
		this.photoPath = photoPath;
	}

	public PhotoVo(int photoNo, int userNo, int hostNo, int bookingNo, String photoDate, String category,
			String photoTitle, String photoPath, MultipartFile file, String uploadDate, String saveName, long day,
			int usersNo) {
		this.photoNo = photoNo;
		this.userNo = userNo;
		this.hostNo = hostNo;
		this.bookingNo = bookingNo;
		this.photoDate = photoDate;
		this.category = category;
		this.photoTitle = photoTitle;
		this.photoPath = photoPath;
		this.file = file;
		this.uploadDate = uploadDate;
		this.saveName = saveName;
		this.day = day;
		this.usersNo = usersNo;
	}

	// 메소드g/s
	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getHostNo() {
		return hostNo;
	}

	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}

	public int getBookingNo() {
		return bookingNo;
	}

	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}

	public String getPhotoDate() {
		return photoDate;
	}

	public void setPhotoDate(String photoDate) {
		this.photoDate = photoDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPhotoTitle() {
		return photoTitle;
	}

	public void setPhotoTitle(String photoTitle) {
		this.photoTitle = photoTitle;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public long getDay() {
		return day;
	}

	public void setDay(long day) {
		this.day = day;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	@Override
	public String toString() {
		return "PhotoVo [photoNo=" + photoNo + ", userNo=" + userNo + ", hostNo=" + hostNo + ", bookingNo=" + bookingNo
				+ ", photoDate=" + photoDate + ", category=" + category + ", photoTitle=" + photoTitle + ", photoPath="
				+ photoPath + ", file=" + file + ", uploadDate=" + uploadDate + ", saveName=" + saveName + ", day="
				+ day + ", usersNo=" + usersNo + "]";
	}

	// 메소드 일반

}
