package com.javaex.vo;

public class ReviewVo {

	//필드
	private int bookingNo;
	private int usersNo;
	private String name;
	private String path;
	private String review;
	private String reviewDate;
	private double clean;
	private double food;
	private double play;
	private double walk;
	private double communication;
	
	//생성자
	public ReviewVo() {
		
	}
	public ReviewVo(int bookingNo, int usersNo, String name, String path, String review, String reviewDate,
			double clean, double food, double play, double walk, double communication) {
		this.bookingNo = bookingNo;
		this.usersNo = usersNo;
		this.name = name;
		this.path = path;
		this.review = review;
		this.reviewDate = reviewDate;
		this.clean = clean;
		this.food = food;
		this.play = play;
		this.walk = walk;
		this.communication = communication;
	}

	//메소드 g/s
	public int getBookingNo() {
		return bookingNo;
	}
	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
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
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public double getClean() {
		return clean;
	}
	public void setClean(double clean) {
		this.clean = clean;
	}
	public double getFood() {
		return food;
	}
	public void setFood(double food) {
		this.food = food;
	}
	public double getPlay() {
		return play;
	}
	public void setPlay(double play) {
		this.play = play;
	}
	public double getWalk() {
		return walk;
	}
	public void setWalk(double walk) {
		this.walk = walk;
	}
	public double getCommunication() {
		return communication;
	}
	public void setCommunication(double communication) {
		this.communication = communication;
	}

	//메소드 일반
	@Override
	public String toString() {
		return "ReviewVo [bookingNo=" + bookingNo + ", usersNo=" + usersNo + ", name=" + name + ", path=" + path
				+ ", review=" + review + ", reviewDate=" + reviewDate + ", clean="
				+ clean + ", food=" + food + ", play=" + play + ", work=" + walk + ", communication=" + communication
				+ "]";
	}
}
