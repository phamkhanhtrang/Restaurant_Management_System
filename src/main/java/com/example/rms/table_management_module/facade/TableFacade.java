package com.example.rms.table_management_module.facade;

import com.example.rms.table_management_module.domain.TableManagementDTO;
import org.springframework.stereotype.Service;

@Service
public interface TableFacade {
    boolean exitsByTableId(String id);
    TableManagementDTO getTableById(String id);
}
