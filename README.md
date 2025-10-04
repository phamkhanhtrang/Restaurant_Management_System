# Restaurant Management System (RMS)

##  Giới thiệu

**Restaurant Management System (RMS)** là hệ thống quản lý nhà hàng được xây dựng theo kiến trúc **Modular Monolith** trên nền tảng **Spring Boot**, nhằm đảm bảo khả năng mở rộng, tách biệt logic nghiệp vụ và dễ dàng bảo trì.

---

##  Cấu trúc tổng thể


- customer-module/ → Quản lý thông tin khách hàng
-  table-management-module/→ Quản lý bàn ăn, trạng thái, sức chứa
-  menu-module/ → Quản lý thực đơn, danh mục, giá món
-  order-module/ → Quản lý đơn hàng, thêm món, tính tổng tiền
- billing-module/ → Quản lý phương thức thanh toán


---

## Mô tả từng module

### **customer-module**
> Quản lý thông tin khách hàng, tài khoản.

**Chức năng chính:**
- Tạo & quản lý tài khoản khách hàng (`CustomerUser`, `CustomerProfile`)
- Giao tiếp với các module khác qua `CustomerFacade`

**Entity tiêu biểu:**
- `customer_user`, `customer_profile`

---

### 2️⃣ **table-management-module**
> Quản lý bàn ăn trong nhà hàng, bao gồm trạng thái, sức chứa.

**Chức năng chính:**
- Quản lý danh sách bàn (`Table`)
  Giao tiếp với các module khác qua `TableFacade`

**Entity tiêu biểu:**
- `table_management_table`

---

### 3️⃣ **menu-module**
> Quản lý món ăn, giá cả và danh mục món.

**Chức năng chính:**
- CRUD món ăn, danh mục
- Giao tiếp với các module khác qua `MenuFacade`

**Entity tiêu biểu:**
- `menu_category`, `menu_product`

---

### 4️⃣ **order-module**
> Xử lý nghiệp vụ tạo đơn hàng, thêm món, tính tổng tiền.

**Chức năng chính:**
- Tạo order mới (gắn với bàn, khách hàng, phương thức thanh toán)
- Thêm / xóa / cập nhật món trong order (`OrderDetail`)
  Giao tiếp với các module khác qua `CustomerFacade`

**Entity tiêu biểu:**
- `order_order`, `order_order_details`

---

### 5️⃣ **billing-module**
> Xử lý thanh toán và hóa đơn.

**Chức năng chính:**
- Quản lý phương thức thanh toán (tiền mặt, thẻ, chuyển khoản, ví điện tử)
  Giao tiếp với các module khác qua `BillingFacade`

**Entity tiêu biểu:**
- `billing_payment`

## Api
**customer-module:**

  | Endpoint                  | Method | Mô tả                                 |
  |---------------------------|--------|---------------------------------------|
  | `/api/customers`          | GET    | Lấy danh sách khách hàng              |
  | `/api/customers`          | POST   | Tạo khách hàng mới                    |
  | `/api/orders/{id}`        | DELETE | Xóa khách hàng theo id                |
  | `/api/order/{id}`         | PUT    | Cập nhật thông tin khách hàng theo id |
  | `/api/order/{id}/profile` | GET    | Lấy thông tin khách hàng theo id      |

**table-management-module:**

| Endpoint                  | Method | Mô tả                          |
|---------------------------|--------|--------------------------------|
| `/api/table`              | GET    | Lấy danh sách bàn              |
| `/api/table`              | POST   | Tạo bàn mới                    |
| `/api/table/{id}`         | DELETE | Xóa bàn theo id                |
| `/api/table/{id}`         | PUT    | Cập nhật thông tin bàn theo id |

**menu-module:**

| Endpoint                           | Method | Mô tả                        |
|------------------------------------|--------|------------------------------|
| `/api/menu`                        | GET    | Lấy danh sách menu           |
| `/api/menu`                        | POST   | Tạo menu mới                 |
| `/api/menu/{menuId}`               | DELETE | Xóa menu theo id             |
| `/api/menu/{menuId}`               | PUT    | Update thông tin theo id     |
| `/api/menu/{menuId}/product`       | POST   | Thêm sản phẩm theo menuid    |
| `/api/menu/{menuId}/product  `     | GET    | Danh sách sản phẩm theo menu |
| `/api/menu/{menuId}/product/{id}`  | DELETE | Xóa sản phẩm trong menu      |
| `/api/menu/{menuId}/product/{id}`  | PUT    | Cập nhật sản phẩm trong menu |

**billing-module:**

| Endpoint               | Method | Mô tả                                        |
|------------------------|--------|----------------------------------------------|
| `/api/billing`         | GET    | Lấy danh sách phương thanh toán              |
| `/api/billing`         | POST   | Tạo phương thanh toán mới                    |
| `/api/billing/{id}`    | DELETE | Xóa phương thanh toán theo id                |
| `/api/billing/{id}`    | PUT    | Cập nhật thông tin phương thanh toán theo id |

**order-module:**

| Endpoint               | Method | Mô tả                        |
|------------------------|--------|------------------------------|
| `/api/order`           | GET    | Lấy danh sách order          |
| `/api/order`           | POST   | Tạo order mới                |
| `/api/table/{orderId}` | DELETE | Xóa order theo id            |
| `/api/table/{orderId}` | GET    | Lấy chi tiết order theo ID |

**Test dự án:**
- Dùng phần mền Postnam
- Đường dẫn của Customer: http://localhost:8080/api/customer
- Đường dẫn của Menu: http://localhost:8080/api/menu
- Đường dẫn của Order: http://localhost:8080/api/order
- Đường dẫn của Billing: http://localhost:8080/api/billing
-  Đường dẫn của Table: http://localhost:8080/api/table

## Công nghệ sử dụng
- Java Spring Boot
- Modular Monolith
- Databse:mysql

---
## Build và run project
**1 Cấu trúc dự án**
rms/                  <-- Parent project (packaging = pom)
├── pom.xml            <-- Parent POM, liệt kê các module con
├── rms-main/          <-- Module chính chứa SpringBootApplication
│   └── src/main/java/com/example/rms/Main.java
├── customer-module/   <-- Quản lý khách hàng
├── table-management-module/  <-- Quản lý bàn ăn
├── menu-module/       <-- Quản lý thực đơn
├── order-module/      <-- Xử lý order
└── billing-module/    <-- Xử lý thanh toán

**Build Project**
mvn clean install
**Run Project*
mvn spring-boot:run -pl rms-main

**Cấu hình module chính**
- spring.datasource.url=jdbc:mysql://localhost:3306/db_rms
  spring.datasource.username=root
  spring.datasource.password=password
  spring.jpa.hibernate.ddl-auto=none
  spring.jpa.database-platform=org.hibernate.dialect.MySQLDialect

