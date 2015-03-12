class AddDescriptionToBars < ActiveRecord::Migration
  def change
    add_column :bars, :description, :text
  end
end
