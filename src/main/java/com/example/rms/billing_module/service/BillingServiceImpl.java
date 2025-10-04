package com.example.rms.billing_module.service;

import com.example.rms.billing_module.domain.Billing;
import com.example.rms.billing_module.domain.BillingDTO;
import com.example.rms.billing_module.repository.BillingRepository;
import com.example.rms.customer_module.domain.CustomerDTO;
import com.example.rms.table_management_module.domain.TableManagement;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;

import java.util.EmptyStackException;
import java.util.List;

@Service
public class BillingServiceImpl implements BillingService{
    private final BillingRepository billingRepository;
    
    public BillingServiceImpl(BillingRepository billingRepository) {
        this.billingRepository = billingRepository;
    }
    
    @Override
    public BillingDTO createPayment(BillingDTO dto) {
        Billing payment = new Billing();
        payment.setId(dto.id());
        payment.setName(dto.name());
        payment.setStatus(dto.status());
        payment.setCreatedBy(dto.createdBy());
        payment.setDeleted(dto.isDeleted());
        payment.setUpdatedBy(dto.updatedBy());
        
        Billing saved = billingRepository.save(payment);
        return toDTO(saved);
    }
    
    @Override
    public BillingDTO getPaymentById(String id) {
        Billing payment = billingRepository.findById(id)
                                        .orElseThrow(()->new EntityNotFoundException("Bill not found width ID"+id));
        
        return toDTO(payment);
    }
    
    @Override
    public List<BillingDTO> getAllPayment() {
        return billingRepository.findAll().stream()
                       .map(this::toDTO)
                       .toList();
    }
    
    @Override
    public BillingDTO updatePayment(String id, BillingDTO dto) {
        Billing payment = billingRepository.findById(id)
                                  .orElseThrow(()-> new EntityNotFoundException("Payment no found widtd "+id));
        payment.setStatus(dto.status());
        payment.setName(dto.name());
        payment.setDeleted(dto.isDeleted());
        payment.setUpdatedBy(dto.updatedBy());
        return toDTO(billingRepository.save(payment));
    }
    
    @Override
    public void deleteBilling(String id) {
        if(!billingRepository.existsById(id)){
            throw new EntityNotFoundException("Payment not found width"+id);
        }
        billingRepository.deleteById(id);
    }
    private BillingDTO toDTO (Billing entity){
        return new BillingDTO(
                entity.getId(),
                entity.getName(),
                entity.getStatus(),
                entity.getDeleted(),
                entity.getUpdatedBy(),
                entity.getCreatedBy()
        );
    }
}
