package com.javaex.vo;

public class GalleryVo {

	private int galleryNo;
	private int usersNo;
	private int photoNo;
	private String saveName;

	public GalleryVo() {

	}

	public GalleryVo(int galleryNo, int usersNo, int photoNo, String saveName) {
		this.galleryNo = galleryNo;
		this.usersNo = usersNo;
		this.photoNo = photoNo;
		this.saveName = saveName;
	}

	public int getGalleryNo() {
		return galleryNo;
	}

	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}
	
	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	@Override
	public String toString() {
		return "GalleryVo [galleryNo=" + galleryNo + ", usersNo=" + usersNo + ", photoNo=" + photoNo + ", saveName="
				+ saveName + "]";
	}

	

}
