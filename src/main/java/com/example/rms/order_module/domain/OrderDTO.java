package com.example.rms.order_module.domain;

import java.time.LocalDateTime;
import java.util.List;

public record OrderDTO(
        String id,
        Long userId,
        String paymentId,
        String tableId,
        Double totalAmount,
        String orderType,
        LocalDateTime createdDate,
        LocalDateTime updatedDate,
        String createdBy,
        String updatedBy,
        Boolean isDeleted,
        List<OrderDetailDTO> orderDetails
) {
    
    @Override
    public String id() {
        return id;
    }
    
    @Override
    public Long userId() {
        return userId;
    }
    
    @Override
    public String paymentId() {
        return paymentId;
    }
    
    @Override
    public String tableId() {
        return tableId;
    }
    
    @Override
    public Double totalAmount() {
        return totalAmount;
    }
    
    @Override
    public String orderType() {
        return orderType;
    }
    
    @Override
    public LocalDateTime createdDate() {
        return createdDate;
    }
    
    @Override
    public LocalDateTime updatedDate() {
        return updatedDate;
    }
    
    @Override
    public String createdBy() {
        return createdBy;
    }
    
    @Override
    public String updatedBy() {
        return updatedBy;
    }
    
    @Override
    public Boolean isDeleted() {
        return isDeleted;
    }
    
//    @Override
//    public List<OrderDetailDTO> orderDetails() {
//        return orderDetails;
//    }

//    @Override
//    public List<OrderDetail> orderDetails() {
//        return orderDetails;
//    }
}
