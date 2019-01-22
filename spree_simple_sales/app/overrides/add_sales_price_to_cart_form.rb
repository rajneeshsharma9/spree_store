Deface::Override.new(virtual_path: 'spree/products/_cart_form',
  name: 'add_sale_price_to_cart_form',
  insert_before: "span.selling",
  text: "
  <% if @product.on_sale? %>
    <strike><%= number_to_currency(@product.orig_price_in(current_currency).amount) %></strike>
  <% end %>
  ")
