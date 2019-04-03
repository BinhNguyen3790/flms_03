class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.string :status, default: 0, null:false
      t.datetime :from_date
      t.datetime :to_date
      t.timestamps
    end
  end
end
