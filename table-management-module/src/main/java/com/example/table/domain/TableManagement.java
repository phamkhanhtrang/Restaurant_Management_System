package com.example.table.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jdk.jfr.Enabled;

import java.time.LocalDateTime;

@Entity
@Table(name = "table_management_table")
public class TableManagement {
    @Id
    @Column(name = "id", length = 100)
    private  String id;
    @Column (name = "name",nullable = false, length = 100)
    private  String name;
    @Column (name = "capacity", nullable = false)
    private Integer capacity;
    
    @Column (name = "is_deleted")
    private Boolean isDeleted;
    
    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }
    
    public Boolean getDeleted() {
        return isDeleted;
    }
    
    @Column(name = "status", nullable = false)
    private Integer status;
    @Column (name = "area",nullable = false)
    private  String area;

    @Column (name = "created_date",updatable = false, insertable = false )
    private LocalDateTime createdDate;
    @Column (name ="update_date", updatable = false )
    private LocalDateTime updateDate;
    @Column(name = "updated_by", nullable = false, length = 100)
    private  String updatedBy;
    

    
    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }
    
    public void setUpdateDate(LocalDateTime updateDate) {
        this.updateDate = updateDate;
    }
    
    public void setUpdateBy(String updatedDy) {
        this.updatedBy = updatedDy;
    }
    
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
    

    
    public LocalDateTime getCreatedDate() {
        return createdDate;
    }
    
    public LocalDateTime getUpdateDate() {
        return updateDate;
    }
    
    public String getUpdatedDy() {
        return updatedBy;
    }
    
    public String getCreatedBy() {
        return createdBy;
    }
    
    @Column(name = "created_by", length = 100)
    private  String createdBy;
    
    
    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
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
    
    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    
    public void setArea(String area) {
        this.area = area;
    }
    

    
    public String getId() {
        return id;
    }
    
    public String getName() {
        return name;
    }
    
    public Integer getCapacity() {
        return capacity;
    }
    
    public Integer getStatus() {
        return status;
    }
    
    public String getArea() {
        return area;
    }
    

}
