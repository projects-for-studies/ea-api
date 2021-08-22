class CreateAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :adresses do |t|
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :street
      t.string :district
      t.string :number
      t.string :complement
      t.string :reference

      t.timestamps
    end
  end
end
