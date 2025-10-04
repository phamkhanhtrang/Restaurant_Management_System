package com.example.menu.service;

import com.example.menu.domain.MenuCategoryDTO;
import com.example.menu.domain.MenuProductDTO;

import java.util.List;

public interface MenuService {
    MenuCategoryDTO createCategory(MenuCategoryDTO dto);
    List<MenuCategoryDTO> getCategoryById(String id);
    List<MenuCategoryDTO> getAllCategory();
    MenuCategoryDTO updateCategoryById(String id, MenuCategoryDTO dto);
    void deleteCategoryById (String id);
    
    MenuProductDTO createProduct(String categoryID, MenuProductDTO dto);
    
//    List<MenuCategoryDTO> getAllProductById(String categoryID);
    MenuProductDTO getProductById(String id);
    MenuProductDTO updateProductById(String categoryID, MenuProductDTO dto, String id);
    void deleteProductById (String id);
    
}
