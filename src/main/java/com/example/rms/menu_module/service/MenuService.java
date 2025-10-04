package com.example.rms.menu_module.service;

import com.example.rms.menu_module.domain.MenuCategoryDTO;
import com.example.rms.menu_module.domain.MenuProductDTO;

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
