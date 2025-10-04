package com.example.rms.table_management_module.service;

import com.example.rms.table_management_module.domain.TableManagement;
import com.example.rms.table_management_module.domain.TableManagementDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TableManagementService {
    
    TableManagementDTO createTable (TableManagementDTO dto);
    TableManagementDTO getTableById (String id);
    List<TableManagementDTO> getAllTables();
    TableManagementDTO updateTable(String id, TableManagementDTO dto);
    void deleteTableById (String id);

}
