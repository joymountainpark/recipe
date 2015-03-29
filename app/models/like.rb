class Like < ActiveRecord::Base
	belongs_to :chef
	belongs_to :myrecipe

	validates_uniqueness_of :chef, scope: :myrecipe
end