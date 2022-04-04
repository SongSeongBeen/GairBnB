package com.javaex.vo;

public class HeartVo {

	// 필드
	public int heartNo;
	public int usersNo;
	public int hostNo;
	public String name;
	public String path;
	public String adress1;
	public int reviewcount;
	public int hostcost;
	public double puppypoint;
	
	
	// 생성자
	public HeartVo( ) {
		
	}


	public HeartVo(int heartNo, int usersNo, int hostNo, String name, String path, String adress1, int reviewcount,
			int hostcost, double puppypoint) {
		super();
		this.heartNo = heartNo;
		this.usersNo = usersNo;
		this.hostNo = hostNo;
		this.name = name;
		this.path = path;
		this.adress1 = adress1;
		this.reviewcount = reviewcount;
		this.hostcost = hostcost;
		this.puppypoint = puppypoint;
	}


	public int getHeartNo() {
		return heartNo;
	}


	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
	}


	public int getUsersNo() {
		return usersNo;
	}


	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}


	public int getHostNo() {
		return hostNo;
	}


	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}


	public String getAdress1() {
		return adress1;
	}


	public void setAdress1(String adress1) {
		this.adress1 = adress1;
	}


	public int getReviewcount() {
		return reviewcount;
	}


	public void setReviewcount(int reviewcount) {
		this.reviewcount = reviewcount;
	}


	public int getHostcost() {
		return hostcost;
	}


	public void setHostcost(int hostcost) {
		this.hostcost = hostcost;
	}


	public double getPuppypoint() {
		return puppypoint;
	}


	public void setPuppypoint(double puppypoint) {
		this.puppypoint = puppypoint;
	}


	@Override
	public String toString() {
		return "HeartVo [heartNo=" + heartNo + ", usersNo=" + usersNo + ", hostNo=" + hostNo + ", name=" + name
				+ ", path=" + path + ", adress1=" + adress1 + ", reviewcount=" + reviewcount + ", hostcost=" + hostcost
				+ ", puppypoint=" + puppypoint + "]";
	}



}
