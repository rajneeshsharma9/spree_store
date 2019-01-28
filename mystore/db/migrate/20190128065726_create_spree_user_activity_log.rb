class CreateSpreeUserActivityLog < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_user_activity_logs do |t|
      t.references :user
      t.text :original_request_params
      t.text :updated_request_params
      t.text :flash
      t.string :entity_name
      t.integer :response_code
      t.text :entity_errors
      t.string :ip_address
      t.timestamps
    end
  end
end
