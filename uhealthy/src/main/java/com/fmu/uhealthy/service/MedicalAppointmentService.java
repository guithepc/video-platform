package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.MedicalAppointment;

import java.util.List;

public interface MedicalAppointmentService {

    List<MedicalAppointment> findAll();

    MedicalAppointment save(MedicalAppointment medicalAppointment);

    void getAvailableDatesByDoctorId();

}
