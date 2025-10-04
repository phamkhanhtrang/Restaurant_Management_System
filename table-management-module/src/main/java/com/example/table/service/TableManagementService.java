package com.example.service;

import com.example.domain.TableManagement;
import com.example.domain.TableManagementDTO;
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
