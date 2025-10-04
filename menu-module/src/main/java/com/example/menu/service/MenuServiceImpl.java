package com.example.service;

import com.example.domain.MenuCategory;
import com.example.domain.MenuCategoryDTO;
import com.example.domain.MenuProduct;
import com.example.domain.MenuProductDTO;
import com.example.repository.CategoryRepository;
import com.example.repository.ProductRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MenuServiceImpl implements MenuService{
    private final CategoryRepository categoryRepository;
    private final ProductRepository productRepository;
    
    public MenuServiceImpl(CategoryRepository categoryRepository, ProductRepository productRepository) {
        this.categoryRepository = categoryRepository;
        this.productRepository = productRepository;
    }
    
    @Override
    public MenuCategoryDTO createCategory(MenuCategoryDTO dto) {
        MenuCategory category = new MenuCategory();
        category.setId(dto.id());
        category.setName(dto.name());
        category.setIcon_url(dto.icon_url());
        
        MenuCategory saved = categoryRepository.save(category);
        return toDTO(saved);
    }
    
    @Override
    public List<MenuCategoryDTO> getAllCategory() {
        return categoryRepository.findAll().stream()
                       .map(this::toDTO)
                       .toList();
    }
    
    @Override
    public MenuCategoryDTO updateCategoryById(String id, MenuCategoryDTO dto) {
        MenuCategory category = categoryRepository.findById(id)
                                        .orElseThrow(()-> new EntityNotFoundException("Category not found width ID"+id));
        category.setName(dto.name());
        category.setIcon_url(dto.icon_url());
        return toDTO(categoryRepository.save(category));
    }
    
    @Override
    public void deleteCategoryById(String id) {
        if (!categoryRepository.existsById(id)) {
            throw new EntityNotFoundException("Customer not found with ID: " + id);
        }
        productRepository.deleteById(id);
    }

    @Override
    public MenuProductDTO createProduct(String categoryID, MenuProductDTO dto) {
  
        MenuCategory category = categoryRepository.findById(categoryID)
                                        .orElseThrow(() -> new EntityNotFoundException("Category not found with ID " + categoryID));
        
        MenuProduct product = new MenuProduct();
        product.setId(dto.id());
        product.setName(dto.name());
        product.setDescription(dto.description());
        product.setPrice(dto.price());
        product.setPricePromotion(dto.pricePromotion());
        product.setImageUrl(dto.imageUrl());
        product.setCategory(category);
        product.setIs_deleted(dto.isDeleted());
        product.setCreatedBy("sysem");
        
        MenuProduct savedProduct = productRepository.save(product);
        return toDTO(savedProduct);
    }
    
    
    @Override
    public List<MenuCategoryDTO> getCategoryById(String categoryId) {
        MenuCategory category = categoryRepository.findById(categoryId)
                                        .orElseThrow(() -> new EntityNotFoundException("Category not found with ID: " + categoryId));
        
        return List.of(toDTO(category));
        
    }
    
    @Override
    public MenuProductDTO getProductById(String id) {
        MenuProduct product = productRepository.findById(id)
                                      .orElseThrow(()->new EntityNotFoundException("Category not found width ID"+id));
        
        return toDTO(product);
    }
    
    @Override
    public MenuProductDTO updateProductById(String categoryID, MenuProductDTO dto, String id) {
        MenuCategory category = categoryRepository.findById(categoryID)
                                        .orElseThrow(()-> new EntityNotFoundException("Category not found width ID"+categoryID));
        MenuProduct product = productRepository.findById(id)
                                        .orElseThrow(()-> new EntityNotFoundException("Product not found width ID"+id));
        if (!product.getCategory().getId().equals(category.getId())) {
            throw new IllegalArgumentException("Product does not belong to category ID: " + categoryID);
        }
        
        product.setName(dto.name());
        product.setDescription(dto.description());
        product.setPrice(dto.price());
        product.setPricePromotion(dto.pricePromotion());
        product.setIs_deleted(dto.isDeleted());
        product.setImageUrl(dto.imageUrl());
        
        MenuProduct saveProduct = productRepository.save(product);
        return toDTO(saveProduct);
    }
    
    @Override
    public void deleteProductById(String id) {
//        MenuCategory category = categoryRepository.findById()
        if (!productRepository.existsById(id)) {
            throw new EntityNotFoundException("Product not found with ID: " + id);
        }
        productRepository.deleteById(id);
    }
    
    
    private MenuCategoryDTO toDTO(MenuCategory entity) {
        List<MenuProductDTO> productDTOs = new ArrayList<>();
        if (entity.getProduct() != null) {
            productDTOs = entity.getProduct().stream()
                                  .map(this::toDTO)       // dùng toDTO(MenuProduct) đã viết trước
                                  .collect(Collectors.toList());
        }
        return new MenuCategoryDTO(
                entity.getId(),
                entity.getName(),
                entity.getIcon_url(),
                productDTOs
                
        );
    }
    private MenuProductDTO toDTO(MenuProduct entity) {
        return new MenuProductDTO(
                entity.getId(),
                entity.getName(),
                entity.getDescription(),
                entity.getPricePromotion(),
                entity.getPrice(),
                entity.getImageUrl(),
                entity.getIs_deleted(),
                entity.getCreatedBy()
                
        
        );
    }
}
