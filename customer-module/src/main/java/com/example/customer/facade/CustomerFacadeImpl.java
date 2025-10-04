package com.example.customer.facade;

import com.example.customer.domain.CustomerDTO;
import com.example.customer.service.CustomerService;
import org.springframework.stereotype.Service;

@Service
public class CustomerFacadeImpl implements CustomerFacade {
    private final CustomerService customerService;
    
    public CustomerFacadeImpl(CustomerService customerService) {
        this.customerService = customerService;
    }
    
    @Override
    public boolean existsById(Long id) {
        return customerService.getUserById(id) !=null;
    }
    
    @Override
    public CustomerDTO getCustomerById(Long id) {
        return customerService.getUserById(id);
    }
}
