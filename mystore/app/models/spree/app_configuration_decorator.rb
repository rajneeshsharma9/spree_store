Spree::AppConfiguration.class_eval do

  preference :shipment_api_url, :string, default: 'http://localhost:1234/api/deals/shipping_amount'
  preference :shipment_api_key, :string, default: 'iw-kVcmVYRXg_Ps6UcwmdA'

end
