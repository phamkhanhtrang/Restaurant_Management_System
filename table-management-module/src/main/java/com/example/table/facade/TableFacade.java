package com.example.facade;

import com.example.domain.TableManagementDTO;
import org.springframework.stereotype.Service;

@Service
public interface TableFacade {
    boolean exitsByTableId(String id);
    TableManagementDTO getTableById(String id);
}
