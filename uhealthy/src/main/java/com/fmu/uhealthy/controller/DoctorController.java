package com.fmu.uhealthy.controller;

import com.fmu.uhealthy.domain.Doctor;
import com.fmu.uhealthy.service.DoctorService;
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

    @GetMapping("/{id}")
    public ResponseEntity<Doctor> findAll(@PathVariable("id") Long id){
        var optionalDoctor = service.findDoctorById(id);
        return optionalDoctor.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping("/speciality/{id}")
    public ResponseEntity<List<Doctor>> findAll(@PathVariable("id") Integer specialityId){
        return ResponseEntity.ok(service.findAllDoctorBySpecialityId(specialityId));
    }
}
