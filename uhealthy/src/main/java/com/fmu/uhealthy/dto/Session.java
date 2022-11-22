package com.fmu.uhealthy.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fmu.uhealthy.domain.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.security.Principal;
import java.util.Objects;

@AllArgsConstructor
@NoArgsConstructor
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class Session implements Serializable, Principal {

    private User user;

    private String name;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Session session = (Session) o;
        return user.getId().equals(session.user.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(user);
    }


    @Override
    public String getName(){
        return user.getLogin();
    }
}
