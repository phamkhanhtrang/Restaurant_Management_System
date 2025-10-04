package com.example.table.facade;

import com.example.table.domain.TableManagementDTO;
import com.example.table.service.TableManagementService;
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
