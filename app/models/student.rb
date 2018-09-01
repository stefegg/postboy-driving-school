class Student < ApplicationRecord
  belongs_to :cohort

  def generate_sid
    self.sid = SecureRandom.hex(3).upcase
  end


end
