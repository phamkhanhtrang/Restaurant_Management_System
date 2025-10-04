package com.example.table.respository;

import com.example.table.domain.TableManagement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TableManagementRepository extends JpaRepository <TableManagement, String>{
    List<TableManagement> findAllByName (String name);
    List<TableManagement> findAllByStatus (Integer status);
    List<TableManagement> findAllByCapacity (Integer capacity);
    
    
}
