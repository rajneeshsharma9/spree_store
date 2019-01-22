Deface::Override.new(virtual_path: 'spree/admin/store_credits/_form',
  name: 'add_expire_at_to_store_credit_form',
  insert_bottom: "[data-hook='admin_store_credit_form_fields']",
  text: "
    <%= f.field_container :memo, class: ['form-group'] do %>
      <%= f.label :expires_at %>
      <%= f.text_field :expires_at, value: datepicker_field_value(@store_credit.expires_at), class: 'datepicker datepicker-to form-control' %>
    <% end %>
  ")
