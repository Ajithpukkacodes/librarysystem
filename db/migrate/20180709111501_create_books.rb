class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :s_no
      t.string :author_name
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
