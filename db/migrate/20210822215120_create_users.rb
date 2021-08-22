class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :status
      t.string :gender
      t.date :date_birth
      t.string :photo
      t.string :telephone_1
      t.string :telephone_2
      t.references :adress, null: false, foreign_key: true

      t.timestamps
    end
  end
end
