package com.example.rms.billing_module.facade;

import com.example.rms.billing_module.domain.Billing;
import com.example.rms.billing_module.domain.BillingDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BillingFacade {

    List<String> getAllActivePayment();
}
