package com.fmu.uhealthy.repository;

import com.fmu.uhealthy.domain.MedicalAppointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MedicalAppointmentRepository extends JpaRepository<MedicalAppointment, Long> {

    List<MedicalAppointment> findAllByPatientId(Long patientId);

    List<MedicalAppointment> findAllByDoctorId(Long doctorId);
}
