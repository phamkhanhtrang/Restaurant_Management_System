package com.example.domain;

public record OrderDetailDTO (
        String id,
        String orderId,
        String productId,
        Integer quantity,
        Double price
){
    @Override
    public String id() {
        return id;
    }
    
    @Override
    public String orderId() {
        return orderId;
    }
    
    public String productId() {
        return productId;
    }
    
    @Override
    public Integer quantity() {
        return quantity;
    }
    
    @Override
    public Double price() {
        return price;
    }
}
