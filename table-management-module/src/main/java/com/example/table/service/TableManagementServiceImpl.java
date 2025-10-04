package com.example.service;

import com.example.domain.TableManagement;
import com.example.domain.TableManagementDTO;
import com.example.respository.TableManagementRepository;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class TableManagementServiceImpl implements TableManagementService{
    
    private final TableManagementRepository tableManagementRepository;
    
    public TableManagementServiceImpl( TableManagementRepository tableManagementRepository) {
        
        this.tableManagementRepository = tableManagementRepository;
    }
    
    @Override
    public TableManagementDTO createTable(TableManagementDTO dto) {
        TableManagement table = new TableManagement();
        table.setId(dto.id());
        table.setName(dto.name());
        table.setArea(dto.area());
        table.setCapacity(dto.capacity());
        table.setCreatedBy("admin");
        table.setStatus(dto.status());
        
        TableManagement saved = tableManagementRepository.save(table);
        return toDTO(saved);
    }
    
    @Override
    public TableManagementDTO getTableById(String id) {
        TableManagement table = tableManagementRepository.findById(id)
                                        .orElseThrow(()->new EntityNotFoundException("Table not found width ID"+id));
        
        return toDTO(table);
    }
    
    @Override
    public List<TableManagementDTO> getAllTables() {
        return tableManagementRepository.findAll().stream()
                       .map(this::toDTO)
                       .toList();
    }
    
    @Override
    public TableManagementDTO updateTable(String id, TableManagementDTO dto) {
        TableManagement table  = tableManagementRepository.findById(id)
                                         .orElseThrow(()-> new EntityNotFoundException("Table not found width ID"+id));
        table.setName(dto.name());
        table.setStatus(dto.status());
        table.setArea(dto.area());
        table.setCapacity(dto.capacity());
        table.setUpdateBy("admin");
        
        return toDTO(tableManagementRepository.save((table)));
    }
    
    @Override
    public void deleteTableById(String id) {
        if (!tableManagementRepository.existsById(id)){
            throw new EntityNotFoundException("Table not found width ID"+ id );
        }
        tableManagementRepository.deleteById(id);
    
    }
    
    private TableManagementDTO toDTO(TableManagement entity){
        return new TableManagementDTO(
                entity.getId(),
                entity.getName(),
                entity.getCapacity(),
                entity.getStatus(),
                entity.getArea(),
                entity.getDeleted(),
                entity.getUpdatedBy()
        );
    }
}
