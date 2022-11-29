
package com.fmu.uhealthy.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name="doctor")
public class Doctor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "crm")
    private String crm;

    @Column(name = "document_number")
    private String documentNumber;

    @CreationTimestamp
    @Column(name = "create_date")
    private LocalDate createDate;

    @Column(name = "birth_date")
    private LocalDate birthDate;

    @ManyToOne
    private Speciality speciality;

    @ManyToOne
    @JoinColumn(name = "gender_id")
    private Gender gender;

    @Column(name = "start_at")
    private String startAt;

    @Column(name = "end_at")
    private String endAt;

    @JsonIgnore
    @OneToOne(mappedBy = "doctor", fetch = FetchType.LAZY)
    private User user;

    @ManyToOne
    @JoinColumn(name = "clinic_id")
    private Clinic clinic;

    @Transient
    private String profileImage;

    @SuppressWarnings("unused")
    public String getProfileImage() {
        return user!= null ? user.getProfileImage() : null;
    }
}
