package com.fmu.uhealthy.controller;

import com.fmu.uhealthy.domain.MedicalAppointment;
import com.fmu.uhealthy.dto.AvailableDatesDTO;
import com.fmu.uhealthy.dto.constants.UpdateAppointmentDTO;
import com.fmu.uhealthy.service.MedicalAppointmentService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    public ResponseEntity<List<AvailableDatesDTO>> getAvailableDates(@RequestParam("doctorId") Long doctorId){
        return ResponseEntity.ok(service.getAvailableDatesByDoctorId(doctorId));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> update(@PathVariable("id") Long appointmentId, @RequestBody UpdateAppointmentDTO updateAppointmentDTO){
        service.rescheduleAppointment(appointmentId, updateAppointmentDTO);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/{id}/finish")
    public ResponseEntity<Void> finishAppointment(@PathVariable("id") Long id){
        service.finishAppointment(id);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> cancelAppointment(@PathVariable("id") Long appointmentId){
        service.cancelAppointment(appointmentId);
        return ResponseEntity.ok().build();
    }
}
