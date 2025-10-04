package com.example.order.repository;

import com.example.order.domain.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, String> {

    List<Order> findByUserId(Long userId);
    
    List<Order> findByTableIdAndIsDeletedFalse(String tableId);
    
    List<Order> findByPaymentId(String paymentId);
}
