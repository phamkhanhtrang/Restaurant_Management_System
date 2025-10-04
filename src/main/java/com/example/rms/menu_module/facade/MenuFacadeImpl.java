package com.example.rms.menu_module.facade;

import com.example.rms.menu_module.domain.MenuProductDTO;
import com.example.rms.menu_module.service.MenuService;
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
