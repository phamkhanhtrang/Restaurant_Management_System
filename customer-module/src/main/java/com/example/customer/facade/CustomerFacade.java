package com.example.customer.facade;


import com.example.customer.domain.CustomerDTO;

public interface CustomerFacade {
        
        // Kiểm tra khách hàng có tồn tại hay không
        boolean existsById(Long id);
        
        // Lấy thông tin cơ bản của khách hàng (đủ cho order/billing dùng)
        CustomerDTO getCustomerById(Long id);
    }

