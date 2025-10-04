package com.example.facade;

import com.example.domain.MenuProductDTO;
import org.springframework.stereotype.Service;

@Service
public interface MenuFacade {
    boolean exitsProductById(String id);
    MenuProductDTO getProductById(String id);
}
