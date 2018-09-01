class Course < ApplicationRecord
  has_one_attached :photo
  has_many :cohorts
end
