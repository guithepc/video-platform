package com.fmu.uhealthy.service;


import com.fmu.uhealthy.domain.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public interface UserService {

//    User login(String login, String password);

    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException;

}
