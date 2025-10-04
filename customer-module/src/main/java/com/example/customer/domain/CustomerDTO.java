package com.example.domain;

import jakarta.annotation.Nullable;

import java.time.LocalDateTime;

public record CustomerDTO (
                            Long id,
                            String uuid,
                            String userName,
                            String password,
                            Integer activated,
                            String imageUrl,
                            CustomerProfileDTO profile
){
    
    
    public CustomerDTO(Long id, String uuid, String userName, String password, Integer activated, String imageUrl, CustomerProfileDTO profile) {
        this.id = id;
        this.uuid = uuid;
        this.userName = userName;
        this.password = password;
        this.activated = activated;
        this.imageUrl = imageUrl;
        this.profile = profile;
    }
    
    @Override
    public String password() {
        return password;
    }
    
    @Override
    @Nullable
    public CustomerProfileDTO profile() {
        return profile;
    }
    
    @Override
    public Long id() {
        return id;
    }
    
    @Override
    public String uuid() {
        return uuid;
    }
    
    @Override
    public String userName() {
        return userName;
    }
    
    @Override
    public Integer activated() {
        return activated;
    }
    
    @Override
    public String imageUrl() {
        return imageUrl;
    }
    

    
    
}

