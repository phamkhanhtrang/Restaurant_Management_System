package com.example.rms.menu_module.facade;

import com.example.rms.menu_module.domain.MenuProductDTO;
import org.springframework.stereotype.Service;

@Service
public interface MenuFacade {
    boolean exitsProductById(String id);
    MenuProductDTO getProductById(String id);
}
