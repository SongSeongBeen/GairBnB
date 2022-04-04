package com.javaex.vo;

public class HostVo {	
	
	//필드
	private int hostNo;
	private int usersNo;
	private String name;
	private String hp;
	private String path;
	private int zipcode;
	private String adress1;
	private String adress2;
	private String adress3;
	private double x;
	private double y;
	private String intro;
	private String asking;
	private int hostcost;
	private String stringcost;
	private int reviewcount;
	private int hostview;
	
	//생성자
	public HostVo() {
		
	}
	public HostVo(int hostNo, int usersNo, String name, String hp, String path, int zipcode, String adress1,
			String adress2, String adress3, double x, double y, String intro, String asking, int hostcost,
			String stringcost, int reviewcount, int hostview) {
		this.hostNo = hostNo;
		this.usersNo = usersNo;
		this.name = name;
		this.hp = hp;
		this.path = path;
		this.zipcode = zipcode;
		this.adress1 = adress1;
		this.adress2 = adress2;
		this.adress3 = adress3;
		this.x = x;
		this.y = y;
		this.intro = intro;
		this.asking = asking;
		this.hostcost = hostcost;
		this.stringcost = stringcost;
		this.reviewcount = reviewcount;
		this.hostview = hostview;
	}


	//메소드 g/s
	public int getHostNo() {
		return hostNo;
	}
	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}
	public int getUsersNo() {
		return usersNo;
	}
	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAdress1() {
		return adress1;
	}
	public void setAdress1(String adress1) {
		this.adress1 = adress1;
	}
	public String getAdress2() {
		return adress2;
	}
	public void setAdress2(String adress2) {
		this.adress2 = adress2;
	}
	public String getAdress3() {
		return adress3;
	}
	public void setAdress3(String adress3) {
		this.adress3 = adress3;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getAsking() {
		return asking;
	}
	public void setAsking(String asking) {
		this.asking = asking;
	}
	public int getHostcost() {
		return hostcost;
	}
	public void setHostcost(int hostcost) {
		this.hostcost = hostcost;
	}
	public int getReviewcount() {
		return reviewcount;
	}
	public void setReviewcount(int reviewcount) {
		this.reviewcount = reviewcount;
	}
	public int getHostview() {
		return hostview;
	}
	public void setHostview(int hostview) {
		this.hostview = hostview;
	}
	public String getStringcost() {
		return stringcost;
	}
	public void setStringcost(String stringcost) {
		this.stringcost = stringcost;
	}
	
	//메소드 일반
	@Override
	public String toString() {
		return "HostVo [hostNo=" + hostNo + ", usersNo=" + usersNo + ", name=" + name + ", hp=" + hp + ", path=" + path
				+ ", zipcode=" + zipcode + ", adress1=" + adress1 + ", adress2=" + adress2 + ", adress3=" + adress3
				+ ", x=" + x + ", y=" + y + ", intro=" + intro + ", asking=" + asking + ", hostcost=" + hostcost
				+ ", reviewcount=" + reviewcount + ", hostview=" + hostview + "]";
	}

}
