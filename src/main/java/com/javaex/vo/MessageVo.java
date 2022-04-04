package com.javaex.vo;

	public class MessageVo {
	//메세지 테이블
	private int messegeNo;
	private int usersFrom;
	private int usersTo;
	private String sendDate;
	private String text;
	private int target;
	private int me;
	   
	//users 테이블
	private int usersNo;
	private String name;
	private int usersType;
	private String path;
	   
	private String usersFromName;
	
	public MessageVo() {
	}

	public MessageVo(int messegeNo, int usersFrom, int usersTo, String sendDate, String text, int target, int me,
			int usersNo, String name, int usersType, String path, String usersFromName) {
		this.messegeNo = messegeNo;
		this.usersFrom = usersFrom;
		this.usersTo = usersTo;
		this.sendDate = sendDate;
		this.text = text;
		this.target = target;
		this.me = me;
		this.usersNo = usersNo;
		this.name = name;
		this.usersType = usersType;
		this.path = path;
		this.usersFromName = usersFromName;
	}

	public int getMessegeNo() {
		return messegeNo;
	}

	public void setMessegeNo(int messegeNo) {
		this.messegeNo = messegeNo;
	}

	public int getUsersFrom() {
		return usersFrom;
	}

	public void setUsersFrom(int usersFrom) {
		this.usersFrom = usersFrom;
	}

	public int getUsersTo() {
		return usersTo;
	}

	public void setUsersTo(int usersTo) {
		this.usersTo = usersTo;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getTarget() {
		return target;
	}

	public void setTarget(int target) {
		this.target = target;
	}

	public int getMe() {
		return me;
	}

	public void setMe(int me) {
		this.me = me;
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

	public int getUsersType() {
		return usersType;
	}

	public void setUsersType(int usersType) {
		this.usersType = usersType;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getUsersFromName() {
		return usersFromName;
	}

	public void setUsersFromName(String usersFromName) {
		this.usersFromName = usersFromName;
	}

	@Override
	public String toString() {
		return "MessageVo [messegeNo=" + messegeNo + ", usersFrom=" + usersFrom + ", usersTo=" + usersTo + ", sendDate="
				+ sendDate + ", text=" + text + ", target=" + target + ", me=" + me + ", usersNo=" + usersNo + ", name="
				+ name + ", usersType=" + usersType + ", path=" + path + ", usersFromName=" + usersFromName + "]";
	}

	
	   
	   
}