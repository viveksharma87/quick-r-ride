class Person < ApplicationRecord
	has_many :vehicles
	mount_uploader :image, ImageUploader
	validates :first_name, :email, :mobile_number, :password, :gender, presence: true
	validates_confirmation_of :password, message: " and password should be same"
	validates :mobile_number, length: {is: 10}, allow_blank: true
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/is
  validates :password, length: { minimum: 6, maximum: 20 }
  
	def name
		self.first_name + last_name
	end
end
