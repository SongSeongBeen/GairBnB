package com.javaex.vo;

public class BookingVo {

	// 예약테이블
	private int bookingNo;
	private int hostNo;
	private int usersNo;
	private String checkin;
	private String checkout;
	private int ea;
	private int bookingDate;
	private int totalCost;
	private int days;
	private String note;
	private String status;
	private String review;
	private String reviewDate;
	private int clean;
	private int food;
	private int play;
	private int walk;
	private int communication;

	// 호스트테이블(조인)
	private String hostName;
	private String hostHp;
	private String adress1;
	private String adress2;
	private String adress3;
	private int hostView;
	private String hostPath;

	// 유저테이블(조인)
	private String guestName;
	private String guestHp;
	private String guestPath;

	public BookingVo() {
	}

	public BookingVo(int bookingNo, int hostNo, int usersNo, String checkin, String checkout, int ea, int bookingDate,
			int totalCost, int days, String note, String status, String review, String reviewDate, int clean, int food,
			int play, int walk, int communication, String hostName, String hostHp, String adress1, String adress2,
			String adress3, int hostView, String hostPath, String guestName, String guestHp, String guestPath) {
		this.bookingNo = bookingNo;
		this.hostNo = hostNo;
		this.usersNo = usersNo;
		this.checkin = checkin;
		this.checkout = checkout;
		this.ea = ea;
		this.bookingDate = bookingDate;
		this.totalCost = totalCost;
		this.days = days;
		this.note = note;
		this.status = status;
		this.review = review;
		this.reviewDate = reviewDate;
		this.clean = clean;
		this.food = food;
		this.play = play;
		this.walk = walk;
		this.communication = communication;
		this.hostName = hostName;
		this.hostHp = hostHp;
		this.adress1 = adress1;
		this.adress2 = adress2;
		this.adress3 = adress3;
		this.hostView = hostView;
		this.hostPath = hostPath;
		this.guestName = guestName;
		this.guestHp = guestHp;
		this.guestPath = guestPath;
	}

	public BookingVo(int bookingNo, int hostNo, int usersNo, String checkin, String checkout, int ea, int bookingDate,
			int days, String note, String status, String review, String reviewDate, int clean, int food, int play,
			int walk, int communication, String guestName, String guestHp) {
		this.bookingNo = bookingNo;
		this.hostNo = hostNo;
		this.usersNo = usersNo;
		this.checkin = checkin;
		this.checkout = checkout;
		this.ea = ea;
		this.bookingDate = bookingDate;
		this.days = days;
		this.note = note;
		this.status = status;
		this.review = review;
		this.reviewDate = reviewDate;
		this.clean = clean;
		this.food = food;
		this.play = play;
		this.walk = walk;
		this.communication = communication;
		this.guestName = guestName;
		this.guestHp = guestHp;
	}

	public BookingVo(int bookingNo, int hostNo, int usersNo, String checkin, String checkout, int ea, int bookingDate,
			int days, String note, String status, String review, String reviewDate, int clean, int food, int play,
			int walk, int communication, String hostName, String hostHp, String adress1, String adress2,
			String adress3) {
		this.bookingNo = bookingNo;
		this.hostNo = hostNo;
		this.usersNo = usersNo;
		this.checkin = checkin;
		this.checkout = checkout;
		this.ea = ea;
		this.bookingDate = bookingDate;
		this.days = days;
		this.note = note;
		this.status = status;
		this.review = review;
		this.reviewDate = reviewDate;
		this.clean = clean;
		this.food = food;
		this.play = play;
		this.walk = walk;
		this.communication = communication;
		this.hostName = hostName;
		this.hostHp = hostHp;
		this.adress1 = adress1;
		this.adress2 = adress2;
		this.adress3 = adress3;
	}

	// 메소드 g/s
	public int getBookingNo() {
		return bookingNo;
	}

	public void setBookingNo(int bookingNo) {
		this.bookingNo = bookingNo;
	}

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

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getEa() {
		return ea;
	}

	public void setEa(int ea) {
		this.ea = ea;
	}

	public int getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(int bookingDate) {
		this.bookingDate = bookingDate;
	}

	public int getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public int getClean() {
		return clean;
	}

	public void setClean(int clean) {
		this.clean = clean;
	}

	public int getFood() {
		return food;
	}

	public void setFood(int food) {
		this.food = food;
	}

	public int getPlay() {
		return play;
	}

	public void setPlay(int play) {
		this.play = play;
	}

	public int getWalk() {
		return walk;
	}

	public void setWalk(int walk) {
		this.walk = walk;
	}

	public int getCommunication() {
		return communication;
	}

	public void setCommunication(int communication) {
		this.communication = communication;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getHostHp() {
		return hostHp;
	}

	public void setHostHp(String hostHp) {
		this.hostHp = hostHp;
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

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getGuestHp() {
		return guestHp;
	}

	public void setGuestHp(String guestHp) {
		this.guestHp = guestHp;
	}

	public int getHostView() {
		return hostView;
	}

	public void setHostView(int hostView) {
		this.hostView = hostView;
	}

	public String getHostPath() {
		return hostPath;
	}

	public void setHostPath(String hostPath) {
		this.hostPath = hostPath;
	}

	public String getGuestPath() {
		return guestPath;
	}

	public void setGuestPath(String guestPath) {
		this.guestPath = guestPath;
	}

	// 메소드 일반
	@Override
	public String toString() {
		return "BookingVo [bookingNo=" + bookingNo + ", hostNo=" + hostNo + ", usersNo=" + usersNo + ", checkin="
				+ checkin + ", checkout=" + checkout + ", ea=" + ea + ", bookingDate=" + bookingDate + ", totalCost="
				+ totalCost + ", days=" + days + ", note=" + note + ", status=" + status + ", review=" + review
				+ ", reviewDate=" + reviewDate + ", clean=" + clean + ", food=" + food + ", play=" + play + ", work="
				+ walk + ", communication=" + communication + ", hostName=" + hostName + ", hostHp=" + hostHp
				+ ", adress1=" + adress1 + ", adress2=" + adress2 + ", adress3=" + adress3 + ", guestName=" + guestName
				+ ", guestHp=" + guestHp + "]";
	}
}
