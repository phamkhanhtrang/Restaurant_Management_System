package com.example.menu.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "menu_product")
public class MenuProduct {
    
    @Id
    @Column(name ="id", length = 50)
    private String id;
    
    @ManyToOne
    @JoinColumn(name = "cate_id") // cột foreign key trong DB
    private MenuCategory category;
    
    public MenuCategory getCategory() {
        return category;
    }
    
    public Boolean getDeleted() {
        return isDeleted;
    }
    
    public Float getPricePromotion() {
        return pricePromotion;
    }
    
    public String getImageUrl() {
        return imageUrl;
    }
    
    
    public String getCreatedBy() {
        return createdBy;
    }
    
    private String name;
    
    private String description;
    
    @Column (name = "price")
    private Float price;
    
    @Column (name = "price_promotion")
    private Float pricePromotion;
    
    @Column (name = "image_url", nullable = false, length = 255)
    private String imageUrl;
    
    @Column (name = "is_deleted")
    private Boolean isDeleted;
    
    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }
    
    @Column (name = "created_by", length = 100)
    private String createdBy;
    
    public void setId(String id) {
        this.id = id;
    }
    
    public void setCategory(MenuCategory category) {
        this.category = category;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public void setPrice(Float price) {
        this.price = price;
    }
    
    
    public void setIs_deleted(Boolean is_deleted) {
        this.isDeleted = isDeleted;
    }
    
    public String getId() {
        return id;
    }
    
    
    public void setPricePromotion(Float pricePromotion) {
        this.pricePromotion = pricePromotion;
    }
    
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    

    
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
    
    public String getName() {
        return name;
    }
    
    public String getDescription() {
        return description;
    }
    
    public Float getPrice() {
        return price;
    }
    
    
    public Boolean getIs_deleted() {
        return isDeleted;
    }
    
    
}
