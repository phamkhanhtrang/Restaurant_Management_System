package com.example.repository;

import com.example.domain.CustomerUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CustomerRepository extends JpaRepository<CustomerUser, Long> {
    Optional <CustomerUser> findByUuid (String uuid);
    Optional <CustomerUser> findByUserName (String userName);
}
