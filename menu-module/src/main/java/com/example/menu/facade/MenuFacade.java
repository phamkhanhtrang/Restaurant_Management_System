package com.example.menu.facade;

import com.example.menu.domain.MenuProductDTO;
import org.springframework.stereotype.Service;

@Service
public interface MenuFacade {
    boolean exitsProductById(String id);
    MenuProductDTO getProductById(String id);
}
