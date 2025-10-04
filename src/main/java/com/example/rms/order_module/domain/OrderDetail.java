package com.example.rms.order_module.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "orders_order_details")
public class OrderDetail {
    @Id
    private String id;
    
    @ManyToOne
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;
    
    @Column(name = "product_id", nullable = false)
    private String productId;
    
    private Integer quantity;
    private Double price;
    
    public void setId(String id) {
        this.id = id;
    }
    
    public void setOrder(Order order) {
        this.order = order;
    }
    
    public void setProductId(String productId) {
        this.productId = productId;
    }
    
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    
    public void setPrice(Double price) {
        this.price = price;
    }
    
    public String getId() {
        return id;
    }
    
    public Order getOrder() {
        return order;
    }
    
    public String getProductId() {
        return productId;
    }
    
    public Integer getQuantity() {
        return quantity;
    }
    
    public Double getPrice() {
        return price;
    }
}

