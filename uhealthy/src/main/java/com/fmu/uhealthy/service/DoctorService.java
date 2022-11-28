package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.Doctor;

import java.util.List;
import java.util.Optional;

public interface DoctorService {

    Optional<Doctor> findDoctorById(Long id);

    List<Doctor> findAllDoctorBySpecialityId(Integer specialityId);
}
