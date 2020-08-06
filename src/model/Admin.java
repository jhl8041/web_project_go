package model;

public class Admin {
	String id;
	String pwd;
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
	public Admin(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}
	
	
}
