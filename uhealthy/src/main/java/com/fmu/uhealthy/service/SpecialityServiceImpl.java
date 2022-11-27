package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.Speciality;
import com.fmu.uhealthy.repository.SpecialityRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpecialityServiceImpl implements SpecialityService {

    public final SpecialityRepository repository;

    public SpecialityServiceImpl(SpecialityRepository repository) {
        this.repository = repository;
    }

    public List<Speciality> findAllSpecialities(){
        return repository.findAll();
    }

}
