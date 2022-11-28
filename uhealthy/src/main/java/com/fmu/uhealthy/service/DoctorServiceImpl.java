package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.Doctor;
import com.fmu.uhealthy.repository.DoctorRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DoctorServiceImpl implements DoctorService {

    public final DoctorRepository repository;

    public DoctorServiceImpl(DoctorRepository repository) {
        this.repository = repository;
    }

    @Override
    public Optional<Doctor> findDoctorById(Long id){
        return repository.findById(id);
    }

    @Override
    public List<Doctor> findAllDoctorBySpecialityId(Integer specialityId){
        return repository.findAllBySpeciality_Id(specialityId);
    }

}
