package com.example.billing.facade;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BillingFacade {

    List<String> getAllActivePayment();
}
