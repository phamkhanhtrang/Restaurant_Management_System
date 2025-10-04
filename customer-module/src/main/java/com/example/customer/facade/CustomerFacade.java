package com.example.facade;


import com.example.domain.CustomerDTO;
import com.example.domain.CustomerProfileDTO;


public interface CustomerFacade {
        
        // Kiểm tra khách hàng có tồn tại hay không
        boolean existsById(Long id);
        
        // Lấy thông tin cơ bản của khách hàng (đủ cho order/billing dùng)
        CustomerDTO getCustomerById(Long id);
    }

