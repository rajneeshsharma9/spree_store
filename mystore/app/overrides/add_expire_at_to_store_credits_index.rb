Deface::Override.new(virtual_path: 'spree/admin/store_credits/index',
  name: 'add_expires_at_to_store_credits_index',
  insert_before: "[data-hook='admin_store_credits_index_header_actions']",
  text: "
    <th><%= Spree.t(:expiration) %></th>
  ")

Deface::Override.new(virtual_path: 'spree/admin/store_credits/index',
  name: 'add_expires_at_to_store_credits_index_table',
  insert_before: "[data-hook='admin_store_credits_index_row_actions']",
  text: "
    <td>
      <% if store_credit.expires_at.present? %>
        <%= l store_credit.expires_at.to_date %>
      <% else %>
        NA
      <% end %>
    </td>
  ")
