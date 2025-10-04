package com.example.menu.facade;

import com.example.menu.domain.MenuProductDTO;
import com.example.menu.service.MenuService;
import org.springframework.stereotype.Service;

@Service
public class MenuFacadeImpl implements MenuFacade{
    private final MenuService menuService;
    
    public MenuFacadeImpl(MenuService menuService) {
        this.menuService = menuService;
    }
    
    @Override
    public boolean exitsProductById(String id) {
        return menuService.getProductById(id)!=null;
    }
    
    @Override
    public MenuProductDTO getProductById(String id) {
        return menuService.getProductById(id);
    }
}
