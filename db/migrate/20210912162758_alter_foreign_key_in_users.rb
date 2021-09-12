class AlterForeignKeyInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :adress_id, true
  end
end
