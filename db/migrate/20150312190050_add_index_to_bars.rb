class AddIndexToBars < ActiveRecord::Migration
  def change
    add_index :bars, :name
    add_index :bars, :address
  end
end
