class AddIsAdminTousers < ActiveRecord::Migration[5.2]
  def change
  add_column :users, :is_admin, :integer ,default: 0
  end
end
