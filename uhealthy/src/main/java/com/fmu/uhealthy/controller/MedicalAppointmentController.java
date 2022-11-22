package com.fmu.uhealthy.controller;

import com.fmu.uhealthy.domain.MedicalAppointment;
import com.fmu.uhealthy.service.MedicalAppointmentService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/medical-appointment")
public class MedicalAppointmentController {

    private final MedicalAppointmentService service;


    public MedicalAppointmentController(MedicalAppointmentService service) {
        this.service = service;
    }

    @GetMapping("/user/{id}")
    public ResponseEntity<List<MedicalAppointment>> findAllByUserId(@PathVariable("id") Long userId){
        return ResponseEntity.ok(service.findAllByUserId(userId));
    }
}
