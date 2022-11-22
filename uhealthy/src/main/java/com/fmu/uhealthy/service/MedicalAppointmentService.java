package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.MedicalAppointment;

import java.util.List;

public interface MedicalAppointmentService {

    List<MedicalAppointment> findAllByUserId(Long userId);

}
