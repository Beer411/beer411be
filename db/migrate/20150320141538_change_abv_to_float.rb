class ChangeAbvToFloat < ActiveRecord::Migration
  def change
    remove_column :beers, :abv
    add_column :beers, :abv, :float
  end
end
