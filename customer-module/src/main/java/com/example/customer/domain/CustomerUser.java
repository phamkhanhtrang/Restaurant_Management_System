package com.example.domain;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

@Entity
@Table(name = "customer_user")
public class CustomerUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String uuid;
    @Column(name = "user_name", nullable = false, length = 100)
    private String userName;

    private String password;

    private Integer activated = 0;
    @Column(name = "activation_key", length = 100)
    private String activationKey;
    @Column(name = "reset_key", length = 100)
    private String resetKey;
    @Column(name = "target_key", length = 100)
    private String targetKey;
    @Column(name = "image_url", length = 255)
    private String imageUrl;
    
    @OneToOne(mappedBy = "customer", cascade = CascadeType.ALL)
    @JsonIgnore
    private CustomerProfile profile;
    @Column(name = "created_at", updatable = false, insertable = false)
    private LocalDateTime createdAt;
    @Column(name = "updated_at", insertable = false)
    private LocalDateTime updatedAt;
    
    
    
    public void setProfile(CustomerProfile profile) {
        this.profile = profile;
    }
    
    public CustomerProfile getProfile() {
        return profile;
    }
    
    
    public void setId(Long id) {
        this.id = id;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setActivated(Integer activated) {
        this.activated = activated;
    }

    public void setActivationKey(String activationKey) {
        this.activationKey = activationKey;
    }

    public void setResetKey(String resetKey) {
        this.resetKey = resetKey;
    }

    public void setTargetKey(String targetKey) {
        this.targetKey = targetKey;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
    
    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public Long getId() {
        return id;
    }

    public String getUuid() {
        return uuid;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public Integer getActivated() {
        return activated;
    }

    public String getActivationKey() {
        return activationKey;
    }

    public String getResetKey() {
        return resetKey;
    }

    public String getTargetKey() {
        return targetKey;
    }

    public String getImageUrl() {
        return imageUrl;
    }
    
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
    
    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }
}
