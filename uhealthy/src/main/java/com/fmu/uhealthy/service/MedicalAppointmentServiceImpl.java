package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.MedicalAppointment;
import com.fmu.uhealthy.repository.MedicalAppointmentRepository;
import com.fmu.uhealthy.repository.UserRepository;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class MedicalAppointmentServiceImpl implements MedicalAppointmentService {

    private final MedicalAppointmentRepository repository;
    private final UserRepository userRepository;

    public MedicalAppointmentServiceImpl(MedicalAppointmentRepository repository, UserRepository userRepository) {
        this.repository = repository;
        this.userRepository = userRepository;
    }

    @Override
    public List<MedicalAppointment> findAllByUserId(Long userId){
        var login = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
        var user = userRepository.findByLogin(login).orElseThrow(EntityNotFoundException::new);
        if(user.getPatient() != null)
            return repository.findAllByPatientId(user.getPatient().getId());
        else if(user.getDoctor() !=null)
            return repository.findAllByDoctorId(user.getDoctor().getId());
        else
            throw new RuntimeException("Não foi possível carregar as informações do usuário");
    }

}
