package com.example.rms.billing_module.service;

import com.example.rms.billing_module.domain.BillingDTO;
import com.example.rms.customer_module.domain.CustomerDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BillingService {
    BillingDTO createPayment(BillingDTO dto);
    BillingDTO getPaymentById(String id);
    List<BillingDTO> getAllPayment();
    BillingDTO updatePayment(String id, BillingDTO dto);
    void deleteBilling(String id);

}
