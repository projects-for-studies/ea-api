class CreateProductsByAuctions < ActiveRecord::Migration[6.1]
  def change
    create_table :products_by_auctions do |t|
      t.references :product, null: false, foreign_key: true
      t.references :auction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
