package com.example.rms.menu_module.controllers;

import com.example.rms.menu_module.domain.MenuCategoryDTO;
import com.example.rms.menu_module.domain.MenuProductDTO;
import com.example.rms.menu_module.service.MenuService;
import com.example.rms.table_management_module.domain.TableManagementDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping ("api/menu")
public class MenuController {
    private final MenuService menuService;

    
    public MenuController(MenuService menuService) {
        this.menuService = menuService;
    }
    @PostMapping
    public ResponseEntity<MenuCategoryDTO> createCategory(
            @RequestBody MenuCategoryDTO dto
    ){
        MenuCategoryDTO table  = menuService.createCategory(dto);
        return ResponseEntity.ok(table);
    }
    @GetMapping
    public ResponseEntity<List<MenuCategoryDTO>>getAllCategory(){
        return ResponseEntity.ok(menuService.getAllCategory());
    }
    
    @PutMapping("/{menuId}")
    public ResponseEntity <MenuCategoryDTO> updateCategoryById (@PathVariable String menuId, @RequestBody MenuCategoryDTO dto){
        MenuCategoryDTO updateCategoryById = menuService.updateCategoryById(menuId,dto);
        return ResponseEntity.ok(updateCategoryById);
    }
//    @GetMapping("/{menuId}")
//    public ResponseEntity <MenuCategoryDTO> getCategoryById (@PathVariable String menuId, @RequestBody MenuCategoryDTO dto){
//        MenuCategoryDTO getCategoryById = menuService.getCategoryById(menuId);
//        return ResponseEntity.ok(getCategoryById);
//    }
    @DeleteMapping("/{menuId}")
    public ResponseEntity<Void> deleteCategoryById(@PathVariable String menuId) {
        menuService.deleteCategoryById(menuId);
        return ResponseEntity.noContent().build();
    }
    @PostMapping("/{menuId}/product")
    public ResponseEntity<MenuProductDTO>createProduct(
            @PathVariable String menuId,
            @RequestBody MenuProductDTO dto
    ){
        MenuProductDTO product  =menuService.createProduct(menuId,dto);
        return ResponseEntity.ok(product);
    }
    @GetMapping("/{menuId}/product")
    public ResponseEntity<List<MenuCategoryDTO>>getCategoryById(
    @PathVariable String menuId
    ){
        return ResponseEntity.ok(menuService.getCategoryById(menuId));
    }
    
    @PutMapping("/{menuId}/product/{id}")
    public ResponseEntity <MenuProductDTO> updateProductById (
            @PathVariable String menuId,
            @PathVariable String id,
            @RequestBody MenuProductDTO dto){
        MenuProductDTO updateProductById = menuService.updateProductById(menuId,dto, id);
        return ResponseEntity.ok(updateProductById);
    }
    
    @DeleteMapping("/{menuId}/product/{id}")
    public ResponseEntity<Void> deleteProductById(@PathVariable String id) {
        menuService.deleteProductById(id);
        return ResponseEntity.noContent().build();
    }
}
