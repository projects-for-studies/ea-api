class CreateAuctionWinners < ActiveRecord::Migration[6.1]
  def change
    create_table :auction_winners do |t|
      t.references :product, null: false, foreign_key: true
      t.references :auction, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
