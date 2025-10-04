package com.example.rms.customer_module.domain;

public record CustomerProfileDTO(
        String id,
        String firstName,
        String middleName,
        String lastName,
        String phone,
        String gender,
        String email,
//        String address,
        Long customerId

//        LocalDateTime dob,
//        ,
//
//        LocalDateTime createdDate,
//        LocalDateTime updatedDate,
//        String updatedBy,
//        Boolean isDeleted,

) {
    @Override
    public String id() {
        return id;
    }
    
    @Override
    public String firstName() {
        return firstName;
    }
    
    @Override
    public String middleName() {
        return middleName;
    }
    
    @Override
    public String lastName() {
        return lastName;
    }
    
    @Override
    public String phone() {
        return phone;
    }
    
    @Override
    public String email() {
        return email;
    }
    
    @Override
    public Long customerId() {
        return customerId;
    }
    
    @Override
    public String gender() {
        return gender;
    }
}



