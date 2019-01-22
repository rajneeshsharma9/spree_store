Deface::Override.new(virtual_path: "spree/admin/orders/index",
                     insert_before: "erb[silent]:contains('@orders.any?')",
                     text: "<h3>My Orders</h3>",
                     name: "my_orders")