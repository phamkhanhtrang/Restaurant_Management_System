package com.example.customer.domain;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "customer_profile")

public class CustomerProfile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;
    @Column (name = "first_name", nullable = false, length = 100)
    private String firstName;
    @Column (name = "middle_name", nullable = false, length = 100)
    private String middleName;
    
    @Column (name = "last_name", nullable = false, length = 100)
    private String lastName;

    private String phone;
    
    private String email;

    private LocalDateTime dob;

    private  String address;

    private String gender;
    @Column (name = "created_date", updatable = false, insertable = false)
    private LocalDateTime createdDate;
    @Column (name = "updatedDate", updatable = false)
    private LocalDateTime updatedDate;
    @Column (name = "updated_by",  length = 100)
    private String updatedBy;
    @Column (name = "created_by",  length = 100)
    private String createdBy;
    @Column (name = "is_deleted", length = 100)
    private Boolean isDeleted;
    
    @OneToOne
    @JoinColumn(name = "user_id") // cột foreign key trong DB
    private CustomerUser customer;
    
    public void setCustomer(CustomerUser customer) {
        this.customer = customer;
    }
    

    
    public void setId(String id) {
        this.id = id;
    }
    public CustomerUser getCustomer() {
        return customer;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setDob(LocalDateTime dob) {
        this.dob = dob;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
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
    
    
    public String getId() {
        return id;
    }
    
    public void setCustomerId(CustomerUser customerId) {
        customer = customerId;
    }
    
    public CustomerUser getCustomerId() {
        return customer;
    }
    
    public String getFirstName() {
        return firstName;
    }
    
    public String getMiddleName() {
        return middleName;
    }
    
    public String getLastName() {
        return lastName;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public String getEmail() {
        return email;
    }
    
    public LocalDateTime getDob() {
        return dob;
    }
    
    public String getAddress() {
        return address;
    }
    
    public String getGender() {
        return gender;
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
    
}
