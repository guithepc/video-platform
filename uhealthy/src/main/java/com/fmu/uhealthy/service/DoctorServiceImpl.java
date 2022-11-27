package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.Doctor;
import com.fmu.uhealthy.repository.DoctorRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService {

    public final DoctorRepository repository;

    public DoctorServiceImpl(DoctorRepository repository) {
        this.repository = repository;
    }

    public List<Doctor> findAllDoctorBySpecialityId(Integer specialityId){
        return repository.findAllBySpeciality_Id(specialityId);
    }

}
