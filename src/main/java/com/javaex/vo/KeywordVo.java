package com.javaex.vo;

public class KeywordVo {

	//필드
	private int hostNo;
	private int keywordNo;
	private String keywordName;
	
	//생성자
	public KeywordVo() {
	}
	public KeywordVo(int hostNo, int keywordNo, String keywordName) {
		this.hostNo = hostNo;
		this.keywordNo = keywordNo;
		this.keywordName = keywordName;
	}

	//메소드 g/s
	public int getHostNo() {
		return hostNo;
	}
	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}
	public int getKeywordNo() {
		return keywordNo;
	}
	public void setKeywordNo(int keywordNo) {
		this.keywordNo = keywordNo;
	}
	public String getKeywordName() {
		return keywordName;
	}
	public void setKeywordName(String keywordName) {
		this.keywordName = keywordName;
	}


	//메소드 일반
	@Override
	public String toString() {
		return "KeywordVo [hostNo=" + hostNo + ", keywordName=" + keywordName + "]";
	}
	
}
