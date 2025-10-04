package com.example.rms.customer_module.service;

import com.example.rms.customer_module.domain.CustomerDTO;
import com.example.rms.customer_module.domain.CustomerProfileDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public interface CustomerService {

    CustomerDTO createUser(CustomerDTO dto);
    CustomerDTO getUserById(Long id);
    List<CustomerDTO> getAllUsers();
    CustomerDTO updateUser(Long id, CustomerDTO dto);
    void deleteUser(Long id);
    
    CustomerProfileDTO getProfileByUserId(Long userId);
    void deleteProfileByUserId(Long userId);
}
