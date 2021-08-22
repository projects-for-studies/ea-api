class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.text :photos
      t.decimal :minimum_bid_amount
      t.decimal :final_bid_amount

      t.timestamps
    end
  end
end
