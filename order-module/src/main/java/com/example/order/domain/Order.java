package com.example.order.domain;


//import com.example.domain.MenuProduct;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "orders_orders")
public class Order {
    @Id
    private String id;
    
    @Column(name = "user_id", nullable = false)
    private Long userId;
    
    @Column(name = "payment_id")
    private String paymentId;
    
    @Column(name = "table_id")
    private String tableId; // FK sang table_management_table
    
    private Double totalAmount;
    private String orderType;
    
    private LocalDateTime createdDate;
    private LocalDateTime updatedDate;
    
    private String createdBy;
    private String updatedBy;
    
    private Boolean isDeleted = false;
    
    
    // Quan hệ với OrderItem
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonIgnore
    private List<OrderDetail> orderDetails ;
    
    public void setId(String id) {
        this.id = id;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    
    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }
    
    public void setTableId(String tableId) {
        this.tableId = tableId;
    }
    
    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }
    
    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }
    
    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }
    
    public void setUpdatedDate(LocalDateTime updatedDate) {
        this.updatedDate = updatedDate;
    }
    
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
    
    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }
    
    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }
    
    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }
    
    public String getId() {
        return id;
    }
    
    public Long getUserId() {
        return userId;
    }
    
    public String getPaymentId() {
        return paymentId;
    }
    
    public String getTableId() {
        return tableId;
    }
    
    public Double getTotalAmount() {
        return totalAmount;
    }
    
    public String getOrderType() {
        return orderType;
    }
    
    public LocalDateTime getCreatedDate() {
        return createdDate;
    }
    
    public LocalDateTime getUpdatedDate() {
        return updatedDate;
    }
    
    public String getCreatedBy() {
        return createdBy;
    }
    
    public String getUpdatedBy() {
        return updatedBy;
    }
    
    public Boolean getDeleted() {
        return isDeleted;
    }
    
    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }
}

