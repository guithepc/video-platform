package com.fmu.uhealthy.service;


import com.fmu.uhealthy.domain.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

public interface UserService {

    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException;

    List<User> findAll();

    Optional<User> findById(Long id);

    User save(User user);

}
