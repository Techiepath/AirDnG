class Guest < ActiveRecord::Base
	has_many :reservations
	has_many :places, through: :reservations

	validates :name, :phone_number, :presence => true
end
