class CreatePurchaseOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_options do |t|
      t.decimal :price
      t.string :quality
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
