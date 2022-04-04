package com.javaex.vo;

import org.springframework.web.multipart.MultipartFile;

public class MyDogVo {

	private int usersNo;
	private int myDogNo;
	private String photo;
	private String name;
	private String birth;
	private String gender;
	private String breed;
	private int weight;
	private int neuter;
	private MultipartFile file;
	private String saveName;

	public MyDogVo() {
	}

	public MyDogVo(int usersNo, int myDogNo, String photo, String name, String birth, String gender, String breed,
			int weight, int neuter, MultipartFile file, String saveName) {
		this.usersNo = usersNo;
		this.myDogNo = myDogNo;
		this.photo = photo;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.breed = breed;
		this.weight = weight;
		this.neuter = neuter;
		this.file = file;
		this.saveName = saveName;
	}



	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public int getMyDogNo() {
		return myDogNo;
	}

	public void setMyDogNo(int myDogNo) {
		this.myDogNo = myDogNo;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getNeuter() {
		return neuter;
	}

	public void setNeuter(int neuter) {
		this.neuter = neuter;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	@Override
	public String toString() {
		return "MyDogVo [usersNo=" + usersNo + ", myDogNo=" + myDogNo + ", photo=" + photo + ", name=" + name
				+ ", birth=" + birth + ", gender=" + gender + ", breed=" + breed + ", weight=" + weight + ", neuter="
				+ neuter + ", file=" + file + ", saveName=" + saveName + "]";
	}

	
	
	

}
