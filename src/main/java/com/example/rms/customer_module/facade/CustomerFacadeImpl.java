package com.example.rms.customer_module.facade;

import com.example.rms.customer_module.domain.CustomerDTO;
import com.example.rms.customer_module.service.CustomerService;
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
