package com.example.facade;

import com.example.domain.TableManagementDTO;
import com.example.service.TableManagementService;
import org.springframework.stereotype.Service;

@Service
public class TableFaceImpl implements TableFacade{
    private final TableManagementService tableManagementService;
    
    public TableFaceImpl(TableManagementService tableManagementService) {
        this.tableManagementService = tableManagementService;
    }
    
    @Override
    public boolean exitsByTableId(String id) {
        return tableManagementService.getTableById(id)!=null;
    }
    
    @Override
    public TableManagementDTO getTableById(String id) {
        return tableManagementService.getTableById(id);
    }
}
