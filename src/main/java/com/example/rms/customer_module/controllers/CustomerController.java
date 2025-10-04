package com.example.rms.customer_module.controllers;

import com.example.rms.customer_module.domain.CustomerDTO;
import com.example.rms.customer_module.domain.CustomerProfileDTO;
import com.example.rms.customer_module.domain.CustomerUser;
import com.example.rms.customer_module.repository.CustomerRepository;
import com.example.rms.customer_module.service.CustomerService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/users")
public class CustomerController {
    
    private final CustomerService service;
    private final CustomerRepository customerRepository;
    
    
    public CustomerController(CustomerService service, CustomerRepository customerRepository) {
        this.service = service;
        this.customerRepository = customerRepository;
    }
    
    @PostMapping
    public ResponseEntity<CustomerDTO> createUser(
            @RequestBody CustomerDTO dto) {
        CustomerDTO user = service.createUser(dto);
        return ResponseEntity.ok(user);
    }
    
    @GetMapping("/{id}/profile")
    public ResponseEntity<CustomerProfileDTO> getProfile(@PathVariable Long id) {
        return ResponseEntity.ok(service.getProfileByUserId(id));
    }
    @GetMapping("/{id}")
    public ResponseEntity<CustomerDTO> getUserById(@PathVariable Long id) {
        return ResponseEntity.ok(service.getUserById(id));
    }
    
    @GetMapping
    public ResponseEntity<List<CustomerDTO>> getAllUsers() {
        return ResponseEntity.ok(service.getAllUsers());
    }

    @PutMapping("/{id}")
    public ResponseEntity <CustomerDTO> updateUser (@PathVariable Long id , @RequestBody CustomerDTO dto ){
        CustomerDTO updateUser = service.updateUser(id, dto);
        return ResponseEntity.ok(updateUser);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        service.deleteUser(id);
        return ResponseEntity.noContent().build();
    }
    @DeleteMapping("{id}/profile")
    public ResponseEntity<Void> deleteProfile(@PathVariable Long id){
        service.deleteProfileByUserId(id);
        return ResponseEntity.noContent().build();
    }
}
