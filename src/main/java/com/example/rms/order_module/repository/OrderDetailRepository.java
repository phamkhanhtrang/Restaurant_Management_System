package com.example.rms.order_module.repository;

import com.example.rms.order_module.domain.Order;
import com.example.rms.order_module.domain.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, String> {
    List<OrderDetail> findByOrderId(String orderId);
}
