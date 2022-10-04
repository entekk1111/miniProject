package com.miniProject.model;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class SessionVO implements Serializable {

	private static final long serialVersionUID = 4087574708765700516L;
	@NotBlank(message = "아이디를 입력해 주세요")
	String id;
	
	@NotBlank(message = "비밀번호를 입력해 주세요")
	String password;
	
	@Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,6}$", message = "이메일 형식이 올바르지 않습니다.")    
	@NotBlank(message = "이메일은 필수 입력 값입니다.")
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