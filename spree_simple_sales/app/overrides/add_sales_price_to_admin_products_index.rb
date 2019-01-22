Deface::Override.new(virtual_path: 'spree/admin/products/index',
  name: 'add_sale_price_to_products_index',
  insert_before: "[data-hook='admin_products_index_header_actions']",
  text: "
    <th class='text-center'>Sale Price</th>
  ")

Deface::Override.new(virtual_path: 'spree/admin/products/index',
  name: 'add_sale_price_to_products_index_table',
  insert_before: "[data-hook='admin_products_index_row_actions']",
  text: "
  <% if product.on_sale? %>
    <td class='text-center'><%= product.sale_price %></td>
  <% else %>
    <td class='text-center'>NA</td>
  <% end %>
  ")
