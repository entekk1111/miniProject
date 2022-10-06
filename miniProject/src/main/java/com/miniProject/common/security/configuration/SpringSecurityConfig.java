package com.miniProject.common.security.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.header.writers.frameoptions.XFrameOptionsHeaderWriter;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig {
	
	@Autowired
	private AuthenticationSuccessHandler LoginSuccessHandler;           //로그인성공핸들러     
	
	@Autowired
	private AuthenticationFailureHandler LoginFailureHandler;			//로그인실패핸들러

	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
        	.authorizeRequests()
        		.antMatchers("/login", "/signUp", "/static/**", "/resources/**", "/register.do", "/check.*").permitAll()
        		.antMatchers("/*").hasRole("USER")
//        		.antMatchers("/*").hasRole("ADMIN")
//        		.anyRequest().authenticated()
            .and()
                .headers()
	                .addHeaderWriter(new XFrameOptionsHeaderWriter(
	                        XFrameOptionsHeaderWriter.XFrameOptionsMode.SAMEORIGIN))
            .and()
	            .formLogin()
		            .loginPage("/login")
		            .loginProcessingUrl("/loginProc")
		            .usernameParameter("username")
					.passwordParameter("password")
					.successHandler(LoginSuccessHandler)
					.failureHandler(LoginFailureHandler)
	        .and()
	            .logout()
	            	.logoutUrl("/logout")
		            .deleteCookies("JSESSIONID")
		            .clearAuthentication(true)
		            .invalidateHttpSession(true)
            .and()
	            .csrf().ignoringAntMatchers("/**")
            ;
        return http.build();
    }
	
//	@Bean
//    public WebSecurityCustomizer webSecurityCustomizer() {
//        return (web) -> web.ignoring().antMatchers("/resources/**", "/static/**");
//    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

}
