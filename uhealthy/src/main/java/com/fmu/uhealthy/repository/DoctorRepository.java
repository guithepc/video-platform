package com.fmu.uhealthy.repository;

import com.fmu.uhealthy.domain.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DoctorRepository extends JpaRepository<Doctor, Long> {

    List<Doctor> findAllBySpeciality_Id(Integer specialityId);

}
