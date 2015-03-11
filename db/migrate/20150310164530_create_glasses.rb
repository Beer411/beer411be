class CreateGlasses < ActiveRecord::Migration
  def change
    create_table :glasses do |t|
      t.integer "beer_id"
      t.integer "bar_id"
      t.timestamps null: false
    end
  end
end
