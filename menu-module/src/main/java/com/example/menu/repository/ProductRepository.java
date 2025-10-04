package com.example.menu.repository;

import com.example.menu.domain.MenuCategory;
import com.example.menu.domain.MenuProduct;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ProductRepository extends JpaRepository<MenuProduct, String> {
    Optional<MenuProduct> findByCategory(MenuCategory category);
    
    Optional<MenuProduct> findByCategory_Id(String categoryId);
    
    Optional<MenuProduct> findByName(String name);
}
