Deface::Override.new(virtual_path: 'spree/admin/variants/index',
  name: 'add_sale_price_to_admin_variants_index',
  insert_before: "th.actions",
  text: "
    <th>Sale Price</th>
  ")

Deface::Override.new(virtual_path: 'spree/admin/variants/index',
  name: 'add_sale_price_to_admin_variants_index_table',
  insert_before: "td.actions",
  text: "
  <% if variant.sale_price.present? %>
    <td class='text-center'><%= number_to_currency(variant.sale_price) %></td>
  <% else %>
    <td class='text-center'>NA</td>
  <% end %>
  ")
