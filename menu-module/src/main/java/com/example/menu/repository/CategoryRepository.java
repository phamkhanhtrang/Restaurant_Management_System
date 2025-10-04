package com.example.repository;

import com.example.domain.MenuCategory;
import com.example.domain.MenuProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


import java.util.Optional;

@Repository
@Service
public interface CategoryRepository extends JpaRepository <MenuCategory, String> {
    Optional<MenuProduct> findByName(String name);
}
