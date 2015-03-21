class CreateMyrecipes < ActiveRecord::Migration
  def change
    create_table :myrecipes do |t|
    	t.string :name
    	t.text :summary
    	t.text :description
    	t.timestamps
    end
  end
end
