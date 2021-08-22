class CreateAuctions < ActiveRecord::Migration[6.1]
  def change
    create_table :auctions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :status_auction, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :final_date

      t.timestamps
    end
  end
end
