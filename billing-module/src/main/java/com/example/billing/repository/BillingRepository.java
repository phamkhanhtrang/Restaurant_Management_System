package com.example.repository;

import com.example.domain.Billing;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BillingRepository extends JpaRepository<Billing, String> {
    List<Billing> findByName(String name);
//    Optional <Billing> findBy (String id);
}
