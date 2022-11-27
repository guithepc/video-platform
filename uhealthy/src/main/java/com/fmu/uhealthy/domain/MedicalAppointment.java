package com.fmu.uhealthy.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name="medical_appointment")
public class MedicalAppointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @ManyToOne
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    @ManyToOne
    @JoinColumn(name = "status_id")
    private Status status;

    @ManyToOne
    @JoinColumn(name = "speciality_id")
    private Speciality speciality;

    @Column(name = "observation")
    private String observation;

    @Column(name = "create_date")
    private LocalDate createDate;

    @Column(name = "appointment_date")
    private LocalDateTime appointmentDate;

    @Transient
    private Integer statusId;
}
