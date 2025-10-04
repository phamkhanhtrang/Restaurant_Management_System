package com.example.rms.order_module.service;

import com.example.rms.order_module.domain.OrderDTO;
import com.example.rms.order_module.domain.OrderDetailDTO;

import java.util.List;

public interface OrderService {
    OrderDTO createOrder(OrderDTO dto);
    OrderDTO getOrderById(String id);
    List<OrderDTO> getAllOrders();
    void deleteOrder(String id);
}
