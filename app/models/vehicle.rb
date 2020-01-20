class Vehicle < ApplicationRecord
  belongs_to :person
  validates :number, :modal, :seater, :type, presence: true
end
