class List < ApplicationRecord
	validates :name, presence:true
	validates :description, presence: true
end