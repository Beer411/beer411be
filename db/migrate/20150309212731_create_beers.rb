class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string "name"
      t.string "flavor_profile1"
      t.string "flavor_profile2"
      t.string "flavor_profile3"
      t.string "flavor_profile4"
      t.string "flavor_profile5"
      t.text   "description"
      t.string "kind"
      t.string "brewery"
      t.timestamps null: false
    end
  end
end
