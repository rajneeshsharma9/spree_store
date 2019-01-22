Deface::Override.new(virtual_path: 'spree/users/show',
  name: 'add_store_credit_history_to_user_show',
  insert_bottom: "[data-hook='account_summary']",
  partial: "spree/users/store_credit_history")
