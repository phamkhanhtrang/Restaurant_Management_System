package com.example.service;

import com.example.domain.Order;
import com.example.domain.OrderDTO;
import com.example.domain.OrderDetail;
import com.example.domain.OrderDetailDTO;
import com.example.repository.OrderDetailRepository;
import com.example.repository.OrderRepository;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl implements OrderService {
    private final CustomerFacade customerFacade;
    private final TableFacade tableFacade;
    private final MenuFacade menuFacade;
    private final BillingFacade billingFacade;
    
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    
    public OrderServiceImpl(CustomerFacade customerFacade, TableFacade tableFacade, BillingFacade billingFacade, MenuFacade menuFacade, BillingFacade billingFacade1, OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.customerFacade = customerFacade;
        this.tableFacade = tableFacade;
        this.menuFacade = menuFacade;
        this.billingFacade = billingFacade1;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }
    
    @Transactional
    public OrderDTO createOrder(OrderDTO dto) {
        if (dto.userId() == null) {
            throw new IllegalArgumentException("UserID must not be null");
        }
        if (dto.tableId() == null) {
            throw new IllegalArgumentException("TableID must not be null");
        }
        
        if (!customerFacade.existsById(dto.userId())) {
            throw new IllegalArgumentException("Customer not found with id: " + dto.userId());
        }
        if (!tableFacade.exitsByTableId(dto.tableId())) {
            throw new IllegalArgumentException("Table not found with id: " + dto.tableId());
        }
        Optional<Order> existing = orderRepository.findById(dto.id());
        if (existing.isPresent()) {
            return toDTO(existing.get());
        }
        List<String> activePayments = billingFacade.getAllActivePayment();
        
        if(!activePayments.contains(dto.paymentId())){
            throw new IllegalArgumentException("Payment ID " + dto.paymentId() + " is not active or does not exist");
        }
        
        Order order = new Order();
        order.setId(dto.id() != null ? dto.id() : UUID.randomUUID().toString());
        order.setUserId(dto.userId());
        order.setPaymentId(dto.paymentId());
        order.setTableId(dto.tableId());
        order.setOrderType(dto.orderType());
        order.setCreatedDate(LocalDateTime.now());
        order.setDeleted(false);
        orderRepository.save(order);
        
        if(dto.orderDetails()!= null && !dto.orderDetails().isEmpty()){
            for (OrderDetailDTO detailDTO :dto.orderDetails()){
                createOrderDetail(detailDTO,order);
            }
        }
        
        return toDTO(order);
    }
    
    @Override
    public OrderDTO getOrderById(String id) {
        Order order = orderRepository.findById(id)
                                        .orElseThrow(()->new EntityNotFoundException("Category not found width ID"+id));
        return toDTO(order);
    }
    
    @Override
    public List<OrderDTO> getAllOrders() {
        return orderRepository.findAll().stream()
                       .map(this::toDTO)
                       .toList();
    }
    
    @Override
    public void deleteOrder(String id) {
        if (!orderRepository.existsById(id)) {
            throw new EntityNotFoundException("Customer not found with ID: " + id);
        }
        orderRepository.deleteById(id);
    }
    
    private void  createOrderDetail(OrderDetailDTO dto, Order order) {
        if (dto.productId() == null) {
            throw new IllegalArgumentException("ProductID must not be null");
        }
        if (!menuFacade.exitsProductById(dto.productId())) {
            throw new IllegalArgumentException("Product not found with id: " + dto.productId());
        }
        
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setId(dto.id());
        orderDetail.setQuantity(dto.quantity());
        orderDetail.setProductId(dto.productId());
        orderDetail.setPrice(dto.price());
        orderDetail.setOrder(order);
        
        double totalAmount = order.getTotalAmount() != null ? order.getTotalAmount() : 0.0;
        totalAmount += dto.price() * dto.quantity();
        order.setTotalAmount(totalAmount);
        
        orderDetailRepository.save(orderDetail);
        orderRepository.save(order);
    }
    
    private OrderDTO toDTO(Order order){
        List<OrderDetailDTO> orderDetailDTO = new ArrayList<>();
        if (order.getOrderDetails() != null) {
            orderDetailDTO = order.getOrderDetails().stream()
                                  .map(this::toDTO)
                                  .collect(Collectors.toList());
        }
        return new OrderDTO(
                order.getId(),
                order.getUserId(),
                order.getPaymentId(),
                order.getTableId(),
                order.getTotalAmount(),
                order.getOrderType(),
                order.getCreatedDate(),
                order.getUpdatedDate(),
                order.getCreatedBy(),
                order.getUpdatedBy(),
                order.getDeleted(),
                orderDetailDTO
        );
    }
    
    private OrderDetailDTO toDTO(OrderDetail orderDetail){
        
        return new OrderDetailDTO(
                orderDetail.getId(),
                orderDetail.getProductId(),
                orderDetail.getOrder().getId(),
                orderDetail.getQuantity(),
                orderDetail.getPrice()
        );
    }

}
