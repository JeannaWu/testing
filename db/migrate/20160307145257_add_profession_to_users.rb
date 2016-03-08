class AddProfessionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profession, :boolean
  end
end
