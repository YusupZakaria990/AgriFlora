class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code
      t.string :product_name
      t.string :category
      t.integer :stock

      t.timestamps
    end
  end
end
