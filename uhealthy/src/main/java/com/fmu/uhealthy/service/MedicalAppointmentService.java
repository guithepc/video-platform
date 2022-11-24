package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.MedicalAppointment;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Map;

public interface MedicalAppointmentService {

    List<MedicalAppointment> findAll();

    MedicalAppointment save(MedicalAppointment medicalAppointment);

    Map<LocalDate, List<LocalDateTime>> getAvailableDatesByDoctorId(Long doctorId);

}
