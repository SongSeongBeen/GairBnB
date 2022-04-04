package com.javaex.vo;

public class SearchListVo {
	
	private int bookingNo;          //예약번호
	private int hostNo;             //호스트번호
	private String checkin;         //체크인 날짜
	private String checkout;        //체크아웃 날짜
	private int ea;				    //마릿수
	private int bookingDate;        //1박가격
	private int days;               //시팅일수
	private String note;            //요청사항
	private String status;          //상태
	private String review;          //리뷰
	private double puppyPoint;  	//퍼피포인트
	private double reviewPoint;     //리뷰포인트
	private int hostView;
	private String hostName;        //이름
	private String hostCost;        //가
	private String adress1;         //주소
	private String adress2;         //주소
	private String adress3;         //주소 세부사항
	private double x;               //좌표
	private double y;               //좌표
	private String intro;           //자기소개
	private String path;            //프로필 사진	
	private double clean;			    
	private double food;
	private double play;
	private double walk;
	private double communication;
	
	//검색단어들
	private String searchKeyword;
	private int orderType;
	private String searchData;
	
	
	//디폴트
	public SearchListVo() {}


	public SearchListVo(int bookingNo, int hostNo, String checkin, String checkout, int ea, int bookingDate, int days,
			String note, String status, String review, double puppyPoint, double reviewPoint, int hostView,
			String hostName, String hostCost, String adress1, String adress2, String adress3, double x, double y,
			String intro, String path, double clean, double food, double play, double walk, double communication,
			String searchKeyword, int orderType, String searchData) {
		this.bookingNo = bookingNo;
		this.hostNo = hostNo;
		this.checkin = checkin;
		this.checkout = checkout;
		this.ea = ea;
		this.bookingDate = bookingDate;
		this.days = days;
		this.note = note;
		this.status = status;
		this.review = review;
		this.puppyPoint = puppyPoint;
		this.reviewPoint = reviewPoint;
		this.hostView = hostView;
		this.hostName = hostName;
		this.hostCost = hostCost;
		this.adress1 = adress1;
		this.adress2 = adress2;
		this.adress3 = adress3;
		this.x = x;
		this.y = y;
		this.intro = intro;
		this.path = path;
		this.clean = clean;
		this.food = food;
		this.play = play;
		this.walk = walk;
		this.communication = communication;
		this.searchKeyword = searchKeyword;
		this.orderType = orderType;
		this.searchData = searchData;
	}


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


	public double getPuppyPoint() {
		return puppyPoint;
	}


	public void setPuppyPoint(double puppyPoint) {
		this.puppyPoint = puppyPoint;
	}


	public double getReviewPoint() {
		return reviewPoint;
	}


	public void setReviewPoint(double reviewPoint) {
		this.reviewPoint = reviewPoint;
	}


	public int getHostView() {
		return hostView;
	}


	public void setHostView(int hostView) {
		this.hostView = hostView;
	}


	public String getHostName() {
		return hostName;
	}


	public void setHostName(String hostName) {
		this.hostName = hostName;
	}


	public String getHostCost() {
		return hostCost;
	}


	public void setHostCost(String hostCost) {
		this.hostCost = hostCost;
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


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
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


	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	public int getOrderType() {
		return orderType;
	}


	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}


	public String getSearchData() {
		return searchData;
	}


	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}

	@Override
	public String toString() {
		return "SearchListVo [bookingNo=" + bookingNo + ", hostNo=" + hostNo + ", checkin=" + checkin + ", checkout="
				+ checkout + ", ea=" + ea + ", bookingDate=" + bookingDate + ", days=" + days + ", note=" + note
				+ ", status=" + status + ", review=" + review + ", puppyPoint=" + puppyPoint + ", reviewPoint="
				+ reviewPoint + ", hostView=" + hostView + ", hostName=" + hostName + ", hostCost=" + hostCost
				+ ", adress1=" + adress1 + ", adress2=" + adress2 + ", adress3=" + adress3 + ", x=" + x + ", y=" + y
				+ ", intro=" + intro + ", path=" + path + ", clean=" + clean + ", food=" + food + ", play=" + play
				+ ", walk=" + walk + ", communication=" + communication + ", searchKeyword=" + searchKeyword
				+ ", orderType=" + orderType + ", searchData=" + searchData + "]";
	}
	
	
	


	


	
	
	
	

	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
}
	

