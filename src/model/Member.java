package model;

import java.sql.Date;

public class Member {
	private int num;
	private String id;
	private String pwd;
	private String name;
	private String nickname;
	private String phone;
	private Date birthdate;
	private String email;
	private String gender;
	private Date joinDate;
	private String address;
	private String prefCode;
	
	public Member() {};
	
	public Member(int num, String id, String pwd, String name, String nickname, String phone, Date birthdate, String email,
			String gender, Date joinDate, String address, String prefCode) {
		super();
		this.num=num;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.birthdate = birthdate;
		this.email = email;
		this.gender = gender;
		this.joinDate = joinDate;
		this.address = address;
		this.prefCode = prefCode;
	}
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}


	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPrefCode() {
		return prefCode;
	}

	public void setPrefCode(String prefCode) {
		this.prefCode = prefCode;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickname=" + nickname + ", phone=" + phone
				+ ", birthdate=" + birthdate + ", email=" + email + ", gender=" + gender
				+ ", joinDate=" + joinDate + ", address=" + address + ", prefCode=" + prefCode + "]";
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
}
