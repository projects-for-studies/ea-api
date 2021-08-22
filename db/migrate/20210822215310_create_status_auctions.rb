class CreateStatusAuctions < ActiveRecord::Migration[6.1]
  def change
    create_table :status_auctions do |t|
      t.string :description

      t.timestamps
    end
  end
end
