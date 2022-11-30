package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.MedicalAppointment;
import com.fmu.uhealthy.dto.AvailableDatesDTO;
import com.fmu.uhealthy.dto.constants.UpdateAppointmentDTO;

import java.util.List;

public interface MedicalAppointmentService {

    List<MedicalAppointment> findAll();

    MedicalAppointment save(MedicalAppointment medicalAppointment);

    List<AvailableDatesDTO> getAvailableDatesByDoctorId(Long doctorId);

    void rescheduleAppointment(Long appointmentId, UpdateAppointmentDTO updateAppointmentDTO);

    void cancelAppointment(Long appointmentId);

    void finishAppointment(Long id);

}
