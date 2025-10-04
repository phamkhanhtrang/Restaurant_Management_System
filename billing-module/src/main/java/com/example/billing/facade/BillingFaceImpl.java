package com.example.billing.facade;

import com.example.billing.domain.BillingDTO;
import com.example.billing.service.BillingService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillingFaceImpl implements BillingFacade {
    
    private final BillingService billingService;
    
    public BillingFaceImpl(BillingService billingService) {
        this.billingService = billingService;
    }
    
    @Override
    public List<String> getAllActivePayment() {
        return billingService.getAllPayment().stream()
                       .filter(p -> !p.isDeleted() && p.status() == 1)
                       .map(BillingDTO::id)
                       .toList();
    }
}
