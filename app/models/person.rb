class Person < ApplicationRecord
	has_many :vehicles
	validates :first_name, :last_name, :user_name, :email, :mobile_number, :password, presence: true
	validates_confirmation_of :password, message: " and password should be same"
end
