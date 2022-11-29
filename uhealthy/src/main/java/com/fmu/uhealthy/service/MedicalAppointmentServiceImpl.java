package com.fmu.uhealthy.service;

import com.fmu.uhealthy.domain.MedicalAppointment;
import com.fmu.uhealthy.dto.AvailableDatesDTO;
import com.fmu.uhealthy.dto.constants.UpdateAppointmentDTO;
import com.fmu.uhealthy.repository.DoctorRepository;
import com.fmu.uhealthy.repository.MedicalAppointmentRepository;
import com.fmu.uhealthy.repository.StatusRepository;
import com.fmu.uhealthy.repository.UserRepository;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MedicalAppointmentServiceImpl implements MedicalAppointmentService {

    private final MedicalAppointmentRepository repository;
    private final UserRepository userRepository;
    private final StatusRepository statusRepository;
    private final DoctorRepository doctorRepository;
    private final String SCHEDULED_STATUS = "scheduled";
    private final String CANCELED_STATUS = "canceled";

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
        var status = statusRepository.findByCode(SCHEDULED_STATUS).orElseThrow(EntityNotFoundException::new);
        if(user.getPatient() != null)
            return repository.findAllByPatientIdAndStatus_Id(user.getPatient().getId(), status.getId());
        else if(user.getDoctor() !=null)
            return repository.findAllByDoctorIdAndStatus_Id(user.getDoctor().getId(), status.getId());
        else
            throw new RuntimeException("Não foi possível carregar as informações do usuário");
    }

    @Override
    public MedicalAppointment save(MedicalAppointment medicalAppointment){
        var status = statusRepository.findByCode(SCHEDULED_STATUS).orElseThrow(EntityNotFoundException::new);
        medicalAppointment.setStatus(status);
        return repository.save(medicalAppointment);
    }

    @Override
    public List<AvailableDatesDTO> getAvailableDatesByDoctorId(Long doctorId){
        var doctor = doctorRepository.getById(doctorId);
        var status = statusRepository.findByCode(SCHEDULED_STATUS).orElseThrow(EntityNotFoundException::new);
        var startDate = toZeroSeconds(LocalDateTime.now());
        var endDate = toZeroSeconds(LocalDate.now().plusDays(3).atTime(0, 0));
        if(startDate.getMinute() > 30)
            startDate = startDate.plusHours(1).withMinute(0);
        else
            startDate = startDate.withMinute(0);
        List<LocalDateTime> dates = new ArrayList<>();
        var doctorStart = toZeroSeconds(LocalTime.parse(doctor.getStartAt()));
        var doctorEnd = toZeroSeconds(LocalTime.parse(doctor.getEndAt()));
        var date = startDate;
        while(date.isBefore(endDate)){
            if(date.toLocalTime().compareTo(doctorStart) >= 0 && date.toLocalTime().compareTo(doctorEnd) <= 0) {
                dates.add(date);
            }
            date = date.plusMinutes(30);
        }
        var scheduledDates =  repository.findAllByDoctorIdAndStatus_Id(doctorId, status.getId()).stream().map(MedicalAppointment::getAppointmentDate).collect(Collectors.toList());
        scheduledDates.forEach(scheduledDate -> {
            scheduledDate = toZeroSeconds(scheduledDate);
            dates.remove(scheduledDate);
        });
        var dateMap = dates.stream().collect(Collectors.groupingBy(LocalDateTime::toLocalDate, Collectors.toList()));
        return dateMap.keySet().stream()
                .map(key -> AvailableDatesDTO.builder().date(key).hours(dateMap.get(key)).build()).collect(Collectors.toList());
    }

    @Override
    public void rescheduleAppointment(Long appointmentId, UpdateAppointmentDTO updateAppointmentDTO){
        var appointment = repository.getById(appointmentId);
        appointment.setAppointmentDate(updateAppointmentDTO.getAppointmentDate());
        repository.save(appointment);
    }

    @Override
    public void cancelAppointment(Long appointmentId){
        var appointment = repository.getById(appointmentId);
        var status = statusRepository.findByCode(CANCELED_STATUS).orElseThrow(EntityNotFoundException::new);
        appointment.setStatus(status);
        repository.save(appointment);
    }

    private LocalTime toZeroSeconds(LocalTime time){
        return time.withSecond(0).withNano(0);
    }

    private LocalDateTime toZeroSeconds(LocalDateTime dateTime){
        return dateTime.withSecond(0).withNano(0);
    }

}
