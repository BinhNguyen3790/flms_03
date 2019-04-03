class CreateRequestDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :request_details do |t|
      t.references :request, foreign_key: true
      t.references :book, foreign_key: true
      t.string :quantity
      t.string :status
      t.timestamps
    end
  end
end
