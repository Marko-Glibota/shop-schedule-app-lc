class Schedule < ApplicationRecord
  belongs_to :shop
  validates :weekday, presence: true, numericality: { only_integer: true }
end
