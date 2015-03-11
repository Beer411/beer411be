class AddIndexToBeersName < ActiveRecord::Migration
  def change
    add_index :beers, :name
  end
end
