Deface::Override.new(virtual_path: 'spree/admin/general_settings/edit',
  name: 'add_shipment_api_settings',
  insert_before: "div.form-actions",
  partial: 'spree/admin/general_settings/shipment_api_settings.html')
