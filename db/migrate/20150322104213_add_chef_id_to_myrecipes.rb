class AddChefIdToMyrecipes < ActiveRecord::Migration
  def change
  	add_column :myrecipes, :chef_id, :integer
  end
end
