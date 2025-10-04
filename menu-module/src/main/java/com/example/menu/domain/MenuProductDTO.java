package com.example.menu.domain;

public record MenuProductDTO(
        String id,
//        Long category,/
        String name,
        String description,
        Float price,
        Float pricePromotion,
        String imageUrl,
        Boolean isDeleted,
        String createdBy
)
{
    @Override
    public String id() {
        return id;
    }
    

    
    @Override
    public String name() {
        return name;
    }
    
    @Override
    public String description() {
        return description;
    }
    
    @Override
    public Float price() {
        return price;
    }
    
    @Override
    public Float pricePromotion() {
        return pricePromotion;
    }
    
    @Override
    public String imageUrl() {
        return imageUrl;
    }
    
    @Override
    public Boolean isDeleted() {
        return isDeleted;
    }
    
    @Override
    public String createdBy() {
        return createdBy;
    }
}
