package com.fmu.uhealthy.repository;

import com.fmu.uhealthy.domain.MedicalAppointment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MedicalAppointmentRepository extends JpaRepository<MedicalAppointment, Long> {


    List<MedicalAppointment> findAllByPatientIdAndStatus_IdOrderByAppointmentDate(Long patientId, Integer id);

    List<MedicalAppointment> findAllByPatientIdOrderByAppointmentDate(Long patientId);

    List<MedicalAppointment> findAllByDoctorIdAndStatus_IdOrderByAppointmentDate(Long doctorId, Integer id);

    List<MedicalAppointment> findAllByDoctorIdOrderByAppointmentDate(Long doctorId);
}
