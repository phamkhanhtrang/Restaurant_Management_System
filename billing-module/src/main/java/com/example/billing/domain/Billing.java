package com.example.billing.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.time.LocalDateTime;

@Entity
@Table(name = "billing_payment")
public class Billing {
    @Id
    @Column(length = 50)
    private String id;
    
    @Column(length = 100, nullable = false)
    private String name;
    
    @Column(nullable = false)
    private Integer status = 0;
    
    @Column(name = "is_deleted", nullable = false)
    private Boolean isDeleted = false;;
    
    @Column(name = "created_date", updatable = false, insertable = false)
    private LocalDateTime createdDate;
    
    @Column(name = "updated_date", updatable = false)
    private LocalDateTime updatedDate;
    
    @Column(name = "created_by", length = 100)
    private String createdBy;
    
    @Column(name = "updated_by", length = 100)
    private String updatedBy;
    
    public String getId() {
        return id;
    }
    
    public String getName() {
        return name;
    }
    
    public Integer getStatus() {
        return status;
    }
    
    public Boolean getDeleted() {
        return isDeleted;
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
    
    public void setId(String id) {
        this.id = id;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    
    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
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
}
