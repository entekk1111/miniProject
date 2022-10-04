package com.miniProject.common.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.miniProject.mapper.UserMapper;

@Service
public class UserSecurityService implements UserDetailsService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		CustomUserDetails cUserDetail = userMapper.getUserAccount(username);
		if(cUserDetail == null){
			throw new UsernameNotFoundException("사용자를 찾을수 없습니다.");
		}
		return cUserDetail;
         
//         Optional<SiteUser> user = this.userMapper.userCheck(username);
//        if (_siteUser.isEmpty()) {
//            throw new UsernameNotFoundException("사용자를 찾을수 없습니다.");
//        }
//        SiteUser siteUser = _siteUser.get();
//        List<GrantedAuthority> authorities = new ArrayList<>();
//        if ("admin".equals(username)) {
//            authorities.add(new SimpleGrantedAuthority(UserRole.ADMIN.getValue()));
//        } else {
//            authorities.add(new SimpleGrantedAuthority(UserRole.USER.getValue()));
//        }
//        return new User(siteUser.getUsername(), siteUser.getPassword(), authorities);
    }
}
	
	

