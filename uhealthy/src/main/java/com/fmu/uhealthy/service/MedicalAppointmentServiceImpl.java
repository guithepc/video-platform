package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.MedicalAppointment;
import com.fmu.uhealthy.repository.MedicalAppointmentRepository;
import com.fmu.uhealthy.repository.StatusRepository;
import com.fmu.uhealthy.repository.UserRepository;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class MedicalAppointmentServiceImpl implements MedicalAppointmentService {

    private final MedicalAppointmentRepository repository;
    private final UserRepository userRepository;
    private final StatusRepository statusRepository;
    private final String SCHEDULED_STATUS = "scheduled";

    public MedicalAppointmentServiceImpl(MedicalAppointmentRepository repository, UserRepository userRepository, StatusRepository statusRepository) {
        this.repository = repository;
        this.userRepository = userRepository;
        this.statusRepository = statusRepository;
    }

    @Override
    public List<MedicalAppointment> findAll(){
        var login = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
        var user = userRepository.findByLogin(login).orElseThrow(EntityNotFoundException::new);
        if(user.getPatient() != null)
            return repository.findAllByPatientId(user.getPatient().getId());
        else if(user.getDoctor() !=null)
            return repository.findAllByDoctorId(user.getDoctor().getId());
        else
            throw new RuntimeException("Não foi possível carregar as informações do usuário");
    }

    @Override
    public MedicalAppointment save(MedicalAppointment medicalAppointment){
        var status = statusRepository.findByCode(SCHEDULED_STATUS).orElseThrow(EntityNotFoundException::new);
        medicalAppointment.setStatus(status);
        return repository.save(medicalAppointment);
    }

}
