package com.example.customer.repository;

import com.example.customer.domain.CustomerProfile;
import com.example.customer.domain.CustomerUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CustomerProfileRepository extends JpaRepository<CustomerProfile, Long> {

    Optional<CustomerProfile> findByCustomer(CustomerUser customer);

    Optional<CustomerProfile> findByCustomer_Id(Long customerId);
}





