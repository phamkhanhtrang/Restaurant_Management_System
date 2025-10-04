package com.example.order.service;

import com.example.order.domain.OrderDTO;

import java.util.List;

public interface OrderService {
    OrderDTO createOrder(OrderDTO dto);
    OrderDTO getOrderById(String id);
    List<OrderDTO> getAllOrders();
    void deleteOrder(String id);
}
