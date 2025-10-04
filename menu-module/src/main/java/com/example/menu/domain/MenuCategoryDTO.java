package com.example.menu.domain;

import java.util.List;

public record MenuCategoryDTO(
        String id,
        String name,
        String icon_url,
        List<MenuProductDTO> products
) {
    
    @Override
    public List<MenuProductDTO> products() {
        return products;
    }
    
    @Override
    public String id() {
        return id;
    }
    
    @Override
    public String name() {
        return name;
    }
    
    @Override
    public String icon_url() {
        return icon_url;
    }
    


//    @Override
//    public MenuProduct product() {
//        return product;
//    }
}
