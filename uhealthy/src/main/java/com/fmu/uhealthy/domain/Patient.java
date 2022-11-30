
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
@Entity(name="patient")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    private String documentNumber;

    @CreationTimestamp
    private LocalDate createDate;

    @Column(name = "birth_date")
    private LocalDate birthDate;

    @ManyToOne
    @JoinColumn(name = "gender_id")
    private Gender gender;

    @JsonIgnore
    @OneToOne(mappedBy = "patient", fetch = FetchType.LAZY)
    private User user;

    @Transient
    private String profileImage;

    @Transient
    private String email;

    @Transient
    private String phone;

    @SuppressWarnings("unused")
    public String getProfileImage() {
        return user!= null ? user.getProfileImage() : "";
    }

    @SuppressWarnings("unused")
    public String getEmail() {
        return user!= null ? user.getLogin() : "";
    }

    @SuppressWarnings("unused")
    public String getPhone() {
        return user!= null ? user.getPhone() : "";
    }
}
