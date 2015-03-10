class AddAbvToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :abv, :string
  end
end
