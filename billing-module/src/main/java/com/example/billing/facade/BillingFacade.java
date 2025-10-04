package com.example.facade;

import com.example.domain.Billing;
import com.example.domain.BillingDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BillingFacade {

    List<String> getAllActivePayment();
}
