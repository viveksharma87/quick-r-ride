class Vehicle < ApplicationRecord
  belongs_to :person
  mount_uploader :image, ImageUploader
  validates :number, :modal, :seater, :type, :image, presence: true
end
