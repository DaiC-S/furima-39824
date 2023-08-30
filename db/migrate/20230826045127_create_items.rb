class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :image, null: false
      t.string :name, null: false
      t.text :info, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :shipping_fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :scheduled_delivery_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
