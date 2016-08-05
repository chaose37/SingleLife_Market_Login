package org.single.domain;

public class UserVO {
	private String email;
	private String password;
	private String gender;
	private String birthday;
	private String postcode;
	private String address;
	private String chk;
	private String uuid;
	private String id;
	private String profilepath;
	private String users;
	private String developer;
	
	public String getUsers() {
		return users;
	}
	public void setUsers(String users) {
		this.users = users;
	}
	public String getDeveloper() {
		return developer;
	}
	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	public String getProfilepath() {
		return profilepath;
	}
	public void setProfilepath(String profilepath) {
		this.profilepath = profilepath;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getChk() {
		return chk;
	}
	public void setChk(String chk) {
		this.chk = chk;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	@Override
	public String toString() {
		return "UserVO [email=" + email + ", password=" + password + ", gender=" + gender + ", birthday=" + birthday
				+ ", postcode=" + postcode + ", address=" + address + ", chk=" + chk + ", uuid=" + uuid + ", id=" + id
				+ ", profilepath=" + profilepath + "]";
	}
}
