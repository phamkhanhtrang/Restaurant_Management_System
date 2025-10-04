package com.example.rms.order_module;

import com.example.rms.order_module.domain.Order;
import com.example.rms.order_module.domain.OrderDTO;

public interface Facade {
    OrderDTO getOrderById(String id );
    void markOrderAsPaisd( String orderID, String paymentId);
}
