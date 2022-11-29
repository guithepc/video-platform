package com.fmu.uhealthy.repository;

import com.fmu.uhealthy.domain.MedicalAppointment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MedicalAppointmentRepository extends JpaRepository<MedicalAppointment, Long> {

    List<MedicalAppointment> findAllByPatientId(Long patientId);

    List<MedicalAppointment> findAllByPatientIdAndStatus_Id(Long patientId, Integer id);

    List<MedicalAppointment> findAllByDoctorId(Long doctorId);

    List<MedicalAppointment> findAllByDoctorIdAndStatus_Id(Long doctorId, Integer id);
}
