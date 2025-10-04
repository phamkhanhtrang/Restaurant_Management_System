package com.example.service;

import com.example.domain.OrderDTO;

import java.util.List;

public interface OrderService {
    OrderDTO createOrder(OrderDTO dto);
    OrderDTO getOrderById(String id);
    List<OrderDTO> getAllOrders();
    void deleteOrder(String id);
}
