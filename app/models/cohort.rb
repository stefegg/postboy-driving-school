class Cohort < ApplicationRecord
  has_many :students
  def cohort_dates
    self.start_date.to_s + " - " + self.end_date.to_s
  end
end
