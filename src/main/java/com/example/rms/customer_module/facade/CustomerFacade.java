package com.example.rms.customer_module.facade;


import com.example.rms.customer_module.domain.CustomerDTO;
import com.example.rms.customer_module.domain.CustomerProfileDTO;


public interface CustomerFacade {
        
        // Kiểm tra khách hàng có tồn tại hay không
        boolean existsById(Long id);
        
        // Lấy thông tin cơ bản của khách hàng (đủ cho order/billing dùng)
        CustomerDTO getCustomerById(Long id);
    }

