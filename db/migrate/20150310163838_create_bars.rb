class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string "name"
      t.text "address"
      t.timestamps null: false
    end
  end
end
