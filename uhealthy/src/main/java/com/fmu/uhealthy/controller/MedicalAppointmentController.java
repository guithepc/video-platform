package com.fmu.uhealthy.controller;

import com.fmu.uhealthy.domain.MedicalAppointment;
import com.fmu.uhealthy.service.MedicalAppointmentService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/medical-appointment")
public class MedicalAppointmentController {

    private final MedicalAppointmentService service;


    public MedicalAppointmentController(MedicalAppointmentService service) {
        this.service = service;
    }

    @GetMapping("/user")
    public ResponseEntity<List<MedicalAppointment>> findAllByUserId(){
        return ResponseEntity.ok(service.findAll());
    }

    @PostMapping
    public ResponseEntity<MedicalAppointment> save(@RequestBody MedicalAppointment medicalAppointment){
        return ResponseEntity.ok(service.save(medicalAppointment));
    }

    @GetMapping("/available-appointment-date")
    public ResponseEntity<Map<String, String>> getAvailableDates(){
        service.getAvailableDatesByDoctorId();;
        return ResponseEntity.ok().build();
    }
}
