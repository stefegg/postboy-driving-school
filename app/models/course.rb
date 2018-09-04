class Course < ApplicationRecord
  validates :name, :description, :hours, :reward, presence: true
  has_many :cohorts
  has_many :applicants
end
