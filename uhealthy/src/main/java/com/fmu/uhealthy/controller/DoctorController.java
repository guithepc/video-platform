package com.fmu.uhealthy.controller;

import com.fmu.uhealthy.domain.Doctor;
import com.fmu.uhealthy.domain.Speciality;
import com.fmu.uhealthy.service.DoctorService;
import com.fmu.uhealthy.service.SpecialityService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/doctor")
public class DoctorController {

    private final DoctorService service;

    public DoctorController(DoctorService service) {
        this.service = service;
    }

    @GetMapping("/speciality/{id}")
    public ResponseEntity<List<Doctor>> findAll(@PathVariable("id") Integer specialityId){
        return ResponseEntity.ok(service.findAllDoctorBySpecialityId(specialityId));
    }
}
