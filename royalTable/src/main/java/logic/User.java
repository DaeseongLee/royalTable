package logic;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class User {
	@Size(min=3, max=10,message="아이디는 3자 이상 10자 이하로 입력하세요")
	private String userId;
	@Size(min=3, max=12,message="비밀번호는는 3자 이상 12자 이하로 입력하세요")
	private String password;
	@NotEmpty(message="사용자 이름은 필수입니다.")
	private String name;
	private int gender;
	private String phoneNum;
	private String address;
	private String email;
	
	//getter, setter, toString
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", name=" + name + ", gender=" + gender
				+ ", phoneNum=" + phoneNum + ", address=" + address + ", email=" + email + "]";
	}

}
