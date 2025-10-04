package com.example.table.controllers;


import com.example.table.domain.TableManagementDTO;
import com.example.table.service.TableManagementService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/table")
public class TableManagementController {
    private final TableManagementService tableManagementService;
    
    public TableManagementController(TableManagementService tableManagementService) {
        this.tableManagementService = tableManagementService;
    }
    @PostMapping
    public ResponseEntity<TableManagementDTO>createTable(
            @RequestBody TableManagementDTO dto
    ){
        TableManagementDTO table  = tableManagementService.createTable(dto);
        return ResponseEntity.ok(table);
    }
    @GetMapping
    public ResponseEntity<List<TableManagementDTO>>getAllTables(){
        return ResponseEntity.ok(tableManagementService.getAllTables());
    }
    
    @PutMapping("/{id}")
    public ResponseEntity <TableManagementDTO> updateTable (@PathVariable String id, @RequestBody TableManagementDTO dto){
        TableManagementDTO updateTable = tableManagementService.updateTable(id,dto);
        return ResponseEntity.ok(updateTable);
    }
   
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTableById(@PathVariable String id) {
        tableManagementService.deleteTableById(id);
        return ResponseEntity.noContent().build();
    }
    
}
