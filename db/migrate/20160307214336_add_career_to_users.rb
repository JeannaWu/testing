class AddCareerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :career, :string
  end
end
