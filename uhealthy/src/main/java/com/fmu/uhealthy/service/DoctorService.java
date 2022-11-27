package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.Doctor;

import java.util.List;

public interface DoctorService {

    List<Doctor> findAllDoctorBySpecialityId(Integer specialityId);
}
