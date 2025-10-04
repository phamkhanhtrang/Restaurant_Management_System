package com.example.rms.menu_module.repository;

import com.example.rms.menu_module.domain.MenuCategory;
import com.example.rms.menu_module.domain.MenuProduct;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ProductRepository extends JpaRepository<MenuProduct, String> {
    Optional<MenuProduct> findByCategory(MenuCategory category);
    
    Optional<MenuProduct> findByCategory_Id(String categoryId);
    
    Optional<MenuProduct> findByName(String name);
}
