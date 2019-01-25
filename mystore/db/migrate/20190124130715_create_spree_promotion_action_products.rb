class CreateSpreePromotionActionProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_promotion_action_products, force: true do |t|
      t.references :promotion_action
      t.references :product
    end
  end
end
