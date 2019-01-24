Deface::Override.new(virtual_path: 'spree/admin/general_settings/edit',
  name: 'add_shipment_api_settings',
  insert_before: "div.form-actions",
  text: "
  <div class='row'>
    <div class='col-xs-12 col-md-6'>
      <div class='panel panel-default currency'>
        <div class='panel-heading'>
          <h1 class='panel-title'>
          <%= Spree.t(:shipment_api_settings)%>
          </h1>
        </div>
        <div class='panel-body'>
          <%= label_tag(Spree.t('shipment_api_url')) %>
          <%= preference_field_tag('shipment_api_url', Spree::Config['shipment_api_url'], type: 'string') %>
          <%= label_tag(Spree.t('shipment_api_key')) %>
          <%= preference_field_tag('shipment_api_key', Spree::Config['shipment_api_key'], type: 'string') %>
        </div>
      </div>
    </div>
  </div>
  ")