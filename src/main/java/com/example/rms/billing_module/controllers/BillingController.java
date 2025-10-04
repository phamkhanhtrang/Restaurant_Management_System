package com.example.rms.billing_module.controllers;


import com.example.rms.billing_module.domain.BillingDTO;
import com.example.rms.billing_module.service.BillingService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/billing")
public class BillingController {
    private final BillingService billingService;
    
    public BillingController(BillingService billingService) {
        this.billingService = billingService;
    }
    @PostMapping
    public ResponseEntity<BillingDTO>createPayment(
            @RequestBody BillingDTO dto
    ){
        BillingDTO  payment = billingService.createPayment(dto);
        return ResponseEntity.ok(payment);
    }
    @GetMapping
    public ResponseEntity<List<BillingDTO>>getAllPayment(){
        return ResponseEntity.ok(billingService.getAllPayment());
    }
    @GetMapping("/{id}")
    public ResponseEntity<BillingDTO>getPaymentById(@PathVariable String id){
        
        return ResponseEntity.ok(billingService.getPaymentById(id));
    }
    @PutMapping("/{id}")
    public ResponseEntity<BillingDTO>updatePayment(
            @RequestBody BillingDTO dto,
            @PathVariable String id ){
        BillingDTO updatePayment = billingService.updatePayment(id,dto);
        return ResponseEntity.ok(updatePayment);
    }
    @DeleteMapping ("/{id}")
    public ResponseEntity <BillingDTO>deleteBilling(@PathVariable String id){
        billingService.deleteBilling(id);
        return ResponseEntity.noContent().build();
    }
}
