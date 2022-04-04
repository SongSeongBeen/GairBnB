package com.javaex.vo;

public class UserVo {
	private int usersNo;
	private String id;
	private String password;
	private String name;
	private String hp;
	private String path;
	private int usersType;
	private int hostNo;

	public UserVo() {
	}

	public UserVo(int userNo, String id, String password, String name, String hp, String path, int usersType, int hostNo) {
		this.usersNo = userNo;
		this.id = id;
		this.password = password;
		this.name = name;
		this.hp = hp;
		this.path = path;
		this.usersType = usersType;
		this.hostNo = hostNo;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public int getUsersType() {
		return usersType;
	}

	public void setUsersType(int usersType) {
		this.usersType = usersType;
	}

	public int getHostNo() {
		return hostNo;
	}

	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}

	@Override
	public String toString() {
		return "UserVo [usersNo=" + usersNo + ", id=" + id + ", password=" + password + ", name=" + name + ", hp=" + hp
				+ ", path=" + path + ", usersType=" + usersType + ", hostNo=" + hostNo + "]";
	}

}
