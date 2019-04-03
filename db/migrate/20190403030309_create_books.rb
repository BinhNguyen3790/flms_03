class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :author, foreign_key: true
      t.references :category, foreign_key: true
      t.references :publisher, foreign_key: true
      t.string :name
      t.string :author
      t.string :category
      t.string :content
      t.date :year
      t.string :publisher
      t.integer :number_of_pages
      t.integer :quantity
      t.timestamps
    end
  end
end
