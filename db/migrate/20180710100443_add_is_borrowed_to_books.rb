class AddIsBorrowedToBooks < ActiveRecord::Migration[5.2]
  def change
  add_column :books, :is_borrowed, :boolean ,default: 0
  end
end
