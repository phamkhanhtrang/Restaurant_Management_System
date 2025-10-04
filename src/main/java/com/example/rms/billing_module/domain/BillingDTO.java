package com.example.rms.billing_module.domain;

import java.time.LocalDateTime;

public record BillingDTO (
        String id,
        String name,
        Integer status,
        Boolean isDeleted,
        String createdBy,
        String updatedBy
        
){
    public BillingDTO(String id, String name, Integer status, Boolean isDeleted, String createdBy, String updatedBy) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.isDeleted = isDeleted;
        this.createdBy = createdBy;
        this.updatedBy = updatedBy;
    }
    
    @Override
    public String id() {
        return id;
    }
    
    @Override
    public String name() {
        return name;
    }
    
    @Override
    public Integer status() {
        return status;
    }
    
    @Override
    public Boolean isDeleted() {
        return isDeleted;
    }
    
    @Override
    public String createdBy() {
        return createdBy;
    }
    
    @Override
    public String updatedBy() {
        return updatedBy;
    }
}
