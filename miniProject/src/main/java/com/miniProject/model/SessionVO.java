package com.miniProject.model;

import java.io.Serializable;

public class SessionVO implements Serializable {

	private static final long serialVersionUID = 4087574708765700516L;
	String id;
	String password;
	String email;
	String sex;
	String age;
	String userAuth;
	String memberNum;
	
	public String getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getUserAuth() {
		return userAuth;
	}

	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}

//	public SessionVO(String id, String password, String email, String sex, String age, String userAuth) {
//		super();
//		this.id = id;
//		this.password = password;
//		this.email = email;
//		this.sex = sex;
//		this.age = age;
//		this.userAuth = userAuth;
//	}
    
}