package com.example.service;

import com.example.domain.BillingDTO;

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
