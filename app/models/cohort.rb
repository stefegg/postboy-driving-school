class Cohort < ApplicationRecord
  has_many :students
  def select_cohort
    "Name :" + self.name + ", Dates : " + self.cohort_dates
  end
  def cohort_dates
    self.start_date.to_s + " - " + self.end_date.to_s
  end
end
