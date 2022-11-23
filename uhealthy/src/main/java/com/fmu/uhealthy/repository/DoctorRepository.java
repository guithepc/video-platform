package com.fmu.uhealthy.repository;

import com.fmu.uhealthy.domain.Doctor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DoctorRepository extends JpaRepository<Doctor, Long> {


}
