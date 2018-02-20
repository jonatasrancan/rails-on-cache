class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :book, index: true, foreign_key: true, null: false
      t.string :author
      t.string :body
      t.integer :rate

      t.timestamps
    end
  end
end
