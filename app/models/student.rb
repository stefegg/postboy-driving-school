class Student < ApplicationRecord
  belongs_to :cohort
  has_one_attached :photo
  def generate_sid
    self.sid = SecureRandom.hex(3).upcase
  end


end
