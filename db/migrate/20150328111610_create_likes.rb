class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
    	t.boolean :like
    	t.integer :chef_id, :myrecipe_id
    	t.timestamps
    end
  end
end
