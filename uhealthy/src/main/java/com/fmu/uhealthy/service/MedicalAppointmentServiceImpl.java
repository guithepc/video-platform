package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.Doctor;
import com.fmu.uhealthy.domain.MedicalAppointment;
import com.fmu.uhealthy.repository.DoctorRepository;
import com.fmu.uhealthy.repository.MedicalAppointmentRepository;
import com.fmu.uhealthy.repository.StatusRepository;
import com.fmu.uhealthy.repository.UserRepository;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class MedicalAppointmentServiceImpl implements MedicalAppointmentService {

    private final MedicalAppointmentRepository repository;
    private final UserRepository userRepository;
    private final StatusRepository statusRepository;
    private final DoctorRepository doctorRepository;
    private final String SCHEDULED_STATUS = "scheduled";

    public MedicalAppointmentServiceImpl(MedicalAppointmentRepository repository, UserRepository userRepository, StatusRepository statusRepository, DoctorRepository doctorRepository) {
        this.repository = repository;
        this.userRepository = userRepository;
        this.statusRepository = statusRepository;
        this.doctorRepository = doctorRepository;
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

    public void getAvailableDatesByDoctorId(){
        var doctor = doctorRepository.getById(1L);
        var startDate = LocalDate.now();
        var endDate = startDate.plusMonths(3);
        var appointmentDates = List.of(LocalDateTime.now().plusHours(1),
                LocalDateTime.now().plusHours(2), LocalDateTime.now().plusHours(3), LocalDateTime.now().plusHours(4),
                LocalDateTime.now().plusHours(5));
        List<LocalDateTime> dates = new ArrayList<>();
        Map<String, String> resultMap = new HashMap<>();
        var previewDate = startDate.atStartOfDay();
        while (previewDate.toLocalDate().isBefore(endDate)) {
            LocalDateTime d = previewDate.plusMinutes(30);
            var actualDate = d.toLocalDate();
            var doctorStartAt = LocalDateTime.parse(actualDate + "T" + doctor.getStartAt());
            var doctorEndAt = LocalDateTime.parse(actualDate + "T" + doctor.getEndAt());
            if(d.isAfter(doctorStartAt) && d.isBefore(doctorEndAt)){
                dates.add(d);
            }
            previewDate = d;
        }
    }

}
