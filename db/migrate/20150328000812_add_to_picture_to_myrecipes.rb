class AddToPictureToMyrecipes < ActiveRecord::Migration
  def change
    add_column :myrecipes, :picture, :string
  end
end
