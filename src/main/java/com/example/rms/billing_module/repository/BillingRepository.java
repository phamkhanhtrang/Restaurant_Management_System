package com.example.rms.billing_module.repository;

import com.example.rms.billing_module.domain.Billing;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BillingRepository extends JpaRepository<Billing, String> {
    List<Billing> findByName(String name);
//    Optional <Billing> findBy (String id);
}
