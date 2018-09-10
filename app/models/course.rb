class Course < ApplicationRecord
  validates :name, :description, :hours, :reward, :cost, presence: true
  has_many :cohorts
  has_one_attached :photo
end
