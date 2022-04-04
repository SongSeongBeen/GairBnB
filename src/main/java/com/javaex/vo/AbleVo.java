package com.javaex.vo;

public class AbleVo {
	
	private int ableNo;
	private int hostNo;
	private String ableDate;
	
	public AbleVo() {
		
	}

	public AbleVo(int ableNo, int hostNo, String ableDate) {
		this.ableNo = ableNo;
		this.hostNo = hostNo;
		this.ableDate = ableDate;
	}

	public int getAbleNo() {
		return ableNo;
	}

	public void setAbleNo(int ableNo) {
		this.ableNo = ableNo;
	}

	public int getHostNo() {
		return hostNo;
	}

	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}

	public String getAbleDate() {
		return ableDate;
	}

	public void setAbleDate(String ableDate) {
		this.ableDate = ableDate;
	}

	@Override
	public String toString() {
		return "AbleVo [ableNo=" + ableNo + ", hostNo=" + hostNo + ", ableDate=" + ableDate + "]";
	}
	
	
	
	

}
