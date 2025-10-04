package com.example.table.domain;

import java.time.LocalDateTime;

public record TableManagementDTO (
        String id,
        String name,
        Integer capacity,
        Integer status,
        String area,
        Boolean isDeleted,
        String updatedBy
        
){
    
    @Override
    public String id() {
        return id;
    }
    
    @Override
    public String name() {
        return name;
    }
    
    @Override
    public Integer capacity() {
        return capacity;
    }
    
    @Override
    public Integer status() {
        return status;
    }
    
    @Override
    public String area() {
        return area;
    }
    
    @Override
    public Boolean isDeleted() {
        return isDeleted;
    }
    
    @Override
    public String updatedBy() {
        return updatedBy;
    }
}
