package com.fmu.uhealthy.controller;

import com.fmu.uhealthy.domain.User;
import com.fmu.uhealthy.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {

    private final UserService service;
    private final PasswordEncoder encoder;

    public UserController(UserService service, PasswordEncoder encoder) {
        this.service = service;
        this.encoder = encoder;
    }

    @GetMapping
    public ResponseEntity<List<User>> findAll() {
        return ResponseEntity.ok(service.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> findById(@PathVariable Long id) {
        var user = service.findById(id);
        return user.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<User> save(@RequestBody User user) {
        user.setPassword(encoder.encode(user.getPassword()));
        return ResponseEntity.ok(service.save(user));
    }
}
