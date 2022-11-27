package com.fmu.uhealthy.controller;

import com.fmu.uhealthy.domain.Speciality;
import com.fmu.uhealthy.service.SpecialityService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/speciality")
public class SpecialityController {

    private final SpecialityService service;

    public SpecialityController(SpecialityService service) {
        this.service = service;
    }

    @GetMapping
    public ResponseEntity<List<Speciality>> findAll(){
        return ResponseEntity.ok(service.findAllSpecialities());
    }
}
