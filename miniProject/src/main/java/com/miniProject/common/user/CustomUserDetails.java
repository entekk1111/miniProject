package com.miniProject.common.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.miniProject.model.SessionVO;

public class CustomUserDetails implements UserDetails {

	private static final long serialVersionUID = -3838975279235142409L;

	private String username;
    private String password;
    private SessionVO sessionVO;
    
    private String userNum;
    private String email;
    private String sex;
    private String age;
    
	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();   
        authorities.add(new SimpleGrantedAuthority(this.sessionVO.getUserAuth()));
        
        return authorities;
		
//		return Collections.singletonList(new SimpleGrantedAuthority(this.userAuth));
    }

	public String getUserNum() {
		return userNum;
	}

	public void setUserNum(String userNum) {
		this.userNum = userNum;
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

	public void setUsername(String username) {
		this.username = username;
	}
    
	public void setPassword(String password) {
		this.password = password;
	}
		
    @Override
    public String getPassword() {
        return password;
    }
  
    @Override
    public String getUsername() {
        return username;
    }
  
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
  
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
  
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
  
    @Override
    public boolean isEnabled() {
        return true;
    }

	public SessionVO getSessionVO() {
		return sessionVO;
	}

	public void setSessionVO(SessionVO sessionVO) {
		this.sessionVO = sessionVO;
	}

}
