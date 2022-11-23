package com.fmu.uhealthy.repository;

import com.fmu.uhealthy.domain.Status;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface StatusRepository extends JpaRepository<Status, Integer> {

    Optional<Status> findByCode(String code);
}
