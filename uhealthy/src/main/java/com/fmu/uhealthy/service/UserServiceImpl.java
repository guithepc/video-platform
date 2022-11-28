package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.User;
import com.fmu.uhealthy.dto.UserDTO;
import com.fmu.uhealthy.repository.UserRepository;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;

@Component
public class UserServiceImpl implements UserDetailsService, UserService {

    private final UserRepository repository;

    public UserServiceImpl(UserRepository repository) {
        this.repository = repository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> user = repository.findByLogin(username);
        if (user.isEmpty()) {
            throw new UsernameNotFoundException("Usuário [" + username + "] não encontrado");
        }

        return new UserDTO(user.get());
    }

    @Override
    public List<User> findAll(){
        return repository.findAll();
    }

    @Override
    public Optional<User> findById(Long id){
        return repository.findById(id);
    }

    @Override
    public void editProfileImage(Long id, String encodedString){
        var user = repository.getById(id);
        user.setProfileImage(encodedString);
        repository.save(user);
    }

    @Override
    public User save(User user){
        return repository.save(user);
    }

    @Override
    public User getCurrentUser(){
        var login = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
        return repository.findByLogin(login).orElseThrow(EntityNotFoundException::new);
    }
}
