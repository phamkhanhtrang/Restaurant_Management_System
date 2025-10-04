package com.example.repository;

import com.example.domain.MenuCategory;
import com.example.domain.MenuProduct;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ProductRepository extends JpaRepository<MenuProduct, String> {
    Optional<MenuProduct> findByCategory(MenuCategory category);
    
    Optional<MenuProduct> findByCategory_Id(String categoryId);
    
    Optional<MenuProduct> findByName(String name);
}
