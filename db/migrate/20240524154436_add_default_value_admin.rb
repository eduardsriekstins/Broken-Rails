class AddDefaultValueAdmin < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :admin, :boolean, :default => false
    remove_column :users, :user_id, :integer
  end
end
