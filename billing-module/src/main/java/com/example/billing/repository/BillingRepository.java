package com.example.billing.repository;

import com.example.billing.domain.Billing;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BillingRepository extends JpaRepository<Billing, String> {
    List<Billing> findByName(String name);
//    Optional <Billing> findBy (String id);
}
