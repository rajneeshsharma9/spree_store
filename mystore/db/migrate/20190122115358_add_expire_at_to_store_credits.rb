class AddExpireAtToStoreCredits < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_store_credits, :expires_at, :datetime
  end
end
