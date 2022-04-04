package com.javaex.vo;

public class ItemVo {

	//필드
	private int itemNo;
	private int usersNo;
	private int sellerNo;
	private int cartNo;
	private int historyNo;
	private int itemphotoNo;
	private String category;
	private String title;
	private String info;
	private int cost;
	private String stringcost;
	private int ea;
	private String path;
	private String infopath;
	private String status;
	private int views;
	private String hp;
	private String address1;
	private String address2;
	private String review;
	private String itemdate;
	private double point;
	
	//생성자
	public ItemVo() {
	}
	public ItemVo(int itemNo, int usersNo, int sellerNo, int cartNo, int historyNo, int itemphotoNo, String category,
			String title, String info, int cost, String stringcost, int ea, String path, String infopath, String status,
			int views, String hp, String address1, String address2, String review, String itemdate, double point) {
		this.itemNo = itemNo;
		this.usersNo = usersNo;
		this.sellerNo = sellerNo;
		this.cartNo = cartNo;
		this.historyNo = historyNo;
		this.itemphotoNo = itemphotoNo;
		this.category = category;
		this.title = title;
		this.info = info;
		this.cost = cost;
		this.stringcost = stringcost;
		this.ea = ea;
		this.path = path;
		this.infopath = infopath;
		this.status = status;
		this.views = views;
		this.hp = hp;
		this.address1 = address1;
		this.address2 = address2;
		this.review = review;
		this.itemdate = itemdate;
		this.point = point;
	}

	//메소드 g/s
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public int getUsersNo() {
		return usersNo;
	}
	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}
	public int getSellerNo() {
		return sellerNo;
	}
	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}
	public int getItemphotoNo() {
		return itemphotoNo;
	}
	public void setItemphotoNo(int itemphotoNo) {
		this.itemphotoNo = itemphotoNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getItemdate() {
		return itemdate;
	}
	public void setItemdate(String itemdate) {
		this.itemdate = itemdate;
	}
	public double getPoint() {
		return point;
	}
	public void setPoint(double point) {
		this.point = point;
	}
	public String getStringcost() {
		return stringcost;
	}
	public void setStringcost(String stringcost) {
		this.stringcost = stringcost;
	}
	public String getInfopath() {
		return infopath;
	}
	public void setInfopath(String infopath) {
		this.infopath = infopath;
	}
	
	//
	@Override
	public String toString() {
		return "ItemVo [itemNo=" + itemNo + ", usersNo=" + usersNo + ", sellerNo=" + sellerNo + ", cartNo=" + cartNo
				+ ", historyNo=" + historyNo + ", itemphotoNo=" + itemphotoNo + ", category=" + category + ", title="
				+ title + ", info=" + info + ", cost=" + cost + ", stringcost=" + stringcost + ", ea=" + ea + ", path="
				+ path + ", infopath=" + infopath + ", status=" + status + ", views=" + views + ", hp=" + hp
				+ ", address1=" + address1 + ", address2=" + address2 + ", review=" + review + ", itemdate=" + itemdate
				+ ", point=" + point + "]";
	}
}
