package com.example.menu.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "menu_category")
public class MenuCategory {
    
    @Id
    @Column(name = "id", length = 100)
    private String id;
    
    @Column(name = "name", length = 100, nullable = false)
    private String name;
    
    @Column(name = "icon_url", length = 255)
    private String iconUrl;
    

    @OneToMany(mappedBy = "category", cascade = CascadeType.PERSIST)
    @JsonIgnore
    private List<MenuProduct> products;
    
    public void setId(String id) {
        this.id = id;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public void setIcon_url(String icon_url) {
        this.iconUrl = icon_url;
    }
    
    
    public String getId() {
        return id;
    }
    
    public String getName() {
        return name;
    }
    
    public String getIcon_url() {
        return iconUrl;
    }
    
    public void setProduct(List<MenuProduct> product) {
        this.products = products;
    }
    
    public List<MenuProduct> getProduct() {
        return products;
    }
}
